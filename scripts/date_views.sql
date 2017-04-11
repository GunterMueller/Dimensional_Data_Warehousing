/*********************************************************************/
/*                                                                   */
/* date_views.sql                                                    */                  
/*                                                                   */
/*********************************************************************/

USE dw;

CREATE VIEW order_date_dim (
  order_date_sk
, order_date
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

CREATE VIEW request_delivery_date_dim (
  request_delivery_date_sk
, request_delivery_date
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

/* end of script                                                     */
