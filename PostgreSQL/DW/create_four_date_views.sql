/*********************************************************************/
/*                                                                   */
/* create_four_date_views.sql                                        */                  
/*                                                                   */
/*********************************************************************/

-- USE dw;

CREATE VIEW allocate_date_dim (
  allocate_date_sk
, allocate_date
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
, dwdate
, month_name
, month
, quarter
, year
, promo_ind
, effective_date
, expiry_date
FROM date_dim
;

CREATE VIEW packing_date_dim (
  packing_date_sk
, packing_date
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
, dwdate
, month_name
, month
, quarter
, year
, promo_ind
, effective_date
, expiry_date
FROM date_dim
;

CREATE VIEW ship_date_dim (
  ship_date_sk
, ship_date
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
, dwdate
, month_name
, month
, quarter
, year
, promo_ind
, effective_date
, expiry_date
FROM date_dim
;

CREATE VIEW receive_date_dim (
  receive_date_sk
, receive_date
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
, dwdate
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
