/*********************************************************************/
/*                                                                   */
/* degenerate.sql                                                    */                  
/*                                                                   */
/*********************************************************************/

/* default to dw database                                            */

USE dw;

/* adding order_number column                                        */

ALTER TABLE sales_order_fact
ADD order_number INT AFTER receive_date_sk
;

/* loading existing order_number                                     */

UPDATE sales_order_fact a, order_dim b
SET a.order_number = b.order_number
WHERE a.order_sk = b.order_sk
;

/* removing order_sk column                                          */

ALTER TABLE sales_order_fact
  DROP order_sk
;

/* removing the order_dim table                                      */

DROP TABLE order_dim
;

/* end of script                                                     */
