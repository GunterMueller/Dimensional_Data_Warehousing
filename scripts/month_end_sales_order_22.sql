/*********************************************************************/
/*                                                                   */
/* month_end_sales_order_22.sql                                      */                  
/*                                                                   */
/*********************************************************************/

USE dw;

/* normal (order_date = entry_date)                                  */

INSERT INTO month_end_sales_order_fact
SELECT
  d.month_sk
, a.product_sk
, SUM(order_amount)
, SUM(order_quantity)
FROM
  sales_order_fact a
, order_date_dim b
, entry_date_dim c
, month_dim d
WHERE
    a.order_date_sk = b.order_date_sk
AND a.entry_date_sk = c.entry_date_sk
AND b.order_date = c.entry_date
AND c.month = MONTH(CURRENT_DATE)
AND c.year = YEAR(CURRENT_DATE)
AND b.month = d.month
AND b.year = d.year
GROUP BY d.month, d.year, product_sk
;

/* late arrival, amount & quantity already exist for the past month  */  

UPDATE 
   month_end_sales_order_fact a

, (SELECT 
  y.month
, y.year
, w.product_sk
, SUM(order_amount) order_amount
, SUM(order_quantity) order_quantity
FROM 
  sales_order_fact x
, order_date_dim y
, entry_date_dim z
, product_dim w
WHERE 
    x.order_date_sk = y.order_date_sk
AND x.entry_date_sk = z.entry_date_sk
AND order_date <> entry_date
AND MONTH(entry_date) = MONTH(CURRENT_DATE)
AND YEAR(entry_date) = YEAR(CURRENT_DATE)
AND x.product_sk = w.product_sk
GROUP BY y.month, y.year, product_sk) b

, month_dim c

SET month_order_amount = month_order_amount + b.order_amount
, month_order_quantity = month_order_quantity + b.order_quantity
WHERE 
    a.month_order_sk = c.month_sk
AND b.month = c.month
AND b.year = c.year
AND a.product_sk = b.product_sk
;

/* late arrival but amount & quantity not exist for the past month   */  

INSERT INTO month_end_sales_order_fact
SELECT
  d.month_sk
, a.product_sk
, SUM(order_amount)
, SUM(order_quantity)
FROM
  sales_order_fact a
, order_date_dim b
, entry_date_dim c
, month_dim d
WHERE
    a.order_date_sk = b.order_date_sk
AND a.entry_date_sk = c.entry_date_sk
AND b.order_date <> c.entry_date
AND c.month = MONTH(CURRENT_DATE)
AND c.year = YEAR(CURRENT_DATE)
AND b.month = d.month
AND b.year = d.year
AND NOT EXISTS 
(SELECT * FROM 
  month_end_sales_order_fact p
, sales_order_fact q
, month_dim s
WHERE 
    p.month_order_sk = s.month_sk
AND s.month = d.month 
AND s.year = d.year
AND p.product_sk = a.product_sk )
GROUP BY  d.month, d.year, a.product_sk
;

/* end of script                                                     */
