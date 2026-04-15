/* Write your T-SQL query statement below */
WITH first_log AS (SELECT 
player_id,
event_date,
MIN(event_date) OVER (PARTITION BY player_id) first_log_dt
FROM activity)

SELECT ROUND(COUNT(DISTINCT player_id) *1.0
/ (SELECT COUNT(DISTINCT player_id) FROM activity)
,2) fraction
FROM first_log
WHERE DATEDIFF(d,first_log_dt,event_date) =1