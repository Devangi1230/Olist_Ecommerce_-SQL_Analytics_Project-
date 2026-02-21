use ecommerce_project 

--- DATA ANALYSIS----
--percentage contribution of top categories  ---- 
with cateogry_revenue as (select p.product_category_name, sum (oi.price+ oi.freight_value)
As revenue from olist_order_items_dataset oi 
join olist_products_dataset p
on oi.product_id = p.product_id
group by p.product_category_name),
total_revenue As( select Sum(revenue)as t_revenue from cateogry_revenue )
select c.product_category_name, c.revenue, (c.revenue*100.0/t.t_revenue) as 
revenue_percentage from cateogry_revenue c, total_revenue t 
order by revenue_percentage DESC;

--- Top 10 Customer spending ---
select top 10 o.customer_id, sum (oi.price+ oi.freight_value)
As Total_spent from olist_orders_dataset o
join olist_order_items_dataset oi 
on o.order_id = oi.order_id 
group by o.customer_id
order by Total_spent desc;

--- Price Range contribution----
select case when price<50 then 'Low price'
when price between 50 and 150 then 'Medium price'
else 'High price' end as price_range, Sum(price+freight_value) As total_revenue
from olist_order_items_dataset group by case when price<50 then 'Low price'
when price between 50 and 150 then 'Medium price'
else 'High price'end order by total_revenue DESC;

--- Seller with many product but low revenue ----
select seller_id, count(distinct product_id) As total_products, sum(price+freight_value) 
as total_revenue from olist_order_items_dataset group by seller_id 
order by total_products DESC, total_revenue ASC;

---Revenue Across seller ---- 
with seller_revenue As(select seller_id, sum(price+freight_value) As revenue 
from olist_order_items_dataset group by seller_id )
select Count(*)As total_sellers, Sum(revenue) As total_revenue, 
Max(revenue)as highest_seller_revenue from seller_revenue;