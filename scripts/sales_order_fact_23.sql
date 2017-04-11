/*********************************************************************/
/*                                                                   */
/* sales_order_fact_24.sql                                           */                      
/*                                                                   */
/*********************************************************************/

USE dw;

CREATE VIEW customer_zip_code_dim 
( customer_zip_code_sk
, customer_zip_code
, customer_city
, customer_state
, effective_date
, expiry_date )
AS SELECT
  zip_code_sk
, zip_code
, city
, state
, effective_date
, expiry_date
FROM zip_code_dim
;

CREATE VIEW shipping_zip_code_dim 
( shipping_zip_code_sk
, shipping_zip_code
, shipping_city
, shipping_state
, effective_date
, expiry_date )
AS SELECT
  zip_code_sk
, zip_code
, city
, state
, effective_date
, expiry_date
FROM zip_code_dim
;

ALTER TABLE sales_order_fact
  ADD customer_zip_code_sk INT AFTER customer_sk
, ADD shipping_zip_code_sk INT AFTER customer_zip_code_sk
;

UPDATE sales_order_fact a, customer_dim b, customer_zip_code_dim c
SET
  a.customer_zip_code_sk = c.customer_zip_code_sk
WHERE 
    a.customer_sk = b.customer_sk
AND b.customer_zip_code = c.customer_zip_code
;

UPDATE sales_order_fact a, customer_dim b, shipping_zip_code_dim c
SET
  a.shipping_zip_code_sk = c.shipping_zip_code_sk
WHERE 
    a.customer_sk = b.customer_sk
AND b.shipping_zip_code = c.shipping_zip_code
;

ALTER TABLE customer_dim
  DROP customer_zip_code
, DROP customer_city
, DROP customer_state
, DROP shipping_zip_code
, DROP shipping_city
, DROP shipping_state
;

ALTER TABLE pa_customer_dim
  DROP customer_zip_code
, DROP customer_city
, DROP customer_state
, DROP shipping_zip_code
, DROP shipping_city
, DROP shipping_state
;

/* end of script                                                     */
