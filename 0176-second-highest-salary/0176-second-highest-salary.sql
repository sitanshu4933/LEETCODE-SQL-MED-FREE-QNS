/* Write your T-SQL query statement below */
-- Solution - 1
-----------------------------
SELECT ( 
SELECT DISTINCT salary FROM
(SELECT salary,
DENSE_RANK() over (order by salary desc) r
FROM employee) s
WHERE r=2) AS SecondHighestSalary ;

--Solution - 2 
----------------------------------
-- SELECT (
-- SELECT salary 
-- FROM employee o
-- WHERE 1 = (SELECT COUNT(DISTINCT SALARY)
--             FROM employee i
--             WHERE o.salary > i.salary))  AS SecondHighestSalary;

-- Solution - 3
-----------------------------------
-- SELECT 
-- (SELECT salary
-- FROM employee
-- ORDER BY salary DESC
-- OFFSET 1 ROW
-- FETCH NEXT 1 ROWS ONLY) AS SecondHighestSalary;

