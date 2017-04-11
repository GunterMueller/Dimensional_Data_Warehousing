/*********************************************************************/
/*                                                                   */
/* sales_order_attributes.sql                                        */                  
/*                                                                   */
/*********************************************************************/

USE source;

ALTER TABLE sales_order
  ADD verification_ind CHAR(1) AFTER product_code
, ADD credit_check_flag CHAR(1) AFTER verification_ind
, ADD new_customer_ind CHAR(1) AFTER credit_check_flag 
, ADD web_order_flag CHAR(1) AFTER new_customer_ind
;

/* end of script                                                     */
