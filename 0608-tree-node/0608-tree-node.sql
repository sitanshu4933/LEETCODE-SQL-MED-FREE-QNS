/* Write your T-SQL query statement below */
SELECT
id,
CASE WHEN p_id is NULL THEN 'Root'
    WHEN EXISTS (SELECT 1 FROM TREE t2
                    WHERE t1.id=t2.p_id) THEN 'Inner'
    ELSE 'Leaf' END AS type
FROM TREE t1