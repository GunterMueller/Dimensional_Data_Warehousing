/*********************************************************************/
/*                                                                   */
/* load_product_stg.sql                                              */                  
/*                                                                   */
/*********************************************************************/

/* default database to dw                                            */

USE dw;

/* clean up the staging table                                        */

TRUNCATE product_stg;

/* use LOAD DATA INFILE                                              */

LOAD DATA INFILE 'product.txt'
INTO TABLE product_stg
FIELDS TERMINATED BY ''
OPTIONALLY ENCLOSED BY ''
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
( product_code
, product_name 
, product_category )
;

/* end of script                                                     */
