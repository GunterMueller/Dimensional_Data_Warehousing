/*********************************************************************/
/*                                                                   */
/* drilling.sql                                                      */        
/*                                                                   */
/*********************************************************************/

USE dw;

SELECT 
  product_category
, time
, order_amount
FROM (

( SELECT 
  product_category
, date
, year time
, 1 sequence
, SUM(order_amount) order_amount
FROM
  sales_order_fact a
, product_dim b
, date_dim c
WHERE
    a.product_sk = b.product_sk
AND a.order_date_sk = c.date_sk
GROUP BY 
  product_category
,  year
ORDER BY date
) 

UNION ALL

( SELECT 
  product_category
, date
, quarter time
, 2 sequence
, SUM(order_amount) 
FROM
  sales_order_fact a
, product_dim b
, date_dim c
WHERE
    a.product_sk = b.product_sk
AND a.order_date_sk = c.date_sk
GROUP BY product_category, year, quarter
ORDER BY date
)

UNION ALL

( SELECT 
  product_category
, date
, month_name time
, 3 sequence
, SUM(order_amount) 
FROM
  sales_order_fact a
, product_dim b
, date_dim c
WHERE
    a.product_sk = b.product_sk
AND a.order_date_sk = c.date_sk
GROUP BY product_category, year, quarter, month_name
ORDER BY date
)

) x

ORDER BY
  product_category
, date
, sequence
, time
;

/* end of script                                                     */
