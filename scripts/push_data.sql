/*********************************************************************/
/*                                                                   */
/* push_data.sql                                                     */                  
/*                                                                   */
/*********************************************************************/

USE dw;

INSERT INTO order_dim VALUES
  (NULL, 17, CURRENT_DATE, '9999-12-31')
, (NULL, 18, CURRENT_DATE, '9999-12-31')
, (NULL, 19, CURRENT_DATE, '9999-12-31')
, (NULL, 20, CURRENT_DATE, '9999-12-31')
;

INSERT INTO date_dim VALUES
  (NULL, '2007-02-06', 'February', 2, 6, 2007, CURRENT_DATE, '9999-12-31')
;

/* load sales orders in the source database                          */

USE source;

INSERT INTO sales_order VALUES
  (17, 1, 1, '2007-02-06', '2007-02-06', 1000)
, (18, 2, 1, '2007-02-06', '2007-02-06', 1000)
, (19, 3, 1, '2007-02-06', '2007-02-06', 4000)
, (20, 4, 1, '2007-02-06', '2007-02-06', 4000)
;

/* end of script                                                     */
