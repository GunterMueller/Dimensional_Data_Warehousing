/*********************************************************************/
/*                                                                   */
/* non_pa_customer.sql                                               */                  
/*                                                                   */
/*********************************************************************/

/* default to dw                                                     */

USE dw;

INSERT INTO customer_dim 
( customer_sk 
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
, expiry_date )
VALUES 
  (NULL, 10, 'Bigger Customers', '7777 Ridge Rd.', '44102', 'Cleveland', 'OH', '7777 Ridge Rd.', '44102', 'Cleveland', 'OH', CURRENT_DATE, '9999-12-31')
, (NULL, 11, 'Smaller Stores', '8888 Jennings Fwy.', '44102', 'Cleveland', 'OH', '8888 Jennings Fwy.', '44102', 'Cleveland', 'OH', CURRENT_DATE, '9999-12-31')
, (NULL, 12, 'Small-Medium Retailers', '9999 Memphis Ave.', '44102', 'Cleveland', 'OH', '9999 Memphis Ave.', '44102', 'Cleveland', 'OH', CURRENT_DATE, '9999-12-31')
;

/* end of script                                                     */
