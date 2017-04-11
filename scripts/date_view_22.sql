/*********************************************************************/
/*                                                                   */
/* date_view_22.sql                                                  */                 
/*                                                                   */
/*********************************************************************/

USE dw;

CREATE VIEW product_effective_date_dim (
  product_effective_date_sk
, product_effective_date
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

CREATE VIEW product_expiry_date_dim (
  product_expiry_date_sk
, product_expiry_date
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
    a.expiry_date = b.date
;

/* end of script                                                     */
