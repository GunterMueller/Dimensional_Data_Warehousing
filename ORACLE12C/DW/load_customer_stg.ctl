--
OPTIONS(SKIP=1)
load data 
infile  '../../source_data/customer2.csv'
append
into table CUSTOMER_STG
fields terminated by ","
( customer_number
, customer_name 
, customer_street_address 
, customer_zip_code 
, customer_city 
, customer_state )

