/*********************************************************************/
/*                                                                   */
/* across_date_customer.sql                                          */                  
/*                                                                   */
/*********************************************************************/

USE dw;

SELECT product_code, SUM(order_amount) sum_of_order_amount
FROM
  sales_order_fact a
, product_dim b
WHERE
    a.product_sk = b.product_sk
GROUP BY
  product_code
;

/* end of script                                                     */
