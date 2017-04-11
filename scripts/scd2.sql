/*********************************************************************/
/*                                                                   */
/* scd2.sql                                                          */                  
/*                                                                   */
/*********************************************************************/

/* default database to dw                                            */
                 

USE dw;

/* expire the existing product					 */

UPDATE 
  product_dim a
, product_stg b
SET
  expiry_date = SUBDATE(CURRENT_DATE, 1)
WHERE
    a.product_code = b.product_code
AND (   a.product_name <> b.product_name
     OR a.product_category <> b.product_category )
AND expiry_date = '9999-12-31'
;

/* add a new row for the changing product                           */
                   

INSERT INTO product_dim 
SELECT
  NULL	
, b.product_code
, b.product_name
, b.product_category
, CURRENT_DATE
, '9999-12-31'
FROM 
  product_dim a
, product_stg b	
WHERE 
    a.product_code = b.product_code
AND (   a.product_name <> b.product_name
     OR a.product_category <> b.product_category )
AND EXISTS 
( SELECT * FROM product_dim x 
  WHERE   b.product_code = x.product_code 
      AND a.expiry_date = SUBDATE(CURRENT_DATE, 1) )
AND NOT EXISTS 
( SELECT *
  FROM product_dim y 
  WHERE     b.product_code = y.product_code 
        AND y.expiry_date = '9999-12-31' )
;

/* add new product                                                   */
               
INSERT INTO product_dim
SELECT
  NULL	
, product_code
, product_name
, product_category
, CURRENT_DATE
, '9999-12-31'
FROM product_stg 	
WHERE product_code NOT IN(
SELECT y.product_code 
FROM product_dim x, product_stg y 
WHERE x.product_code = y.product_code )
;

/* end of script                                                     */
