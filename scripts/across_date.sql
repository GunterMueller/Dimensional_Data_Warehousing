/*********************************************************************/
/*                                                                   */
/* across_date.sql                                                   */                  
/*                                                                   */
/*********************************************************************/

USE dw;

SELECT customer_number, product_code, SUM(order_amount) sum_of_order_amount
FROM
  sales_order_fact a
, customer_dim b
, product_dim c
WHERE
    a.customer_sk = b.customer_sk
AND a.product_sk = c.product_sk
GROUP BY
  customer_number
, product_code
;

/* end of script                                                     */
