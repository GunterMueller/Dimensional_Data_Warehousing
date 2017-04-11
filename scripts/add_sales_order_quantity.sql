/*********************************************************************/
/*                                                                   */
/* add_sales_order_quantity.sql                                      */                  
/*                                                                   */
/*********************************************************************/

USE source;

ALTER TABLE sales_order
  ADD order_quantity INT AFTER order_amount

;

/* end of script                                                     */
