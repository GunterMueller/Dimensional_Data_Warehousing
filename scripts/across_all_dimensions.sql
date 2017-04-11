/*********************************************************************/
/*                                                                   */
/* across_all_dimensions.sql                                         */                  
/*                                                                   */
/*********************************************************************/

USE dw;

SELECT SUM(order_amount) sum_of_order_amount
FROM sales_order_fact a
;

/* end of script                                                     */
