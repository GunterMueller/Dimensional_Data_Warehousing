/*********************************************************************/
/*                                                                   */
/* grouping.sql                                                      */                  
/*                                                                   */
/*********************************************************************/

USE dw;

SELECT 
  product_category
, year
, quarter
, month_name
, SUM(order_amount)
FROM
  sales_order_fact a
, product_dim b
, date_dim c
WHERE 
a.product_sk = b.product_sk
AND a.order_date_sk = c.date_sk
GROUP BY product_category, year, quarter, month
ORDER BY product_category, year, quarter, month
;

/* end of script                                                     */
