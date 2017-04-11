/*********************************************************************/
/*                                                                   */
/* push_sales_order.sql                                              */                  
/*                                                                   */
/*********************************************************************/

/* point to source database                                          */

USE source;

DELIMITER // ;

DROP PROCEDURE IF EXISTS push_sales_order //

CREATE PROCEDURE push_sales_order()
BEGIN

INSERT INTO dw.sales_order_fact
SELECT
  b.order_sk
, c.customer_sk
, d.product_sk
, e.date_sk
, a.order_amount
FROM
  sales_order a
, dw.order_dim b
, dw.customer_dim c
, dw.product_dim d
, dw.date_dim e
WHERE
    a.entry_date = CURRENT_DATE
AND a.order_number = b.order_number
AND a.customer_number = c.customer_number
AND a.product_code = d.product_code
AND a.order_date >= d.effective_date
AND a.order_date <= d.expiry_date
AND a.order_date = e.date
;
END
//

DELIMITER ; //

/* end of script                                                     */
