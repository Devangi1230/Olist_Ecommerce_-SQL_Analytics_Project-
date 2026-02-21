create database ecommerce_project;

USE ecommerce_project
select*from dbo.olist_orders_dataset;
select*from dbo.olist_customers_dataset;
select*from dbo.olist_order_items_dataset;
select*from dbo.olist_order_payments_dataset;
select*from dbo.olist_products_dataset;
select*from dbo.olist_sellers_dataset;

---Basic Structure Understanding---

Select Count(*) From dbo.olist_orders_dataset;
Select Count(*) From dbo.olist_customers_dataset;
Select Count(*) From dbo.olist_order_items_dataset;
Select Count(*) From dbo.olist_order_payments_dataset;
Select Count(*) From dbo.olist_products_dataset;
Select Count(*) From dbo.olist_sellers_dataset;

--- Primary Keys of tables ----
EXEC sp_help 'dbo.olist_orders_dataset';
EXEC sp_help 'dbo.olist_customers_dataset';
EXEC sp_help 'dbo.olist_order_items_dataset';
EXEC sp_help 'dbo.olist_order_payments_dataset';
EXEC sp_help 'dbo.olist_products_dataset';
select*from dbo.olist_products_dataset;
EXEC sp_help 'dbo.olist_sellers_dataset';

alter table olist_products_dataset 
add constraint PK_products
primary key(product_id);
EXEC sp_help 'dbo.olist_products_dataset';

