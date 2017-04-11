/*********************************************************************/
/*                                                                   */
/* daily_production_23.sql                                           */                  
/*                                                                   */
/*********************************************************************/

USE source;

INSERT INTO daily_production VALUES
  ( 1, CURRENT_DATE, 3, 400 )
, ( 3, CURRENT_DATE, 4, 200 )
, ( 5, CURRENT_DATE, 5, 100 )
;

/* end of script                                                     */
