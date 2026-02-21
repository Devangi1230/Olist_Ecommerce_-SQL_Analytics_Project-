use ecommerce_project
--- Customer segmentation (low/high/medium) 
with customer_orders As(select c.customer_unique_id, 
count(o.order_id)As total_orders from olist_orders_dataset o
join olist_customers_dataset c
on o.customer_id = c.customer_id
group by customer_unique_id)
Select customer_unique_id , total_orders, case 
when total_orders = 1 then 'Low'
when total_orders between 2 and 4 then 'Medium'
else 'High' end as customer_segment from customer_orders 
order by total_orders DESC;

--- Repeat Vs one time customer---
with customer_orders As(select c.customer_unique_id, 
count(o.order_id)As total_orders from olist_orders_dataset o
join olist_customers_dataset c
on o.customer_id = c.customer_id
group by customer_unique_id)
select case when total_orders = 1 then 'one-time'
else 'Repeat'end as cutomer_type , 
count(*) as customer_count from customer_orders
group by case when total_orders = 1 then 'one-time'
else 'Repeat'end

--- revenue By product---
select p.product_category_name, sum (oi.price+ oi.freight_value)
As cateogry_revenue from olist_order_items_dataset oi 
join olist_products_dataset p
on oi.product_id = p.product_id
group by p.product_category_name
order by cateogry_revenue desc;

--- Top 5 cateogry by revenue ----
select top 5 p.product_category_name, sum (oi.price+ oi.freight_value)
As cateogry_revenue from olist_order_items_dataset oi 
join olist_products_dataset p
on oi.product_id = p.product_id
group by p.product_category_name
order by cateogry_revenue desc;

----Product with higher average --- 
select product_id, Avg(price) as Average_price 
from olist_order_items_dataset 
group by product_id 
order by Average_price DESC;

--- Rank seller By revenue --- 
select seller_id, sum(price+ freight_value) as Total_revenue, 
Rank()over (order by Sum (price + freight_value )DESC) as Revenue_rank 
from olist_order_items_dataset
group by seller_id;
