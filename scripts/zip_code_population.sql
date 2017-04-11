/*********************************************************************/
/*                                                                   */
/* zip_code_population.sql                                           */                  
/*                                                                   */
/*********************************************************************/

/* default to dw                                                     */

USE dw;

TRUNCATE zip_code_stg;

LOAD DATA INFILE 'zip_code.csv'
INTO TABLE zip_code_stg
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY ''
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
( zip_code
, city 
, state	)
;

INSERT INTO zip_code_dim 
SELECT
  NULL
, zip_code
, city
, state
, '0000-00-00'
, '9999-12-31'
FROM zip_code_stg
;

/* end of script                                                     */
