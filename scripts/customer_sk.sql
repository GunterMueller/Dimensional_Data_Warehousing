/*********************************************************************/
/*                                                                   */
/* customer_sk.sql                                                   */                  
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
, effective_date 
, expiry_date )
VALUES 
  (NULL, 1, 'Big Customers', '7500 Louise Dr.', '17050', 'Mechanicsburg', 'PA', CURRENT_DATE, '9999-12-31')
, (NULL, 2, 'Small Stores', '2500 Woodland St.', '17055', 'Pittsburgh', 'PA', CURRENT_DATE, '9999-12-31')
, (NULL, 3, 'Medium Retailers', '1111 Ritter Rd.', '17055', 'Pittsburgh', 'PA',  CURRENT_DATE, '9999-12-31')
;

/* end of script                                                     */
