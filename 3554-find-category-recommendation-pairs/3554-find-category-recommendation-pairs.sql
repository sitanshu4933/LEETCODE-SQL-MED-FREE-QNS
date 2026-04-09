WITH enriched AS (SELECT 
pi.*,
pp.user_id,
pp.quantity
FROM productpurchases pp
JOIN productinfo pi 
ON pp.product_id = pi.product_id)

,matched_data AS (
SELECT 
CASE
    WHEN t1.category < t2.category THEN t1.category
    ELSE t2.category
    END category1,
CASE
    WHEN t1.category > t2.category THEN t1.category
    ELSE t2.category
    END category2,
t1.user_id
FROM enriched t1
JOIN enriched t2
ON t1.user_id=t2.user_id
AND t1.category <> t2.category )

SELECT 
category1,
category2,
COUNT(DISTINCT user_id) customer_count 
FROM matched_data
GROUP BY category1,category2
HAVING COUNT(DISTINCT user_id) >=3
ORDER BY 3 DESC, 1,2