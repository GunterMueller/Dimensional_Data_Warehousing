/*********************************************************************/
/*                                                                   */
/* source_date.sql                                                   */                  
/*                                                                   */
/*********************************************************************/

USE dw;

INSERT INTO date_dim
SELECT DISTINCT
  NULL 
, order_date
, MONTHNAME(order_date)
, MONTH(order_date)
, QUARTER(order_date)
, YEAR(order_date)
, '0000-00-00'
, '9999-12-31'
FROM source.sales_order
WHERE order_date NOT IN
(SELECT date FROM date_dim)
;

/* end of script                                                     */
