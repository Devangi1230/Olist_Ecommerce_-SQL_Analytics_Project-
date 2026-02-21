use ecommerce_project
---- JOINS (to understand tables)
--1. Customers with order
select c.customer_id, o.order_id 
from olist_customers_dataset c
join olist_orders_dataset o
on c.customer_id = o.customer_id

--- Number of orders per customer---
Select c.customer_unique_id,Count(Distinct o.order_id)As Total_Orders
from olist_orders_dataset o
Join olist_customers_dataset c
on o.customer_id=c.customer_id
group by c.customer_unique_id order by Total_Orders desc;

--- Total order item sold ---
Select count(*)As Total_item_sold
from olist_order_items_dataset;

---Total Revenue Generated ----
Select Sum(price + freight_value)as Total_Revenue 
from olist_order_items_dataset

---Average order value per order ---
select order_id,sum(price+freight_value) As order_value 
from olist_order_items_dataset
group by order_id;

---Average order as total ---
select Avg(order_value) As avg_order_value 
from(select order_id,
Sum (price+freight_value)As order_value from olist_order_items_dataset
group by order_id)t; 

--- Total Revenue per seller 
select seller_id, sum(price+freight_value) As seller_revenue
from olist_order_items_dataset
group by seller_id
order by seller_revenue DESC;

--- Top 10 Seller by sales 
select Top 10 seller_id, sum(price+freight_value) As seller_revenue
from olist_order_items_dataset
group by seller_id
order by seller_revenue DESC;