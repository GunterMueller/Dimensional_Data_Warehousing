/*********************************************************************/
/*                                                                   */
/* product_count_ini.sql                                             */                  
/*                                                                   */
/*********************************************************************/

USE dw;

/* for new products                                                 */                  

INSERT INTO product_count_fact 
(product_sk, product_launch_date_sk)
SELECT
  a.product_sk
, b.date_sk

FROM
  product_dim a
, date_dim b

WHERE
a.effective_date = b.date
GROUP BY product_code
HAVING COUNT(product_code) = 1
;

/* for products that have been updated by SCD2                       */                  

INSERT INTO product_count_fact (product_sk, product_launch_date_sk)
SELECT
  a.product_sk
, b.date_sk

FROM
  product_dim a
, date_dim b

WHERE
a.effective_date = b.date
GROUP BY product_code
HAVING COUNT(product_code) > 1
;

/* end of script                                                     */
