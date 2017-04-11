/*********************************************************************/
/*                                                                   */
/* jan_month_end_balance_regular.sql                                 */
/*                                                                   */
/*********************************************************************/

USE dw;

INSERT INTO month_end_balance_fact
SELECT m.* 
FROM 
  filtered_month_end_sales_order_fact m
, month_dim n
WHERE 
    month = 1 
AND m.month_order_sk = n.month_sk
AND n.year = YEAR(CURRENT_DATE)
;

/* end of script                                                     */
