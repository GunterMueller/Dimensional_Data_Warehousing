/*********************************************************************/
/*                                                                   */
/* quarter_path.sql                                                  */
/*                                                                   */
/*********************************************************************/

USE dw;

SELECT 
  product_category
, time
, order_amount
, order_quantity
FROM (

( SELECT 
  product_category
, year
, month
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
, year )

UNION ALL

( SELECT 
  product_category
, year
, month
, quarter time
, CASE WHEN quarter = 1 THEN 2 
  WHEN quarter = 2 THEN 6 
  WHEN quarter = 3 THEN 10
  WHEN quarter = 4 THEN 14
  END sequence
, SUM(month_order_amount) order_amount 
, SUM(month_order_quantity) order_quantity
FROM
  month_end_sales_order_fact a
, product_dim b
, month_dim c
WHERE
    a.product_sk = b.product_sk
AND a.month_order_sk = c.month_sk
GROUP BY product_category, year, quarter
)

UNION ALL

( SELECT 
  product_category
, year
, month
, month_name time
, CASE WHEN month = 1 THEN 3 
  WHEN month = 2 THEN 4
  WHEN month = 3 THEN 5 
  WHEN month = 4 THEN 7
  WHEN month = 5 THEN 8
  WHEN month = 6 THEN 9 
  WHEN month = 7 THEN 11
  WHEN month = 8 THEN 12
  WHEN month = 9 THEN 13
  WHEN month = 10 THEN 15
  WHEN month = 11 THEN 16
  WHEN month = 12 THEN 17
  END sequence
, SUM(month_order_amount) order_amount
, SUM(month_order_quantity) order_quantity
FROM
  month_end_sales_order_fact a
, product_dim b
, month_dim c
WHERE
    a.product_sk = b.product_sk
AND a.month_order_sk = c.month_sk
GROUP BY product_category, year, quarter, month )  

) x
ORDER BY product_category, year, sequence;

/* end of script                                                     */
