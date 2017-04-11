/*********************************************************************/
/*                                                                   */
/* order_quantity.sql                                                */                  
/*                                                                   */
/*********************************************************************/

USE dw;

ALTER TABLE sales_order_fact
  ADD order_quantity INT AFTER order_amount

;

/* end of script                                                     */
