/*********************************************************************/
/*                                                                   */
/* create_month_end_sales_order_fact.sql                             */                  
/*                                                                   */
/*********************************************************************/

USE dw;

CREATE TABLE month_end_sales_order_fact 
( month_order_sk INT
, product_sk INT
, month_order_amount DEC(10,2)
, month_order_quantity INT )
;

/* end of script                                                     */
