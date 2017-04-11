/*********************************************************************/
/*                                                                   */
/* product_launch_date_dim.sql                                       */                 
/*                                                                   */
/*********************************************************************/

USE dw;

CREATE VIEW product_launch_date_dim (
  product_launch_date_sk
, product_launch_date
, month_name
, month
, quarter
, year
, promo_ind
, effective_date
, expiry_date
)
AS SELECT
DISTINCT
  date_sk
, date
, month_name
, month
, quarter
, year
, promo_ind
, b.effective_date
, b.expiry_date
FROM 
  product_dim a
, date_dim b
WHERE
    a.effective_date = b.date
;

/* end of script                                                     */
