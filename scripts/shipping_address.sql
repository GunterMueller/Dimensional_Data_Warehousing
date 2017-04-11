/*********************************************************************/
/*                                                                   */
/* shipping_address.sql                                              */
/*                                                                   */
/*********************************************************************/

USE dw;

ALTER TABLE customer_dim
  ADD shipping_address CHAR(50) AFTER customer_state
, ADD shipping_zip_code INT(5) AFTER shipping_address
, ADD shipping_city CHAR(30) AFTER shipping_zip_code
, ADD shipping_state CHAR(2) AFTER shipping_city
;

ALTER TABLE customer_stg
  ADD shipping_address CHAR(50) AFTER customer_state
, ADD shipping_zip_code INT(5) AFTER shipping_address
, ADD shipping_city CHAR(30) AFTER shipping_zip_code
, ADD shipping_state CHAR(2) AFTER shipping_city
;

/* end of script                                                     */
