/*********************************************************************/
/*                                                                   */
/* special_dates.sql                                                 */                  
/*                                                                   */
/*********************************************************************/

INSERT INTO date_dim VALUES
  ( NULL, '9999-12-31', 'December', 12, 4, 9999, NULL, '0000-00-00', '9999-12-31')
, ( NULL, '0000-00-00', NULL, NULL, NULL, 0000, NULL, '0000-00-00', '9999-12-31')
;

/* end of script                                                     */
