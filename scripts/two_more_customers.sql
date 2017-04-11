/*********************************************************************/
/*                                                                   */
/* two_more_customers.sql                                            */                  
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
  (NULL, 13, 'PA Customer', '1111 Louise Dr.', '17050', 'Mechanicsburg', 'PA', '1111 Louise Dr.', '17050', 'Mechanicsburg', 'PA', CURRENT_DATE, '9999-12-31')
, (NULL, 14, 'OH Customer', '6666 Ridge Rd.', '44102', 'Cleveland', 'OH', '6666 Ridge Rd.', '44102', 'Cleveland', 'OH', CURRENT_DATE, '9999-12-31')
;

/* end of script                                                     */
