/*********************************************************************/
/*                                                                   */
/* pre_populate_date.sql                                             */                 
/*                                                                   */
/*********************************************************************/

USE dw;

DELIMITER // ;

DROP PROCEDURE IF EXISTS pre_populate_date //

CREATE PROCEDURE pre_populate_date (IN start_dt DATE, IN end_dt DATE)
BEGIN
	WHILE start_dt <= end_dt DO
		INSERT INTO date_dim(
		  date_sk
		, date
		, month_name
		, month
		, quarter
		, year
		, effective_date
		, expiry_date
		)
		VALUES(
		  NULL
		, start_dt
		, MONTHNAME(start_dt)
		, MONTH(start_dt)
		, QUARTER(start_dt)
		, YEAR(start_dt)
		, '0000-00-00'
		, '9999-12-31'
	)
		;
		SET start_dt = ADDDATE(start_dt, 1);
	END WHILE;
END
//

DELIMITER ; //

/* end of script                                                     */
