/*********************************************************************/
/*                                                                   */
/* daily_aggregation.sql                                             */                  
/*                                                                   */
/*********************************************************************/

SELECT date, SUM(order_amount), COUNT(*)
FROM
  sales_order_fact a
, date_dim b
WHERE
a.order_date_sk = b.date_sk
GROUP BY date
ORDER BY date
;

/* end of script                                                     */
