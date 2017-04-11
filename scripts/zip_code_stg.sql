/*********************************************************************/
/*                                                                   */
/* zip_code_stg.sql                                                  */                                              
/*                                                                   */
/*********************************************************************/

/* default to dw                                                     */

USE dw;

CREATE TABLE zip_code_stg (
  zip_code INT(5)
, city CHAR(30)
, state CHAR(2)
)
;

/* end of script                                                     */
