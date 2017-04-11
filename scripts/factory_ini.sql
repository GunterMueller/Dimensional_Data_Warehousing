/*********************************************************************/
/*                                                                   */
/* factory_ini.sql                                                   */                 
/*                                                                   */
/*********************************************************************/

USE dw;

INSERT INTO factory_dim
SELECT
  NULL
, factory_code
, factory_name
, factory_street_address
, factory_zip_code
, factory_city
, factory_state
, CURRENT_DATE
, '9999-12-31'
FROM source.factory_master
;

/* end of script                                                     */
