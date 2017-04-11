/*********************************************************************/
/*                                                                   */
/* ragged_campaign.sql                                               */                  
/*                                                                   */
/*********************************************************************/

USE dw;

TRUNCATE campaign_session_stg;

LOAD DATA INFILE 'ragged_campaign.csv'
INTO TABLE campaign_session_stg
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(
  campaign_session
, month 
, year 
)
;

UPDATE month_dim a, campaign_session_stg b 
SET a.campaign_session = b.campaign_session
WHERE
    a.month = b.month 
AND a.year = b.year 
AND b.campaign_session IS NOT NULL 
;

UPDATE month_dim a, campaign_session_stg b 
SET a.campaign_session = a.month_name
WHERE
    a.month = b.month 
AND a.year = b.year 
AND b.campaign_session IS NULL
;

/* end of script                                                     */
