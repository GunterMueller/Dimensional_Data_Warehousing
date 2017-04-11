/*********************************************************************/
/*                                                                   */
/* production_regular_23.sql                                         */                    
/*                                                                   */
/*********************************************************************/
USE dw;

LOAD DATA INFILE 'factory.csv'
REPLACE
INTO TABLE factory_stg
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
( factory_code
, factory_name
, factory_street_address
, factory_zip_code
, factory_city
, factory_state )
;

/* SCD1                                                              */

UPDATE factory_dim a, factory_stg b
SET 
  a.factory_name = b.factory_name
, a.factory_street_address = b.factory_street_address
WHERE a.factory_code = b.factory_code
;

/* add new factory                                                   */

INSERT INTO factory_dim
SELECT
  NULL
, factory_code
, factory_name
, factory_street_address
, CURRENT_DATE
, '9999-12-31'
FROM factory_stg
WHERE factory_code NOT IN (
SELECT y.factory_code 
FROM factory_dim x, factory_stg y 
WHERE x.factory_code = y.factory_code )
;

INSERT INTO production_fact
SELECT
  b.product_sk
, c.date_sk
, d.factory_sk
, e.factory_zip_code_sk
, production_quantity
FROM
  source.daily_production a
, product_dim b
, date_dim c
, factory_dim d
, factory_zip_code_dim e
, factory_stg f
WHERE
    production_date = CURRENT_DATE
AND a.product_code = b.product_code
AND a.production_date >= b.effective_date
AND a.production_date <= b.expiry_date
AND a.factory_code = f.factory_code
AND f.factory_zip_code = e.factory_zip_code
AND a.production_date >= e.effective_date
AND a.production_date <= e.expiry_date
AND a.production_date = c.date
AND a.factory_code = d.factory_code
;

/* end of script                                                     */
