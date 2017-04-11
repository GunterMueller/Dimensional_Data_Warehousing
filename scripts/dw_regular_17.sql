/*********************************************************************/
/*                                                                   */
/* dw_regular_17.sql              		                        */                  
/*                                                                   */
/*********************************************************************/

USE dw;

/* CUSTOMER_DIM POPULATION           		                        */                  

TRUNCATE customer_stg;

LOAD DATA INFILE 'customer.csv'
INTO TABLE customer_stg
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
( customer_number
, customer_name 
, customer_street_address 
, customer_zip_code 
, customer_city 
, customer_state 
, shipping_address
, shipping_zip_code
, shipping_city
, shipping_state )
;

/* SCD 2 ON ADDRESSES                                                */

UPDATE 
  customer_dim a
, customer_stg b
SET
  a.expiry_date = SUBDATE(CURRENT_DATE, 1)
WHERE
  a.customer_number = b.customer_number
AND (   a.customer_street_address <> b.customer_street_address
     OR a.customer_city <> b.customer_city
     OR a.customer_zip_code <> b.customer_zip_code
     OR a.customer_state <> b.customer_state 
     OR a.shipping_address <> b.shipping_address
     OR a.shipping_city <> b.shipping_city
     OR a.shipping_zip_code <> b.shipping_zip_code
     OR a.shipping_state <> b.shipping_state
     OR a.shipping_address IS NULL
     OR a.shipping_city IS NULL
     OR a.shipping_zip_code IS NULL
     OR a.shipping_state IS NULL)
AND expiry_date = '9999-12-31'
;

INSERT INTO customer_dim
SELECT
  NULL	
, b.customer_number
, b.customer_name
, b.customer_street_address
, b.customer_zip_code
, b.customer_city
, b.customer_state
, b.shipping_address
, b.shipping_zip_code
, b.shipping_city
, b.shipping_state
, CURRENT_DATE
, '9999-12-31'
FROM 
  customer_dim a
, customer_stg b	
WHERE 
    a.customer_number = b.customer_number
AND (   a.customer_street_address <> b.customer_street_address
     OR a.customer_city <> b.customer_city
     OR a.customer_zip_code <> b.customer_zip_code
     OR a.customer_state <> b.customer_state
     OR a.shipping_address <> b.shipping_address
     OR a.shipping_city <> b.shipping_city
     OR a.shipping_zip_code <> b.shipping_zip_code
     OR a.shipping_state <> b.shipping_state
     OR a.shipping_address IS NULL
     OR a.shipping_city IS NULL
     OR a.shipping_zip_code IS NULL
     OR a.shipping_state IS NULL)
AND EXISTS (
SELECT * 
FROM customer_dim x 
WHERE b.customer_number = x.customer_number 
AND a.expiry_date = SUBDATE(CURRENT_DATE, 1))
AND NOT EXISTS (
SELECT *
FROM customer_dim y 
WHERE     b.customer_number = y.customer_number 
      AND y.expiry_date = '9999-12-31')
;

/* END OF SCD 2                                                      */

/* SCD 1 ON NAME                                                     */

UPDATE customer_dim a, customer_stg b
SET a.customer_name = b.customer_name
WHERE     a.customer_number = b.customer_number
      AND a.expiry_date = '9999-12-31'
      AND a.customer_name <> b.customer_name
;

/* ADD NEW CUSTOMER                                                  */

INSERT INTO customer_dim
SELECT
  NULL	
, customer_number
, customer_name
, customer_street_address
, customer_zip_code
, customer_city
, customer_state
, shipping_address
, shipping_zip_code
, shipping_city
, shipping_state
, CURRENT_DATE
, '9999-12-31'
FROM customer_stg 	
WHERE customer_number NOT IN(
SELECT a.customer_number 
FROM 
  customer_dim a
, customer_stg b
WHERE b.customer_number = a.customer_number )
;

/* RE-BUILD PA CUSTOMER DIMENSION                                    */

TRUNCATE pa_customer_dim;

INSERT INTO pa_customer_dim
SELECT
  customer_sk
, customer_number
, customer_name
, customer_street_address
, customer_zip_code
, customer_city
, customer_state
, shipping_address
, shipping_zip_code
, shipping_city
, shipping_state
, effective_date
, expiry_date
FROM customer_dim
WHERE customer_state = 'PA'
;

/* END OF CUSTOMER_DIM POPULATION    		                        */                  

/* PRODUCT_DIM POPULATION                                            */

TRUNCATE product_stg
;

LOAD DATA INFILE 'product.txt'
INTO TABLE product_stg
FIELDS TERMINATED BY ''
OPTIONALLY ENCLOSED BY ''
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
( product_code
, product_name 
, product_category )
;

/* SCD2 ON PRODUCT NAME AND GROUP                                    */

UPDATE 
  product_dim a
, product_stg b
SET
  expiry_date = SUBDATE(CURRENT_DATE, 1)
WHERE
    a.product_code = b.product_code
AND (   a.product_name <> b.product_name
     OR a.product_category <> b.product_category )
     AND expiry_date = '9999-12-31'
;

INSERT INTO product_dim 
SELECT
  NULL	
, b.product_code
, b.product_name
, b.product_category
, CURRENT_DATE
, '9999-12-31'
FROM 
  product_dim a
, product_stg b	
WHERE 
    a.product_code = b.product_code
AND (   a.product_name <> b.product_name
     OR a.product_category <> b.product_category )
AND EXISTS (
SELECT * 
FROM product_dim x 
WHERE     b.product_code = x.product_code 
      	      AND a.expiry_date = SUBDATE(CURRENT_DATE, 1))
AND NOT EXISTS (
SELECT *
FROM product_dim y 
WHERE    b.product_code = y.product_code 
             AND y.expiry_date = '9999-12-31')
;

/* END OF SCD 2                                                      */

/* ADD NEW PRODUCT                                                   */

INSERT INTO product_dim
SELECT
  NULL	
, product_code
, product_name
, product_category
, CURRENT_DATE
, '9999-12-31'
FROM product_stg 	
WHERE product_code NOT IN(
SELECT y.product_code 
FROM product_dim x, product_stg y 
WHERE x.product_code = y.product_code )
;

/* END OF PRODUCT_DIM POPULATION     		                        */                  

/* insert new orders                                                 */                  

INSERT INTO sales_order_fact
SELECT
  customer_sk
, product_sk
, e.order_date_sk
, NULL
, NULL
, NULL
, NULL
, a.order_number
, f.request_delivery_date_sk
, order_amount
, quantity
, NULL
, NULL
, NULL
, NULL
FROM
  source.sales_order a
, customer_dim c
, product_dim d
, order_date_dim e
, request_delivery_date_dim f
WHERE
    a.order_status = 'N'
AND a.customer_number = c.customer_number
AND a.status_date >= c.effective_date
AND a.status_date <= c.expiry_date
AND a.product_code = d.product_code
AND a.status_date >= d.effective_date
AND a.status_date <= d.expiry_date
AND a.status_date = e.order_date
AND a.request_delivery_date = f.request_delivery_date
AND a.entry_date = CURRENT_DATE
;

UPDATE sales_order_fact a, source.sales_order b, allocate_date_dim c
SET 
  a.allocate_date_sk = c.allocate_date_sk 
, a.allocate_quantity = b.quantity
WHERE
    order_status = 'A'
AND b.entry_date = CURRENT_DATE
AND b.order_number = a.order_number
AND c.allocate_date = b.status_date
;

UPDATE sales_order_fact a, source.sales_order b, packing_date_dim d
SET 
  a.packing_date_sk = d.packing_date_sk 
, a.packing_quantity = b.quantity
WHERE
    order_status = 'P'
AND b.entry_date = CURRENT_DATE
AND b.order_number = a.order_number
AND d.packing_date = b.status_date
;

UPDATE sales_order_fact a, source.sales_order b, ship_date_dim e
SET 
  a.ship_date_sk = e.ship_date_sk 
, a.ship_quantity = b.quantity
WHERE
    order_status = 'S'
AND b.entry_date = CURRENT_DATE
AND b.order_number = a.order_number
AND e.ship_date = b.status_date
;

UPDATE sales_order_fact a, source.sales_order b, receive_date_dim f
SET 
  a.receive_date_sk = f.receive_date_sk 
, a.receive_quantity = b.quantity
WHERE
    order_status = 'R'
AND b.entry_date = CURRENT_DATE
AND b.order_number = a.order_number
AND f.receive_date = b.status_date
;

/* end of script                                                     */
