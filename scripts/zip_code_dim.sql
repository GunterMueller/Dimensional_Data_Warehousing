/*********************************************************************/
/*                                                                   */
/* zip_code_dim.sql                                                  */                  
/*                                                                   */
/*********************************************************************/

/* default to dw                                                     */

USE dw;

CREATE TABLE zip_code_dim (
  zip_code_sk INT NOT NULL AUTO_INCREMENT PRIMARY KEY
, zip_code INT(5)
, city CHAR(30)
, state CHAR(2)
, effective_date DATE
, expiry_date DATE
)
;

/* end of script                                                     */
