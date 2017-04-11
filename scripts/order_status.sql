/*********************************************************************/
/*                                                                   */
/* order_status.sql                                                  */                        
/*                                                                   */
/*********************************************************************/

USE source;

ALTER TABLE sales_order
  CHANGE order_date status_date DATE
, ADD order_status CHAR(1) AFTER status_date
, CHANGE order_quantity quantity INT
;

/* end of script                                                     */
