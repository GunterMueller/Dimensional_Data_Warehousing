/*********************************************************************/
/*                                                                   */
/* table_alias.sql                                                   */                                         
/*                                                                   */
/*********************************************************************/

SELECT 
  order_date_dim.date order_date
, request_delivery_date_dim.date request_delivery_date
, SUM(order_amount)
, COUNT(*)
FROM
  sales_order_fact a
, date_dim order_date_dim
, date_dim request_delivery_date_dim
WHERE
    a.order_date_sk = order_date_dim.date_sk
AND a.request_delivery_date_sk = request_delivery_date_dim.date_sk
GROUP BY order_date_dim.date, request_delivery_date_dim.date
ORDER BY order_date_dim.date, request_delivery_date_dim.date
;

/* end of script                                                     */
