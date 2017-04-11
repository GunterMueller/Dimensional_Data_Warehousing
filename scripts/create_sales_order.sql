/*********************************************************************/
/*                                                                   */
/* create_sales_order.sql                                            */                  
/*                                                                   */
/*********************************************************************/

USE source;

CREATE TABLE sales_order
( order_number INT
, customer_number INT 
, product_code INT
, order_date DATE
, entry_date DATE
, order_amount DECIMAL(10,2)) 
;

/* end of script                                                     */
