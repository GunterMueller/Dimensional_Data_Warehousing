/*********************************************************************/
/*                                                                   */
/* nullify_campaign_session.sql                                      */                  
/*                                                                   */
/*********************************************************************/

USE dw;

UPDATE month_dim
SET campaign_session = NULL
;

/* end of script                                                     */
