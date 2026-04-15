/* Write your T-SQL query statement below */
SELECT
t1.name
FROM employee t1
JOIN employee t2
ON t1.id=t2.managerid
GROUP bY t1.id,t1.name
HAVING COUNT(t1.id) >=5