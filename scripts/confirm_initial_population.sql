/*********************************************************************/
/*                                                                   */
/* confirm_initial_population.sql                                    */                  
/*                                                                   */
/*********************************************************************/

USE dw;

SELECT 
  order_number on
, customer_name
, product_name
, date
, order_amount amount
FROM 
  sales_order_fact a
, customer_dim b
, product_dim c
, order_dim d
, date_dim e
WHERE
    a.customer_sk = b.customer_sk
AND a.product_sk = c.product_sk
AND a.order_sk = d.order_sk
AND a.order_date_sk = e.date_sk
;

/* end of script                                                     */
