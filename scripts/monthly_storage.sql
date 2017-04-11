/*********************************************************************/
/*                                                                   */
/* monthly_storage.sql                                               */                  
/*                                                                   */
/*********************************************************************/

USE dw;

SELECT product_name, month_name, year, SUM(order_amount), COUNT(*)
FROM
  sales_order_fact a
, product_dim b
, date_dim c
WHERE
    a.product_sk = b.product_sk
AND a.order_date_sk = c.date_sk
GROUP BY 
  product_name
, product_category
, month_name
, year
HAVING product_category = 'Storage'
ORDER BY 
  year
, month_name
;

/* end of script                                                     */
