/*********************************************************************/
/*                                                                   */
/* request_delivery_date.sql                                         */                  
/*                                                                   */
/*********************************************************************/

USE source;

ALTER TABLE sales_order
  ADD request_delivery_date DATE AFTER order_date

;

/* end of script                                                     */
