/*********************************************************************/
/*                                                                   */
/* request_delivery_date_sk.sql                                      */                      
/*                                                                   */
/*********************************************************************/

USE dw;

ALTER TABLE sales_order_fact
ADD request_delivery_date_sk INT AFTER order_date_sk
;

/* end of script                                                     */
