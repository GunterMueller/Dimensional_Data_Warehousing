/*********************************************************************/
/*                                                                   */
/* entry_date.sql                                                    */                  
/*                                                                   */
/*********************************************************************/

USE dw;

CREATE VIEW entry_date_dim (
  entry_date_sk
, entry_date
, month_name
, month
, quarter
, year
, promo_ind
, effective_date
, expiry_date
)
AS SELECT
  date_sk
, date
, month_name
, month
, quarter
, year
, promo_ind
, effective_date
, expiry_date
FROM date_dim
;

ALTER TABLE sales_order_fact
ADD entry_date_sk INT AFTER receive_date_sk
;

/* end of script                                                     */
