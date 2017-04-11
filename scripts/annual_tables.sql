/*********************************************************************/
/*                                                                   */
/* annual_tables.sql                                                 */
/*                                                                   */
/*********************************************************************/

USE dw;

CREATE TABLE year_dim
( year_sk INT NOT NULL AUTO_INCREMENT PRIMARY KEY
, year INT(4)
, effective_date DATE
, expiry_date DATE )
;

CREATE TABLE annual_sales_order_fact
( customer_sk INT
, year_sk INT
, annual_order_amount DEC(10,2) )
;

CREATE TABLE annual_customer_segment_fact
( segment_sk INT
, customer_sk INT
, year_sk INT
;

/* end of script                                                     */
