/*********************************************************************/
/*                                                                   */
/* create_customer_stg.sql                                           */                  
/*                                                                   */
/*********************************************************************/

/* default database to dw                                            */

-- USE dw;


/* clean up customer_stg table and load customer.csv                 */

TRUNCATE customer_stg;

COPY CUSTOMER_STG
( customer_number
, customer_name 
, customer_street_address 
, customer_zip_code 
, customer_city 
, customer_state )
FROM '/home/gunter/GM_DATABASES/DataWarehouse/Dimensional_Data_Warehousing/source_data/customer2.csv' DELIMITER ',' CSV HEADER
;

/* end of script                                                     */
