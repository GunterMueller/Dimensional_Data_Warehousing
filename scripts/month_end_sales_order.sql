/*********************************************************************/
/*                                                                   */
/* month_end_sales_order.sql                                         */                  
/*                                                                   */
/*********************************************************************/

USE dw;

INSERT INTO month_end_sales_order_fact
SELECT
  b.month_sk
, a.product_sk
, SUM(order_amount)
, SUM(order_quantity)
FROM
  sales_order_fact a
, month_dim b
, order_date_dim d
WHERE
    a.order_date_sk = d.order_date_sk
AND b.month = d.month
AND b.year = d.year
AND b.month = MONTH(CURRENT_DATE)
AND b.year = YEAR(CURRENT_DATE)
GROUP BY b.month, b.year, a.product_sk
;

/* end of script                                                     */
