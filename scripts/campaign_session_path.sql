/*********************************************************************/
/*                                                                   */
/* campaign_session_path.sql                                         */                                            
/*                                                                   */
/*********************************************************************/

SELECT 
  product_category pc
, time
, order_amount amt
, order_quantity qty
FROM (

( SELECT 
  product_category
, year
, 1 month
, year time
, 1 sequence
, SUM(month_order_amount) order_amount
, SUM(month_order_quantity) order_quantity
FROM
  month_end_sales_order_fact a
, product_dim b
, month_dim c
WHERE
    a.product_sk = b.product_sk
AND a.month_order_sk = c.month_sk
GROUP BY 
  product_category
, year
) 

UNION ALL

( SELECT 
  product_category
, year
, month
, campaign_session time
, 2 sequence
, SUM(month_order_amount) order_amount
, SUM(month_order_quantity) order_quantity
FROM
  month_end_sales_order_fact a
, product_dim b
, month_dim c
WHERE
    a.product_sk = b.product_sk
AND a.month_order_sk = c.month_sk
GROUP BY product_category, year, campaign_session
)

UNION ALL

( SELECT 
  product_category
, year
, month
, month_name time
, 3 sequence
, SUM(month_order_amount) order_amount
, SUM(month_order_quantity) order_quantity
FROM
  month_end_sales_order_fact a
, product_dim b
, month_dim c
WHERE
    a.product_sk = b.product_sk
AND a.month_order_sk = c.month_sk
GROUP BY product_category, year, campaign_session, month_name
)

) x

ORDER BY
  product_category
, year
, month
, sequence
;

/* end of script                                                     */
