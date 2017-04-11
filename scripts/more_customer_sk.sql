/*********************************************************************/
/*                                                                   */
/* more_customer_sk.sql                                              */                  
/*                                                                   */
/*********************************************************************/

USE dw;

INSERT INTO customer_dim (
  customer_sk 
, customer_number 
, customer_name 
, customer_street_address 
, customer_zip_code 
, customer_city 
, customer_state 
, effective_date 
, expiry_date 
)
VALUES 
  (NULL, 4, 'Good Companies', '9500 Scott St.', '17050', 'Mechanicsburg', 'PA', CURRENT_DATE, '9999-12-31')
, (NULL, 5, 'Wonderful Shops', '3333 Rossmoyne Rd.', '17050', 'Mechanicsburg', 'PA', CURRENT_DATE, '9999-12-31')
, (NULL, 6, 'Loyal Clients', '7070 Ritter Rd.', '17055', 'Pittsburgh', 'PA', CURRENT_DATE, '9999-12-31')
;

/* end of script                                                     */
