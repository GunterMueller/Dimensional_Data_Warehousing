/*********************************************************************/
/*                                                                   */
/* month_rollup_dim.sql                                              */                  
/*                                                                   */
/*********************************************************************/

USE dw;

CREATE TABLE month_dim
( month_sk INT NOT NULL AUTO_INCREMENT PRIMARY KEY
, month_name CHAR(9)
, month INT(2)
, quarter INT(1)
, year INT(4)
, effective_date DATE
, expiry_date DATE )
;

INSERT INTO month_dim
SELECT DISTINCT
  NULL
, month_name
, month
, quarter
, year
, effective_date
, expiry_date
FROM date_dim
;

/* end of script                                                     */
