/*********************************************************************/
/*                                                                   */
/* daily_production_data.sql                                         */                  
/*                                                                   */
/*********************************************************************/

USE source;

INSERT INTO daily_production VALUES
  ( 1, CURRENT_DATE, 4, 100 )
, ( 2, CURRENT_DATE, 3, 200 )
, ( 3, CURRENT_DATE, 2, 300 )
, ( 4, CURRENT_DATE, 1, 400 )
, ( 1, CURRENT_DATE, 1, 400 )
, ( 2, CURRENT_DATE, 2, 300 )
, ( 3, CURRENT_DATE, 3, 200 )
, ( 4, CURRENT_DATE, 4, 100 )
;

/* end of script                                                     */
