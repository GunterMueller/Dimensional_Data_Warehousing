/*********************************************************************/
/*                                                                   */
/* balance_across_products.sql                                       */                                                   
/*                                                                   */
/*********************************************************************/

USE dw;

SELECT year, month, SUM(month_end_amount_balance)
FROM
  month_end_balance_fact a
, month_dim b
WHERE a.month_sk = b.month_sk
GROUP BY year, month
ORDER BY year, month
;

/* end of script                                                     */
