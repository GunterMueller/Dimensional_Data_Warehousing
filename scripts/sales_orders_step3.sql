/*********************************************************************/
/*                                                                   */
/* sales_orders_step3.sql                                            */                                              
/*                                                                   */
/*********************************************************************/

USE source;

INSERT INTO sales_order VALUES
  (50, 1, 1, '2007-03-06', 'A', '2007-03-10', '2007-03-06', 7500, 75) 
, (50, 1, 1, '2007-03-06', 'P', '2007-03-10', '2007-03-06', 7500, 75) 
, (51, 2, 2, '2007-03-06', 'A', '2007-03-10', '2007-03-06', 1000, 10)
;

/* end of script                                                     */

