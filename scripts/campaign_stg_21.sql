/*********************************************************************/
/*                                                                   */
/* campaign_stg_21.sql                                               */               
/*                                                                   */
/*********************************************************************/

USE dw;

CREATE TABLE non_straight_campaign_stg
 ( campaign_session CHAR(30)
, start_month CHAR(9)
, start_year INT(4)
, end_month CHAR(9)
, end_year INT(4)
)
;

/* end of script                                                     */
