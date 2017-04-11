/*********************************************************************/
/*                                                                   */
/* filtered_month_sales_order_fact.sql                               */
/*                                                                   */
/*********************************************************************/

USE dw;

CREATE VIEW filtered_month_end_sales_order_fact AS
SELECT a.* FROM month_end_sales_order_fact a, month_dim b
WHERE year > 2005 AND a.month_order_sk = b.month_sk
;

/* end of script                                                     */
