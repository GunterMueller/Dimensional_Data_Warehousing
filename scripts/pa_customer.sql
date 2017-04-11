/*********************************************************************/
/*                                                                   */
/* pa_customer.sql                                                   */                  
/*                                                                   */
/*********************************************************************/

USE dw;

CREATE TABLE pa_customer_dim 
( customer_sk INT NOT NULL AUTO_INCREMENT PRIMARY KEY
, customer_number INT
, customer_name CHAR(50)
, customer_street_address CHAR(50)
, customer_zip_code INT(5)
, customer_city CHAR(30)
, customer_state CHAR(2)
, shipping_address CHAR(50)
, shipping_zip_code INT(5)
, shipping_city CHAR(30)
, shipping_state CHAR(2)
, effective_date DATE
, expiry_date DATE )
;

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

/* end of script                                                     */
