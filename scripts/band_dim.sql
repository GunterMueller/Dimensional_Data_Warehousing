/*********************************************************************/
/*                                                                   */
/* band_dim.sql                                                      */
/*                                                                   */
/*********************************************************************/

USE dw;

CREATE TABLE annual_order_segment_dim
( segment_sk INT NOT NULL AUTO_INCREMENT PRIMARY KEY
, segment_name CHAR(30)
, band_name CHAR(50)
, band_start_amount DEC(10,2)
, band_end_amount DEC(10,2)
, effective_date DATE
, expiry_date DATE ) 
;

INSERT INTO annual_order_segment_dim VALUES
  (NULL, 'PROJECT ALPHA', 'Bottom', 0.01, 2500.00, '0000-00-00', '9999-12-31')
, (NULL, 'PROJECT ALPHA', 'Low', 2500.01, 3000.00, '0000-00-00', '9999-12-31')
, (NULL, 'PROJECT ALPHA', 'Mid-Low', 3000.01, 4000.00, '0000-00-00', '9999-12-31')
, (NULL, 'PROJECT ALPHA', 'Mid', 4000.01, 5500.00, '0000-00-00', '9999-12-31')
, (NULL, 'PROJECT ALPHA', 'Mid_High', 5500.01, 6500.00, '0000-00-00', '9999-12-31')
, (NULL, 'PROJECT ALPHA', 'Top', 6500.01, 99999999.99, '0000-00-00', '9999-12-31')
, (NULL, 'Grid', 'LOW', 0.01, 3000, '0000-00-00', '9999-12-31')
, (NULL, 'Grid', 'MED', 3000.01, 6000.00, '0000-00-00', '9999-12-31')
, (NULL, 'Grid', 'HIGH', 6000.01, 99999999.99, '0000-00-00', '9999-12-31')

/* end of script                                                     */
