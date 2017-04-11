/*********************************************************************/
/*                                                                   */
/* annual_aggregation.sql                                            */                  
/*                                                                   */
/*********************************************************************/

SELECT year, product_name, customer_city, SUM(order_amount), COUNT(*)
FROM
  sales_order_fact a
, date_dim b
, product_dim c
, customer_dim d
WHERE
    a.order_date_sk = b.date_sk
AND a.product_sk = c.product_sk
AND a.customer_sk = d.customer_sk
GROUP BY year, product_name, customer_city
ORDER BY year, product_name, customer_city
;

/* end of script                                                     */
