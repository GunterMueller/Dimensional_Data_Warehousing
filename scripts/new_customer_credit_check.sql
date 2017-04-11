/*********************************************************************/
/*                                                                   */
/* new_customer_credit_check.sql                                     */                  
/*                                                                   */
/*********************************************************************/

USE dw;

SELECT CONCAT( ROUND( checked / ( checked + not_checked )*100 ), ' %' )
FROM
( SELECT COUNT(*) checked FROM sales_order_fact a,
  sales_order_attribute_dim b
  WHERE new_customer_ind = 'Y' and credit_check_flag = 'Y' 
  AND a.sales_order_attribute_sk = b.sales_order_attribute_sk)  x
,
(SELECT COUNT(*) not_checked
FROM sales_order_fact a, sales_order_attribute_dim b
WHERE new_customer_ind = 'Y' and credit_check_flag = 'N' 
AND a.sales_order_attribute_sk = b.sales_order_attribute_sk)  y;

/* end of script                                                     */
