/*********************************************************************/
/*                                                                   */
/* track_launch_expiry.sql                                           */                  
/*                                                                   */
/*********************************************************************/

USE dw;

SELECT x.year, x.product_category pc_launch, x.product_count count,
y.product_category pc_expired, y.product_count pc
FROM
(SELECT product_category, year, SUM(product_count) product_count
FROM
  product_count_fact a
, product_effective_date_dim b
, product_dim c
WHERE
           a.product_effective_date_sk = b.product_effective_date_sk
AND a.product_sk = c.product_sk
GROUP BY year, product_category) x

LEFT JOIN

(SELECT product_category, year, SUM(product_count) product_count
FROM
  product_count_fact a
, product_expiry_date_dim b
, product_dim c
WHERE
           a.product_expiry_date_sk = b.product_expiry_date_sk
AND a.product_sk = c.product_sk
AND b.product_expiry_date <> '9999-12-31'
GROUP BY year, product_category) y 

ON x.product_category = y.product_category AND x.year = y.year
ORDER BY year, x.product_category
; 

/* end of script                                                     */
