/*********************************************************************/
/*                                                                   */
/* scd1.sql                                                          */                  
/*                                                                   */
/*********************************************************************/

/* default database to dw                                            */

USE dw;

/* update existing customers                                         */

UPDATE customer_dim a, customer_stg b
SET a.customer_name = b.customer_name
WHERE     a.customer_number = b.customer_number
      AND a.expiry_date = '9999-12-31'
      AND a.customer_name <> b.customer_name
;

/* add new customers                                                 */

INSERT INTO customer_dim
SELECT
  NULL	
, customer_number
, customer_name
, customer_street_address
, customer_zip_code
, customer_city
, customer_state
, CURRENT_DATE
, '9999-12-31'
FROM customer_stg 	
WHERE customer_number NOT IN(
SELECT b.customer_number 
FROM customer_dim a, customer_stg b 
WHERE a.customer_number = b.customer_number )
;

/* end of script                                                     */
