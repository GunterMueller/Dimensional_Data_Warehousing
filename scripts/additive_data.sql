/*********************************************************************/
/*                                                                   */
/* additive_data.sql                                                 */                  
/*                                                                   */
/*********************************************************************/

USE dw;

INSERT INTO order_dim VALUES
  (NULL, 1, CURRENT_DATE, '9999-12-31')
, (NULL, 2, CURRENT_DATE, '9999-12-31')
, (NULL, 3, CURRENT_DATE, '9999-12-31')
, (NULL, 4, CURRENT_DATE, '9999-12-31')
, (NULL, 5, CURRENT_DATE, '9999-12-31')
, (NULL, 6, CURRENT_DATE, '9999-12-31')
, (NULL, 7, CURRENT_DATE, '9999-12-31')
, (NULL, 8, CURRENT_DATE, '9999-12-31')
, (NULL, 9, CURRENT_DATE, '9999-12-31')
, (NULL, 10, CURRENT_DATE, '9999-12-31')
;

INSERT INTO date_dim VALUES
  (NULL, '2005-10-31', 'October', 10, 4, 2005, CURRENT_DATE, '9999-12-31')
;

INSERT INTO sales_order_fact VALUES
  (1, 1, 2, 1, 1000)
, (2, 2, 3, 1, 1000)
, (3, 3, 4, 1, 4000)
, (4, 4, 2, 1, 4000)
, (5, 5, 3, 1, 6000)
, (6, 1, 4, 1, 6000)
, (7, 2, 2, 1, 8000)
, (8, 3, 3, 1, 8000)
, (9, 4, 4, 1, 10000)
, (10, 5, 2, 1, 10000)
;

/* end of script                                                     */
