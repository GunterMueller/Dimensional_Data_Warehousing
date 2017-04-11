/*********************************************************************/
/*                                                                   */
/* production_fact_23.sql                                            */
/*                                                                   */
/*********************************************************************/

USE dw;

CREATE VIEW factory_zip_code_dim 
( factory_zip_code_sk
, factory_zip_code
, factory_city
, factory_state
, effective_date
, expiry_date )
AS SELECT
  zip_code_sk
, zip_code
, city
, state
, effective_date
, expiry_date
FROM zip_code_dim
;

ALTER TABLE production_fact
  ADD factory_zip_code_sk INT AFTER factory_sk
;

UPDATE production_fact a, factory_dim b, factory_zip_code_dim c
SET
  a.factory_zip_code_sk = c.factory_zip_code_sk
WHERE 
    a.factory_sk = b.factory_sk
AND b.factory_zip_code = c.factory_zip_code
;

TRUNCATE factory_stg;

ALTER TABLE factory_stg
ADD PRIMARY KEY (factory_code)
;

INSERT INTO factory_stg
SELECT
  factory_code
, factory_name
, factory_street_address
, factory_zip_code
, factory_city
, factory_state
FROM factory_dim
;

ALTER TABLE factory_dim
  DROP factory_zip_code
, DROP factory_city
, DROP factory_state
;

/* end of script                                                     */
