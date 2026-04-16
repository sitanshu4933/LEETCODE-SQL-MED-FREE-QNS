/* Write your T-SQL query statement below */
SELECT sub.customer_id FROM (
    SELECT customer_id,COUNT(DISTINCT product_key ) dist_prdcts
    FROM customer
    GROUP BY customer_id ) sub
WHERE dist_prdcts=(SELECT COUNT(*) FROM product)