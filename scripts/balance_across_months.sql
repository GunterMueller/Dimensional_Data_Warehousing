/*********************************************************************/
/*                                                                   */
/* balance_across_months.sql                                         */                                                     
/*                                                                   */
/*********************************************************************/

USE dw ;

SELECT product_name, SUM(month_end_amount_balance)
FROM
  month_end_balance_fact a
, product_dim b
WHERE 
a.product_sk = b.product_sk
GROUP BY product_code
ORDER BY product_code
;

/* end of script                                                     */
