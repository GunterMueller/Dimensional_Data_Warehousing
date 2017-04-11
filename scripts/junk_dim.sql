/*********************************************************************/
/*                                                                   */
/* junk_dim.sql                                                      */                                                         
/*                                                                   */
/*********************************************************************/

USE dw;

CREATE TABLE sales_order_attribute_dim
( sales_order_attribute_sk INT NOT NULL AUTO_INCREMENT PRIMARY KEY
, verification_ind CHAR(1)
, credit_check_flag CHAR(1)
, new_customer_ind CHAR(1)
, web_order_flag CHAR(1)
, effective_date DATE
, expiry_date DATE )
;

INSERT INTO sales_order_attribute_dim VALUES
  (NULL, 'Y', 'N', 'N', 'N', '0000-00-00', '9999-12-31')
, (NULL, 'Y', 'Y', 'N', 'N', '0000-00-00', '9999-12-31')
, (NULL, 'Y', 'Y', 'Y', 'N', '0000-00-00', '9999-12-31')
, (NULL, 'Y', 'Y', 'Y', 'Y', '0000-00-00', '9999-12-31')
, (NULL, 'Y', 'N', 'Y', 'N', '0000-00-00', '9999-12-31')
, (NULL, 'Y', 'N', 'Y', 'Y', '0000-00-00', '9999-12-31')
, (NULL, 'Y', 'N', 'N', 'Y', '0000-00-00', '9999-12-31')
, (NULL, 'Y', 'Y', 'N', 'Y', '0000-00-00', '9999-12-31')
, (NULL, 'N', 'N', 'N', 'N', '0000-00-00', '9999-12-31')
, (NULL, 'N', 'Y', 'N', 'N', '0000-00-00', '9999-12-31')
, (NULL, 'N', 'Y', 'Y', 'N', '0000-00-00', '9999-12-31')
, (NULL, 'N', 'Y', 'Y', 'Y', '0000-00-00', '9999-12-31')
, (NULL, 'N', 'N', 'Y', 'N', '0000-00-00', '9999-12-31')
, (NULL, 'N', 'N', 'Y', 'Y', '0000-00-00', '9999-12-31')
, (NULL, 'N', 'N', 'N', 'Y', '0000-00-00', '9999-12-31')
, (NULL, 'N', 'Y', 'N', 'Y', '0000-00-00', '9999-12-31')
;

/* end of script                                                     */
