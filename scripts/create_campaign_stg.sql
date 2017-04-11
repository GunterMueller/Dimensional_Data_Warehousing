/*********************************************************************/
/*                                                                   */
/* create_campaign_stg.sql                                            */                                             
/*                                                                   */
/*********************************************************************/

USE dw;

CREATE TABLE campaign_session_stg 
( campaign_session CHAR(30)
, month CHAR(9)
, year INT(4)
)
;

/* end of script                                                     */
