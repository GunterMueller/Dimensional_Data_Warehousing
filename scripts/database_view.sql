/*********************************************************************/
/*                                                                   */
/* database_view.sql                                                 */
/*                                                                   */
/*********************************************************************/

SELECT 
  order_date
, request_delivery_date
, SUM(order_amount)
, COUNT(*)
FROM
  sales_order_fact a
, order_date_dim b
, request_delivery_date_dim c
WHERE
    a.order_date_sk = b.order_date_sk
AND a.request_delivery_date_sk = c.request_delivery_date_sk
GROUP BY order_date, request_delivery_date
ORDER BY order_date, request_delivery_date
;

/* end of script                                                     */
