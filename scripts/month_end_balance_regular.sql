/*********************************************************************/
/*                                                                   */
/* month_end_balance_regular.sql                                     */
/*                                                                   */
/*********************************************************************/

USE dw;

INSERT INTO month_end_balance_fact
SELECT n.month_order_sk, n.product_sk, (n.month_order_amount + m.month_end_amount_balance), (n.month_order_quantity + m.month_end_quantity_balance)
FROM 
  month_end_balance_fact m
, filtered_month_end_sales_order_fact n
, month_dim o
, month_dim p
WHERE 
o.month = MONTH(CURRENT_DATE) - 1    
AND p.month = MONTH(CURRENT_DATE)
AND m.month_sk = o.month_sk AND n.month_order_sk = p.month_sk
AND o.year = p.year
AND m.product_sk = n.product_sk
;

INSERT INTO month_end_balance_fact
SELECT m.*
FROM 
  filtered_month_end_sales_order_fact m
, month_dim n
WHERE 
n.month = MONTH(CURRENT_DATE)    
AND m.month_order_sk = n.month_sk
AND m.product_sk NOT IN (SELECT x.product_sk FROM month_end_balance_fact x, month_dim y WHERE x.month_sk = y.month_sk AND y.month = (MONTH(CURRENT_DATE)-1) AND y.year = n.year ) 
;

INSERT INTO month_end_balance_fact
SELECT o.month_sk, m.product_sk, m.month_end_amount_balance, m.month_end_quantity_balance
FROM 
  month_end_balance_fact m
, month_dim n
, month_dim o
WHERE 
    n.month = MONTH(CURRENT_DATE)-1
AND m.month_sk = n.month_sk
AND o.month = MONTH(CURRENT_DATE)    
AND n.year = o.year
AND m.product_sk NOT IN (
SELECT x.product_sk FROM filtered_month_end_sales_order_fact x, month_dim y WHERE x.month_order_sk = y.month_sk AND y.month = MONTH(CURRENT_DATE) AND y.year = n.year)
;

/* end of script                                                     */
