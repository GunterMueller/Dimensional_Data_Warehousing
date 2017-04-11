/*********************************************************************/
/*                                                                   */
/* segmentation.sql                                                  */                                                 
/*                                                                   */
/*********************************************************************/

USE dw;

SELECT 
  year
, segment_name
, band_name
, SUM(count)
FROM 

(SELECT 
segment_sk, customer_number, year_sk, SUM(count) count
FROM 
  annual_customer_segment_fact x
, customer_dim y
WHERE
x.customer_sk = y.customer_sk
GROUP BY segment_sk, customer_number, year_sk) z

, year_dim b
, annual_order_segment_dim c

WHERE
    z.year_sk = b.year_sk
AND b.year IN(2004, 2005)
AND z.segment_sk = c.segment_sk
GROUP BY year, segment_name, band_name
ORDER BY year, segment_name, band_start_amount
;

/* end of script                                                     */
