/*********************************************************************/
/*                                                                   */
/* create_product_stg.sql                                            */                  
/*                                                                   */
/*********************************************************************/

/* default database to dw                                            */

USE dw;

CREATE TABLE product_stg
( product_code INT
, product_name CHAR(30)
, product_category CHAR(30))
;

/* end of script                                                     */
