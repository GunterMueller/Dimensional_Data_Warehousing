/*********************************************************************/
/*                                                                   */
/* campaign_session_20.sql                                           */               
/*                                                                   */
/*********************************************************************/

TRUNCATE non_straight_campaign_stg;

LOAD DATA INFILE 'non_straight_campaign.csv'
INTO TABLE non_straight_campaign_stg
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES
(
  campaign_session
, start_month 
, start_year 
, end_month 
, end_year 
)
;

/* for the start and end months */

UPDATE month_dim p, 
(
SELECT 
  a.month
, a.year
, b.campaign_session 
FROM
month_dim a LEFT OUTER JOIN 
( SELECT campaign_session, month, year
  FROM 
  (SELECT campaign_session, start_month month,start_year year
   FROM non_straight_campaign_stg

   UNION ALL

  SELECT campaign_session, end_month month,end_year year
  FROM non_straight_campaign_stg) x

  ORDER BY year, month) b 

ON a.year = b.year AND a.month = b.month ) q

SET p.campaign_session = q.campaign_session
WHERE 
    q.campaign_session IS NOT NULL
AND p.month = q.month 
AND p.year = q.year 
;

/* for the in-between months */

UPDATE month_dim p, month_dim q,

(SELECT MIN(a.month) minmo, MIN(a.year) minyear, a.campaign_session campaign_session, MAX(b.month) maxmo,MAX(b.year) maxyear 
FROM month_dim a, month_dim b
WHERE a.campaign_session IS NOT NULL
AND b.campaign_session IS NOT NULL
AND a.month = b.month and a.year = b.year 
GROUP BY a.campaign_session, b.campaign_session
) r

SET p.campaign_session = r.campaign_session

WHERE 
p.month > r.minmo AND p.year = r.minyear
AND q.month < r.maxmo AND q.year = r.maxyear
AND p.month = q.month AND p.year = q.year
;

/* end of script                                                     */
