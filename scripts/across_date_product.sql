/*********************************************************************/
/*                                                                   */
/* across_date_product.sql                                           */                  
/*                                                                   */
/*********************************************************************/

USE dw;

SELECT customer_number, SUM(order_amount) sum_of_order_amount
FROM
  sales_order_fact a
, customer_dim b
WHERE
    a.customer_sk = b.customer_sk
GROUP BY
  customer_number
;

/* end of script                                                     */
