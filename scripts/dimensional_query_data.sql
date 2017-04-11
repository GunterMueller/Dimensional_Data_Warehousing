/*********************************************************************/
/*                                                                   */
/* dimensional_query_data.sql                                        */                  
/*                                                                   */
/*********************************************************************/

USE dw;

INSERT INTO order_dim VALUES
  (NULL, 11, CURRENT_DATE, '9999-12-31')
, (NULL, 12, CURRENT_DATE, '9999-12-31')
, (NULL, 13, CURRENT_DATE, '9999-12-31')
, (NULL, 14, CURRENT_DATE, '9999-12-31')
, (NULL, 15, CURRENT_DATE, '9999-12-31')
, (NULL, 16, CURRENT_DATE, '9999-12-31')
;

INSERT INTO date_dim VALUES
  (NULL, '2005-11-01', 'November', 11, 4, 2005, CURRENT_DATE, '9999-12-31')
;

INSERT INTO sales_order_fact VALUES
  (11, 1, 2, 2, 20000) 
, (12, 2, 3, 2, 25000)
, (13, 3, 4, 2, 30000)
, (14, 4, 2, 2, 35000) 
, (15, 5, 3, 2, 40000)
, (16, 1, 4, 2, 45000)
;

/* end of script                                                     */
