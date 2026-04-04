with max_min as (
select store_id,
max(price) max_price,
min(price) min_price,
count(distinct product_name) distinct_product
from inventory
group by store_id)

select mm.store_id,s.store_name,s.location,
i1.product_name most_exp_product,
i2.product_name cheapest_product,
round(i2.quantity / i1.quantity, 2) imbalance_ratio 
from max_min mm
join inventory i1
on mm.store_id=i1.store_id
and mm.max_price=i1.price
join inventory i2
on mm.store_id=i2.store_id
and mm.min_price=i2.price
and i2.quantity > i1.quantity
join stores s
on s.store_id=mm.store_id
where distinct_product >= 3
order by 6 desc, 2