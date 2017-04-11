/*********************************************************************/
/*                                                                   */
/* add_campaign_session.sql                                          */
/*                                                                   */
/*********************************************************************/

USE dw;

ALTER TABLE month_dim
ADD campaign_session CHAR(30) AFTER month
;

/* end of script                                                     */
