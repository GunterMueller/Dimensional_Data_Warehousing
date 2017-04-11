/*********************************************************************/
/*                                                                   */
/* dw_regular.sql              		                             */                  
/*                                                                   */
/*********************************************************************/

USE dw;

/* customer dimension loading                                        */

TRUNCATE customer_stg
;

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
, customer_state )
;

/* SCD2 on customer street address                                   */

/* first, expire the existing customer                               */

UPDATE 
  customer_dim a
, customer_stg b
SET
  expiry_date = SUBDATE(CURRENT_DATE, 1)
WHERE
    a.customer_number = b.customer_number
AND a.customer_street_address <> b.customer_street_address
AND expiry_date = '9999-12-31'
;

/* then, add a new row for the customer                              */

INSERT INTO customer_dim
SELECT
  NULL	
, b.customer_number
, b.customer_name
, b.customer_street_address
, b.customer_zip_code
, b.customer_city
, b.customer_state
, CURRENT_DATE
, '9999-12-31'
FROM 
  customer_dim a
, customer_stg b	
WHERE 
    a.customer_number = b.customer_number
AND (a.customer_street_address <> b.customer_street_address)
AND EXISTS (
SELECT * 
FROM customer_dim x 
WHERE 
    	    b.customer_number = x.customer_number 
AND a.expiry_date = SUBDATE(CURRENT_DATE, 1))
AND NOT EXISTS (
SELECT *
FROM customer_dim y 
WHERE     
    		   b.customer_number = y.customer_number 
AND y.expiry_date = '9999-12-31')
;

/* SCD1 on customer name                                             */

UPDATE customer_dim a, customer_stg b
SET a.customer_name = b.customer_name
WHERE     a.customer_number = b.customer_number
      AND a.customer_name <> b.customer_name
;

/* add new customer                                                  */

INSERT INTO customer_dim
SELECT
  NULL	
, customer_number
, customer_name
, customer_street_address
, customer_zip_code
, customer_city
, customer_state
, CURRENT_DATE
, '9999-12-31'
FROM customer_stg 	
WHERE customer_number NOT IN(
SELECT y.customer_number 
FROM customer_dim x, customer_stg y 
WHERE x.customer_number = y.customer_number )
;

/* product dimension loading                                         */

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

/* SCD2 on product name and group                                    */

/* first, expire the existing product                                */

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

/* then, add a new row for the product		                 */

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

/* add new product                                                   */

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

/* end of product_dim loading                                        */

INSERT INTO order_dim (
  order_sk
, order_number
, effective_date
, expiry_date )
SELECT
  NULL
, order_number
, order_date
, '9999-12-31'
FROM source.sales_order
WHERE entry_date = CURRENT_DATE
;

INSERT INTO sales_order_fact
SELECT
  order_sk
, customer_sk
, product_sk
, date_sk
, order_amount
FROM
  source.sales_order a
, order_dim b
, customer_dim c
, product_dim d
, date_dim e
WHERE
    a.order_number = b.order_number
AND a.customer_number = c.customer_number
AND a.order_date >= c.effective_date
AND a.order_date <= c.expiry_date
AND a.product_code = d.product_code
AND a.order_date >= d.effective_date
AND a.order_date <= d.expiry_date
AND a.order_date = e.date
AND a.entry_date = CURRENT_DATE
;

/* end of script                                                     */
