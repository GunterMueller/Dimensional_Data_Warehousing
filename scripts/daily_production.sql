/*********************************************************************/
/*                                                                   */
/* daily_production.sql                                              */                  
/*                                                                   */
/*********************************************************************/

USE source;

CREATE TABLE daily_production
( product_code INT
, production_date DATE
, factory_code INT 
, production_quantity INT )
;

/* end of script                                                     */
