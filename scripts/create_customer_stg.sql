/*********************************************************************/
/*                                                                   */
/* create_customer_stg.sql                                           */                  
/*                                                                   */
/*********************************************************************/

/* default database to dw                                            */

USE dw;

/* create customer_stg table                                         */

CREATE TABLE customer_stg
(customer_number INT
, customer_name CHAR(30)
, customer_street_address CHAR(30)
, customer_zip_code INT(5)
, customer_city CHAR(30)
, customer_state CHAR(2) )
;

/* clean up customer_stg table and load customer.csv                 */

TRUNCATE customer_stg;

LOAD DATA INFILE 'customer.csv'
INTO TABLE customer_stg
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
( customer_number
, customer_name 
, customer_street_address 
, customer_zip_code 
, customer_city 
, customer_state )
;

/* end of script                                                     */
