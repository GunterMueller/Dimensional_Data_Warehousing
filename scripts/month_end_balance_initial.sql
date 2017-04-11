/*********************************************************************/
/*                                                                   */
/* month_end_balance_initial.sql                                     */
/*                                                                   */
/*********************************************************************/

USE dw;

/* January                                                           */

INSERT INTO month_end_balance_fact
SELECT m.* 
FROM 
   month_end_sales_order_fact m
, month_dim n
WHERE 
    month = 1 
AND m.month_order_sk = n.month_sk
;


/* February                                                          */

INSERT INTO month_end_balance_fact
SELECT n.month_order_sk, n.product_sk, 
(n.month_order_amount + m.month_end_amount_balance), 
(n.month_order_quantity + m.month_end_quantity_balance)
FROM 
  month_end_balance_fact m
,  month_end_sales_order_fact n
, month_dim o
, month_dim p
WHERE 
    o.month = 1 
AND p.month = 2
AND m.month_sk = o.month_sk AND n.month_order_sk = p.month_sk
AND o.year = p.year
AND m.product_sk = n.product_sk
;

INSERT INTO month_end_balance_fact
SELECT m.*
FROM 
   month_end_sales_order_fact m
, month_dim n
WHERE 
    n.month = 2 
AND m.month_order_sk = n.month_sk
AND m.product_sk NOT IN (
 SELECT x.product_sk 
 FROM month_end_balance_fact x, month_dim y
 WHERE x.month_sk = y.month_sk AND y.month = 1
 AND y.year = n.year ) 
;

INSERT INTO month_end_balance_fact
SELECT o.month_sk, m.product_sk, m.month_end_amount_balance, 
m.month_end_quantity_balance
FROM 
  month_end_balance_fact m
, month_dim n
, month_dim o
WHERE 
    n.month = 1
AND m.month_sk = n.month_sk
AND o.month = 2
AND n.year = o.year
AND m.product_sk NOT IN (
SELECT x.product_sk 
FROM  month_end_sales_order_fact x, month_dim y 
WHERE x.month_order_sk = y.month_sk AND y.month = 2 
AND y.year = n.year)
;

/* March                                                             */

INSERT INTO month_end_balance_fact
SELECT n.month_order_sk, n.product_sk, 
(n.month_order_amount + m.month_end_amount_balance), 
(n.month_order_quantity + m.month_end_quantity_balance)
FROM 
  month_end_balance_fact m
,  month_end_sales_order_fact n
, month_dim o
, month_dim p
WHERE 
    o.month = 2 
AND p.month = 3
AND m.month_sk = o.month_sk AND n.month_order_sk = p.month_sk
AND o.year = p.year
AND m.product_sk = n.product_sk
AND (p.year <= 2007)
;

INSERT INTO month_end_balance_fact
SELECT m.*
FROM 
   month_end_sales_order_fact m
, month_dim n
WHERE 
    n.month = 3 
AND m.month_order_sk = n.month_sk
AND m.product_sk NOT IN (
 SELECT x.product_sk 
 FROM month_end_balance_fact x, month_dim y
 WHERE x.month_sk = y.month_sk AND y.month = 2
 AND y.year = n.year ) 
AND (n.year <= 2007)
;

INSERT INTO month_end_balance_fact
SELECT o.month_sk, m.product_sk, m.month_end_amount_balance, 
m.month_end_quantity_balance
FROM 
  month_end_balance_fact m
, month_dim n
, month_dim o
WHERE 
    n.month = 2
AND m.month_sk = n.month_sk
AND o.month = 3
AND n.year = o.year
AND m.product_sk NOT IN (
SELECT x.product_sk 
FROM  month_end_sales_order_fact x, month_dim y 
WHERE x.month_order_sk = y.month_sk AND y.month = 3 
AND y.year = n.year)
AND (o.year <= 2007)
;

/* April                                                             */

INSERT INTO month_end_balance_fact
SELECT n.month_order_sk, n.product_sk, 
(n.month_order_amount + m.month_end_amount_balance), 
(n.month_order_quantity + m.month_end_quantity_balance)
FROM 
  month_end_balance_fact m
,  month_end_sales_order_fact n
, month_dim o
, month_dim p
WHERE 
    o.month = 3 
AND p.month = 4
AND m.month_sk = o.month_sk AND n.month_order_sk = p.month_sk
AND o.year = p.year
AND m.product_sk = n.product_sk
AND (p.year <= 2007)
;

INSERT INTO month_end_balance_fact
SELECT m.*
FROM 
   month_end_sales_order_fact m
, month_dim n
WHERE 
    n.month = 4 
AND m.month_order_sk = n.month_sk
AND m.product_sk NOT IN (
 SELECT x.product_sk 
 FROM month_end_balance_fact x, month_dim y
 WHERE x.month_sk = y.month_sk AND y.month = 3
 AND y.year = n.year ) 
AND (n.year <= 2007)
;

INSERT INTO month_end_balance_fact
SELECT o.month_sk, m.product_sk, m.month_end_amount_balance, 
m.month_end_quantity_balance
FROM 
  month_end_balance_fact m
, month_dim n
, month_dim o
WHERE 
    n.month = 3
AND m.month_sk = n.month_sk
AND o.month = 4
AND n.year = o.year
AND m.product_sk NOT IN (
SELECT x.product_sk 
FROM  month_end_sales_order_fact x, month_dim y 
WHERE x.month_order_sk = y.month_sk AND y.month = 4 
AND y.year = n.year)
AND (o.year <= 2007)
;

/* May                                                               */

INSERT INTO month_end_balance_fact
SELECT n.month_order_sk, n.product_sk, 
(n.month_order_amount + m.month_end_amount_balance), 
(n.month_order_quantity + m.month_end_quantity_balance)
FROM 
  month_end_balance_fact m
,  month_end_sales_order_fact n
, month_dim o
, month_dim p
WHERE 
    o.month = 4 
AND p.month = 5
AND m.month_sk = o.month_sk AND n.month_order_sk = p.month_sk
AND o.year = p.year
AND m.product_sk = n.product_sk
AND (p.year < 2007)
;

INSERT INTO month_end_balance_fact
SELECT m.*
FROM 
   month_end_sales_order_fact m
, month_dim n
WHERE 
    n.month = 5 
AND m.month_order_sk = n.month_sk
AND m.product_sk NOT IN (
 SELECT x.product_sk 
 FROM month_end_balance_fact x, month_dim y
 WHERE x.month_sk = y.month_sk AND y.month = 4
 AND y.year = n.year ) 
AND (n.year < 2007)
;

INSERT INTO month_end_balance_fact
SELECT o.month_sk, m.product_sk, m.month_end_amount_balance, 
m.month_end_quantity_balance
FROM 
  month_end_balance_fact m
, month_dim n
, month_dim o
WHERE 
    n.month = 4
AND m.month_sk = n.month_sk
AND o.month = 5
AND n.year = o.year
AND m.product_sk NOT IN (
SELECT x.product_sk 
FROM  month_end_sales_order_fact x, month_dim y 
WHERE x.month_order_sk = y.month_sk AND y.month = 5 
AND y.year = n.year)
AND (o.year < 2007)
;

/* June                                                              */

INSERT INTO month_end_balance_fact
SELECT n.month_order_sk, n.product_sk, 
(n.month_order_amount + m.month_end_amount_balance), 
(n.month_order_quantity + m.month_end_quantity_balance)
FROM 
  month_end_balance_fact m
,  month_end_sales_order_fact n
, month_dim o
, month_dim p
WHERE 
    o.month = 5 
AND p.month = 6
AND m.month_sk = o.month_sk AND n.month_order_sk = p.month_sk
AND o.year = p.year
AND m.product_sk = n.product_sk
AND (p.year < 2007)
;

INSERT INTO month_end_balance_fact
SELECT m.*
FROM 
   month_end_sales_order_fact m
, month_dim n
WHERE 
    n.month = 6 
AND m.month_order_sk = n.month_sk
AND m.product_sk NOT IN (
 SELECT x.product_sk 
 FROM month_end_balance_fact x, month_dim y
 WHERE x.month_sk = y.month_sk AND y.month = 5
 AND y.year = n.year )
AND (n.year < 2007) 
;

INSERT INTO month_end_balance_fact
SELECT o.month_sk, m.product_sk, m.month_end_amount_balance, 
m.month_end_quantity_balance
FROM 
  month_end_balance_fact m
, month_dim n
, month_dim o
WHERE 
    n.month = 5
AND m.month_sk = n.month_sk
AND o.month = 6
AND n.year = o.year
AND m.product_sk NOT IN (
SELECT x.product_sk 
FROM  month_end_sales_order_fact x, month_dim y 
WHERE x.month_order_sk = y.month_sk AND y.month = 6 
AND y.year = n.year)
AND (o.year < 2007)
;

/* July                                                              */

INSERT INTO month_end_balance_fact
SELECT n.month_order_sk, n.product_sk, 
(n.month_order_amount + m.month_end_amount_balance), 
(n.month_order_quantity + m.month_end_quantity_balance)
FROM 
  month_end_balance_fact m
,  month_end_sales_order_fact n
, month_dim o
, month_dim p
WHERE 
    o.month = 6 
AND p.month = 7
AND m.month_sk = o.month_sk AND n.month_order_sk = p.month_sk
AND o.year = p.year
AND m.product_sk = n.product_sk
AND (p.year < 2007)
;

INSERT INTO month_end_balance_fact
SELECT m.*
FROM 
   month_end_sales_order_fact m
, month_dim n
WHERE 
    n.month = 7 
AND m.month_order_sk = n.month_sk
AND m.product_sk NOT IN (
 SELECT x.product_sk 
 FROM month_end_balance_fact x, month_dim y
 WHERE x.month_sk = y.month_sk AND y.month = 6
 AND y.year = n.year ) 
AND (n.year < 2007)
;

INSERT INTO month_end_balance_fact
SELECT o.month_sk, m.product_sk, m.month_end_amount_balance, 
m.month_end_quantity_balance
FROM 
  month_end_balance_fact m
, month_dim n
, month_dim o
WHERE 
    n.month = 6
AND m.month_sk = n.month_sk
AND o.month = 7
AND n.year = o.year
AND m.product_sk NOT IN (
SELECT x.product_sk 
FROM  month_end_sales_order_fact x, month_dim y 
WHERE x.month_order_sk = y.month_sk AND y.month = 7 
AND y.year = n.year)
AND (o.year < 2007)
;

/* August                                                            */

INSERT INTO month_end_balance_fact
SELECT n.month_order_sk, n.product_sk, 
(n.month_order_amount + m.month_end_amount_balance), 
(n.month_order_quantity + m.month_end_quantity_balance)
FROM 
  month_end_balance_fact m
,  month_end_sales_order_fact n
, month_dim o
, month_dim p
WHERE 
    o.month = 7 
AND p.month = 8
AND m.month_sk = o.month_sk AND n.month_order_sk = p.month_sk
AND o.year = p.year
AND m.product_sk = n.product_sk
AND (p.year < 2007)
;

INSERT INTO month_end_balance_fact
SELECT m.*
FROM 
   month_end_sales_order_fact m
, month_dim n
WHERE 
    n.month = 8 
AND m.month_order_sk = n.month_sk
AND m.product_sk NOT IN (
 SELECT x.product_sk 
 FROM month_end_balance_fact x, month_dim y
 WHERE x.month_sk = y.month_sk AND y.month = 7
 AND y.year = n.year ) 
AND (n.year < 2007)
;

INSERT INTO month_end_balance_fact
SELECT o.month_sk, m.product_sk, m.month_end_amount_balance, 
m.month_end_quantity_balance
FROM 
  month_end_balance_fact m
, month_dim n
, month_dim o
WHERE 
    n.month = 7
AND m.month_sk = n.month_sk
AND o.month = 8
AND n.year = o.year
AND m.product_sk NOT IN (
SELECT x.product_sk 
FROM  month_end_sales_order_fact x, month_dim y 
WHERE x.month_order_sk = y.month_sk AND y.month = 8 
AND y.year = n.year)
AND (o.year < 2007)
;

/* September                                                         */

INSERT INTO month_end_balance_fact
SELECT n.month_order_sk, n.product_sk, 
(n.month_order_amount + m.month_end_amount_balance), 
(n.month_order_quantity + m.month_end_quantity_balance)
FROM 
  month_end_balance_fact m
,  month_end_sales_order_fact n
, month_dim o
, month_dim p
WHERE 
    o.month = 8 
AND p.month = 9
AND m.month_sk = o.month_sk AND n.month_order_sk = p.month_sk
AND o.year = p.year
AND m.product_sk = n.product_sk
AND (p.year < 2007)
;

INSERT INTO month_end_balance_fact
SELECT m.*
FROM 
   month_end_sales_order_fact m
, month_dim n
WHERE 
    n.month = 9 
AND m.month_order_sk = n.month_sk
AND m.product_sk NOT IN (
 SELECT x.product_sk 
 FROM month_end_balance_fact x, month_dim y
 WHERE x.month_sk = y.month_sk AND y.month = 8
 AND y.year = n.year ) 
AND (n.year < 2007)
;

INSERT INTO month_end_balance_fact
SELECT o.month_sk, m.product_sk, m.month_end_amount_balance, 
m.month_end_quantity_balance
FROM 
  month_end_balance_fact m
, month_dim n
, month_dim o
WHERE 
    n.month = 8
AND m.month_sk = n.month_sk
AND o.month = 9
AND n.year = o.year
AND m.product_sk NOT IN (
SELECT x.product_sk 
FROM  month_end_sales_order_fact x, month_dim y 
WHERE x.month_order_sk = y.month_sk AND y.month = 9 
AND y.year = n.year)
AND (o.year < 2007)
;

/* October                                                           */

INSERT INTO month_end_balance_fact
SELECT n.month_order_sk, n.product_sk, 
(n.month_order_amount + m.month_end_amount_balance), 
(n.month_order_quantity + m.month_end_quantity_balance)
FROM 
  month_end_balance_fact m
,  month_end_sales_order_fact n
, month_dim o
, month_dim p
WHERE 
    o.month = 9 
AND p.month = 10
AND m.month_sk = o.month_sk AND n.month_order_sk = p.month_sk
AND o.year = p.year
AND m.product_sk = n.product_sk
AND (p.year < 2007)
;

INSERT INTO month_end_balance_fact
SELECT m.*
FROM 
   month_end_sales_order_fact m
, month_dim n
WHERE 
    n.month = 10 
AND m.month_order_sk = n.month_sk
AND m.product_sk NOT IN (
 SELECT x.product_sk 
 FROM month_end_balance_fact x, month_dim y
 WHERE x.month_sk = y.month_sk AND y.month = 9
 AND y.year = n.year ) 
AND (n.year < 2007)
;

INSERT INTO month_end_balance_fact
SELECT o.month_sk, m.product_sk, m.month_end_amount_balance, 
m.month_end_quantity_balance
FROM 
  month_end_balance_fact m
, month_dim n
, month_dim o
WHERE 
    n.month = 9
AND m.month_sk = n.month_sk
AND o.month = 10
AND n.year = o.year
AND m.product_sk NOT IN (
SELECT x.product_sk 
FROM  month_end_sales_order_fact x, month_dim y 
WHERE x.month_order_sk = y.month_sk AND y.month = 10 
AND y.year = n.year)
AND (o.year < 2007)
;

/* November                                                          */

INSERT INTO month_end_balance_fact
SELECT n.month_order_sk, n.product_sk, 
(n.month_order_amount + m.month_end_amount_balance), 
(n.month_order_quantity + m.month_end_quantity_balance)
FROM 
  month_end_balance_fact m
,  month_end_sales_order_fact n
, month_dim o
, month_dim p
WHERE 
    o.month = 10 
AND p.month = 11
AND m.month_sk = o.month_sk AND n.month_order_sk = p.month_sk
AND o.year = p.year
AND m.product_sk = n.product_sk
AND (p.year < 2007)
;

INSERT INTO month_end_balance_fact
SELECT m.*
FROM 
   month_end_sales_order_fact m
, month_dim n
WHERE 
    n.month = 11 
AND m.month_order_sk = n.month_sk
AND m.product_sk NOT IN (
 SELECT x.product_sk 
 FROM month_end_balance_fact x, month_dim y
 WHERE x.month_sk = y.month_sk AND y.month = 10
 AND y.year = n.year ) 
AND (n.year < 2007)
;

INSERT INTO month_end_balance_fact
SELECT o.month_sk, m.product_sk, m.month_end_amount_balance, 
m.month_end_quantity_balance
FROM 
  month_end_balance_fact m
, month_dim n
, month_dim o
WHERE 
    n.month = 10
AND m.month_sk = n.month_sk
AND o.month = 11
AND n.year = o.year
AND m.product_sk NOT IN (
SELECT x.product_sk 
FROM  month_end_sales_order_fact x, month_dim y 
WHERE x.month_order_sk = y.month_sk AND y.month = 11 
AND y.year = n.year)
AND (o.year < 2007)
;

/* December                                                          */

INSERT INTO month_end_balance_fact
SELECT n.month_order_sk, n.product_sk, 
(n.month_order_amount + m.month_end_amount_balance), 
(n.month_order_quantity + m.month_end_quantity_balance)
FROM 
  month_end_balance_fact m
,  month_end_sales_order_fact n
, month_dim o
, month_dim p
WHERE 
    o.month = 11 
AND p.month = 12
AND m.month_sk = o.month_sk AND n.month_order_sk = p.month_sk
AND o.year = p.year
AND m.product_sk = n.product_sk
AND (p.year < 2007)
;

INSERT INTO month_end_balance_fact
SELECT m.*
FROM 
   month_end_sales_order_fact m
, month_dim n
WHERE 
    n.month = 12 
AND m.month_order_sk = n.month_sk
AND m.product_sk NOT IN (
 SELECT x.product_sk 
 FROM month_end_balance_fact x, month_dim y
 WHERE x.month_sk = y.month_sk AND y.month = 11
 AND y.year = n.year ) 
AND (n.year < 2007)
;

INSERT INTO month_end_balance_fact
SELECT o.month_sk, m.product_sk, m.month_end_amount_balance, 
m.month_end_quantity_balance
FROM 
  month_end_balance_fact m
, month_dim n
, month_dim o
WHERE 
    n.month = 11
AND m.month_sk = n.month_sk
AND o.month = 12
AND n.year = o.year
AND m.product_sk NOT IN (
SELECT x.product_sk 
FROM  month_end_sales_order_fact x, month_dim y 
WHERE x.month_order_sk = y.month_sk AND y.month = 12 
AND y.year = n.year)
AND (o.year < 2007)
;

/* end of script                                                     */
