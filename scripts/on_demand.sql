/*********************************************************************/
/*                                                                   */
/* on_demand.sql                                                        
/*                                                                   */
/*********************************************************************/

USE dw;

TRUNCATE promo_schedule_stg;

LOAD DATA INFILE 'promo_schedule.csv'
INTO TABLE promo_schedule_stg
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
( promo_code
, promo_name 
, promo_start_date 
, promo_last_date )
;

UPDATE 
  date_dim a
, promo_schedule_stg b
SET a.promo_ind = 'Y'
WHERE 
    a.date >= b.promo_start_date
AND a.date <= b.promo_last_date
;

/* end of script                                                     */
