/*********************************************************************/
/*                                                                   */
/* monthly_product_performer.sql                                     */                  
/*                                                                   */
/*********************************************************************/

USE dw;

SELECT month_name, year, product_name, SUM(order_amount), COUNT(*)
FROM
  sales_order_fact a
, product_dim b
, date_dim c
WHERE
    a.product_sk = b.product_sk
AND a.order_date_sk = c.date_sk
GROUP BY 
  month_name
, year
, product_name
HAVING SUM(order_amount) >= 75000
ORDER BY 
  month
, year
, product_name
;

/* end of script                                                     */
