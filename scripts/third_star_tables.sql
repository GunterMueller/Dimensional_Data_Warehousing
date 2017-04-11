/*********************************************************************/
/*                                                                   */
/* third_star_tables.sql                                             */       
/*                                                                   */
/*********************************************************************/

/* default to dw                                                     */

USE dw;

CREATE TABLE factory_dim (
  factory_sk INT NOT NULL AUTO_INCREMENT PRIMARY KEY
, factory_code INT
, factory_name CHAR(30)
, factory_street_address CHAR(50)
, factory_zip_code INT(5)
, factory_city CHAR(30)
, factory_state CHAR(2)
, effective_date DATE
, expiry_date DATE
)
;

CREATE TABLE production_fact (
  product_sk INT 
, production_date_sk INT
, factory_sk INT 
, production_quantity INT
) 
;

/* end of script                                                     */
