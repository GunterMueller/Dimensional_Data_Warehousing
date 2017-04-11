/*********************************************************************/
/*                                                                   */
/* daily_date.sql                                                    */                  
/*                                                                   */
/*********************************************************************/

USE dw;

INSERT INTO date_dim VALUES
( NULL
, CURRENT_DATE
, MONTHNAME(CURRENT_DATE)
, MONTH(CURRENT_DATE)
, QUARTER(CURRENT_DATE)
, YEAR(CURRENT_DATE)
, '0000-00-00'
, '9999-12-31'
)
;

/* end of script                                                     */
