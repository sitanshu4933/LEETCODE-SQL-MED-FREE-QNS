/* Write your T-SQL query statement below */
SELECT 
product_id,
year first_year,
quantity,
price FROM (
SELECT
*,
MIN(year) OVER (PARTITION BY PRODUCT_ID) min_yr
FROM sales) sub WHERE year=min_yr ORDER BY 1