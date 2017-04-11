/*********************************************************************/
/*                                                                   */
/* create_promo_schedule_stg.sql                                     */
/*                                                                   */
/*********************************************************************/

USE dw;

CREATE TABLE promo_schedule_stg (
  promo_code CHAR(2)
, promo_name CHAR(30)
, promo_start_date DATE
, promo_last_date DATE
)
;

/* end of script                                                     */
