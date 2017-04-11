/*********************************************************************/
/*                                                                   */
/* factory_master.sql                                                */                  
/*                                                                   */
/*********************************************************************/

USE source;

CREATE TABLE factory_master
( factory_code INT
, factory_name CHAR(30)
, factory_street_address CHAR(50)
, factory_zip_code INT(5)
, factory_city CHAR(30)
, factory_state CHAR(2) )
;

/* end of script                                                     */
