/*********************************************************************/
/*                                                                   */
/* loyal_customer.sql                                                */                  
/*                                                                   */
/*********************************************************************/

USE dw;

SELECT customer_number, year, COUNT(*)
FROM 
  sales_order_fact a
, customer_dim b
, date_dim c
WHERE 
    a.customer_sk = b.customer_sk
AND a.order_date_sk = c.date_sk
GROUP BY 
  customer_number
, year
HAVING 
    COUNT(*) > 3
AND (12 -  MONTH(MAX(date))) < 7
;

/* end of script                                                     */
