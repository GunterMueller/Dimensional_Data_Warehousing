/*********************************************************************/
/*                                                                   */
/* quarterly_mechanicsburg.sql                                       */                  
/*                                                                   */
/*********************************************************************/

USE dw;

SELECT customer_city, quarter, year, SUM(order_amount), COUNT(order_sk)
FROM
  sales_order_fact a
, customer_dim b
, date_dim c
WHERE
    a.customer_sk = b.customer_sk
AND a.order_date_sk = c.date_sk
GROUP BY 
  customer_city
, quarter
, year
HAVING customer_city = 'Mechanicsburg'
ORDER BY 
  year
, quarter;

/* end of script                                                     */
