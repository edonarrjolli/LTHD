/*The FACT_DELIVERED_ORDERS table contains:
 Unique_ID - Auto-generated, Incremental ID - Primary Key
 Customer_ID – The unique identifier of the Customer – Foreign Key
 Delivery_Day_ID – The date of the delivery to the customer (the field
order_delivered_customer_date) in the format YYYYMMDD
 Product_ID – The ID of the product from the products table – Foreign Key
 Seller_ID – The ID of the seller from the sellers table – Foreign Key
 Nr_of_Orders – The number of orders placed by a customer per day
 Nr_of_Products – The number of products purchased by a customer per day
 Product_Sales_Revenue – The sum of the products price per day
 Shipping_Revenue – The sum of freight value per day
 Nr_of_Review_Score – The number of reviews per day
 Sum_Review_Score – The sum of review score per day*/

select c.customer_id
,FORMAT(order_delivered_customer_date,'yyyyMMdd') as 'Delivery_Day_ID'
,p.product_id
,s.seller_id
from Olist.dbo.olist_customers_dataset c
left join  Olist.dbo.olist_orders_dataset o on c.customer_id= o.customer_id
inner join Olist.dbo.olist_order_items_dataset i on o.order_id=i.order_id
left join Olist.dbo.olist_products_dataset p on p.product_id=i.product_id
inner join Olist.dbo.olist_sellers_dataset s on s.seller_id=i.seller_id


--Nr_of_Orders – The number of orders placed by a customer per day
 SELECT     customer_id,FORMAT(order_purchase_timestamp,'yyyyMMdd') as 'order_purchase_timestamp'
, COUNT(customer_id) AS Number_of_orders
FROM       Olist.dbo.olist_orders_dataset
--where customer_id='8ab97904e6daea8866dbdbc4fb7aad2c'
GROUP BY     customer_id, order_purchase_timestamp
ORDER BY   Number_of_orders desc

--where customer_id='9ef432eb6251297304e76186b10a928d' 41ce2a54c0b03bf3443c3d931a367089


select * from Olist.dbo.olist_orders_dataset
where customer_id='8ab97904e6daea8866dbdbc4fb7aad2c'

--Nr_of_Products – The number of products purchased by a customer per day


select distinct o.customer_id,o.order_id
,FORMAT(order_purchase_timestamp,'yyyyMMdd') as 'order_purchase_timestamp'
,count(*) as Number_of_products 
from 
 Olist.dbo.olist_orders_dataset o
inner  join Olist.dbo.olist_order_items_dataset i on o.order_id=i.order_id
--inner join Olist.dbo.olist_products_dataset p on p.product_id=i.product_id
--where o.customer_id='fc3d1daec319d62d49bfb5e1f83123e9'
GROUP BY     o.customer_id, order_purchase_timestamp,o.order_id
ORDER BY   Number_of_products desc



select * from Olist.dbo.olist_order_items_dataset where order_id
--Product_Sales_Revenue – The sum of the products price per day
select i.product_id,o.order_purchase_timestamp
,sum(price) as Product_Sales_Revenue
 from 
 Olist.dbo.olist_order_items_dataset i 
 inner join Olist.dbo.olist_orders_dataset o on i.order_id=o.order_id
 group by i.product_id,o.order_purchase_timestamp


 -- Nr_of_Review_Score – The number of reviews per day
select COUNT(review_id),review_creation_date from Olist.dbo.olist_order_reviews_dataset
group by review_creation_date




--Sum_Review_Score – The sum of review score per day*/
select COUNT(review_score),review_creation_date from Olist.dbo.olist_order_reviews_dataset
group by review_creation_date