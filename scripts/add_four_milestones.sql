/*********************************************************************/
/*                                                                   */
/* add_four_milestones.sql                                           */                  
/*                                                                   */
/*********************************************************************/

USE dw;

ALTER TABLE sales_order_fact
  ADD allocate_date_sk INT AFTER order_date_sk
, ADD allocate_quantity INT
, ADD packing_date_sk INT AFTER allocate_date_sk
, ADD packing_quantity INT
, ADD ship_date_sk INT AFTER packing_date_sk
, ADD ship_quantity INT
, ADD receive_date_sk INT AFTER ship_date_sk
, ADD receive_quantity INT
;

/* end of script                                                     */
