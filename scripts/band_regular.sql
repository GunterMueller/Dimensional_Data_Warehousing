/*********************************************************************/
/*                                                                   */
/* band_regular.sql                                                  */                                                 
/*                                                                   */
/*********************************************************************/

INSERT INTO annual_sales_order_fact
SELECT 
  b.customer_sk
, year_sk
, SUM(order_amount)
FROM 
  sales_order_fact a
, customer_dim b
, year_dim c
, order_date_dim d
WHERE
    a.customer_sk = b.customer_sk
AND a.order_date_sk = d.order_date_sk
AND c.year = d.year
AND c.year = YEAR(CURRENT_DATE) - 1
GROUP BY customer_number, c.year
;

INSERT INTO annual_customer_segment_fact
SELECT 
  d.segment_sk
, b.customer_sk
, c.year_sk
, 1
FROM 
  annual_sales_order_fact a
, customer_dim b
, year_dim c
, annual_order_segment_dim d
WHERE
    a.customer_sk = b.customer_sk
AND a.year_sk = c.year_sk
AND c.year = YEAR(CURRENT_DATE) - 1
AND annual_order_amount >= band_start_amount
AND annual_order_amount <= band_end_amount
;

/* end of script                                                     */
