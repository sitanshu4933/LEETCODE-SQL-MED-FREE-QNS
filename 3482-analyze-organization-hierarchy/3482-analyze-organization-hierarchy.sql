WITH H AS (
    SELECT employee_id,employee_name, 1 as level,salary
    FROM employees
    WHERE manager_id IS NULL

    UNION ALL

    SELECT e.employee_id,e.employee_name, level+1,e.salary
    FROM H
    JOIN employees e ON h.employee_id=e.manager_id
)
,TEAM AS (
    SELECT employee_id as manager_id,
    employee_id as sub_id,
    salary
    FROM employees

    UNION ALL

    SELECT t.manager_id,e.employee_id,e.salary
    FROM TEAM t
    JOIN employees e on t.sub_id=e.manager_id
)
,team_size_budget AS (
    SELECT manager_id AS employee_id, 
    COUNT(sub_id)-1 AS team_size,
    SUM(salary) AS budget
    FROM team
    GROUP BY manager_id
)
SELECT H.employee_id,H.employee_name,H.level,tsb.team_size,COALESCE(tsb.budget,H.salary,0) budget
FROM team_size_budget tsb
RIGHT JOIN H ON H.employee_id=tsb.employee_id
ORDER BY 3,5 DESC,2;
