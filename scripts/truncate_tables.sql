/*********************************************************************/
/*                                                                   */
/* truncate_tables.sql                                               */                  
/*                                                                   */
/*********************************************************************/

USE dw;

TRUNCATE customer_dim;
TRUNCATE product_dim;
TRUNCATE order_dim;
TRUNCATE date_dim;
TRUNCATE sales_order_fact;
TRUNCATE customer_stg;
TRUNCATE product_stg;

USE source;

TRUNCATE sales_order;

/* end of script                                                     */
