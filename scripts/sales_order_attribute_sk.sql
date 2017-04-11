/*********************************************************************/
/*                                                                   */
/* sales_order_attribute_sk.sql                                      */                   
/*                                                                   */
/*********************************************************************/

USE dw;

ALTER TABLE sales_order_fact
ADD sales_order_attribute_sk INT AFTER product_sk
;

