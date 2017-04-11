/*********************************************************************/
/*                                                                   */
/* month_end_balance_fact.sql                                        */                                                
/*                                                                   */
/*********************************************************************/

USE dw;

CREATE TABLE month_end_balance_fact
(month_sk INT 
, product_sk INT
, month_end_amount_balance DEC(10,2)
, month_end_quantity_balance INT )
;

/* end of script                                                     */
