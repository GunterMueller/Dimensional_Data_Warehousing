/*********************************************************************/
/*                                                                   */
/* create_dw_tables.sql                                              */
/*                                                                   */
/*********************************************************************/

/* default to dw database                                            */

USE dw;

/* creating customer_dim table                                       */

CREATE TABLE customer_dim 
( customer_sk INT NOT NULL AUTO_INCREMENT PRIMARY KEY
, customer_number INT
, customer_name CHAR(50)
, customer_street_address CHAR(50)
, customer_zip_code INT(5)
, customer_city CHAR(30)
, customer_state CHAR(2)
, effective_date DATE
, expiry_date DATE )
;

/* creating product_dim table                                                */

CREATE TABLE product_dim 
( product_sk INT NOT NULL AUTO_INCREMENT PRIMARY KEY
, product_code INT
, product_name CHAR(30)
, product_category CHAR(30)
, effective_date DATE
, expiry_date DATE )
;

/* creating order_dim table                                          */

CREATE TABLE order_dim 
( order_sk INT NOT NULL AUTO_INCREMENT PRIMARY KEY
, order_number INT
, effective_date DATE
, expiry_date DATE )
;

/* creating date_dim table                                           */

CREATE TABLE date_dim 
( date_sk INT NOT NULL AUTO_INCREMENT PRIMARY KEY
, date DATE
, month_name CHAR(9)
, month INT(1)
, quarter INT(1)
, year INT(4)
, effective_date DATE
, expiry_date DATE )
;

/* creating sales_order_fact_table                                   */

CREATE TABLE sales_order_fact 
( order_sk INT 
, customer_sk INT 
, product_sk INT
, order_date_sk INT
, order_amount DECIMAL(10,2) ) 
;

/* end of script                                                     */
