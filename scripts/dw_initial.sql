/*********************************************************************/
/*                                                                   */
/* dw_initial.sql             		                        */                  
/*                                                                   */
/*********************************************************************/

USE dw;

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

INSERT INTO customer_dim
SELECT
  NULL
, customer_number
, customer_name
, customer_street_address
, customer_zip_code
, customer_city
, customer_state
, '2005-03-01'
, '9999-12-31'
FROM
customer_stg
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

INSERT INTO product_dim
SELECT
  NULL	
, product_code
, product_name
, product_category
, '2005-03-01'
, '9999-12-31'
FROM 
product_stg
;

INSERT INTO order_dim 
SELECT
  NULL
, order_number
, order_date
, '9999-12-31'
FROM
source.sales_order
WHERE order_date >= '2005-03-01'
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
AND a.product_code = d.product_code
AND a.order_date = e.date
AND order_date >= '2005-03-01'
;

/* end of script                                                     */
