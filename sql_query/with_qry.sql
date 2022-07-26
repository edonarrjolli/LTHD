
with nr_orders
as
(
 SELECT     customer_id,FORMAT(order_delivered_customer_date,'yyyyMMdd') as order_delivered_customer_date
, COUNT(customer_id) AS Number_of_orders
FROM       Olist.dbo.olist_orders_dataset
where order_status='delivered' and  order_delivered_customer_date is not null
GROUP BY     customer_id, order_delivered_customer_date
--order by Number_of_orders desc
)
, product_sales as (
select distinct o.customer_id,i.product_id
,FORMAT(order_delivered_customer_date,'yyyyMMdd') as order_delivered_customer_date
,count(product_id) as Number_of_products 
,sum(price) as Product_Sales_Revenue
,sum(freight_value) as Shipping_Revenue
from 
 Olist.dbo.olist_orders_dataset o
inner  join Olist.dbo.olist_order_items_dataset i on o.order_id=i.order_id
where o.order_status='delivered' and  o.order_delivered_customer_date is not null
GROUP BY  o.customer_id, order_delivered_customer_date,i.product_id
--order by Number_of_products desc
)

,score as (
select COUNT(review_score) as Nr_of_Review_Score,
sum(review_score) as Sum_Review_Score,
order_id from Olist.dbo.olist_order_reviews_dataset
--where order_id='fc046d7776171871436844218f817d7d'
group by order_id
)

select distinct o.customer_id
,convert(nvarchar, o.order_delivered_customer_date, 112)as Delivery_Day_ID
,i.product_id
,i.seller_id
,o.order_id
,Number_of_orders
,Number_of_products
,Product_Sales_Revenue
,Shipping_Revenue
,Nr_of_Review_Score
,Sum_Review_Score
from  Olist.dbo.olist_orders_dataset o
inner join Olist.dbo.olist_order_items_dataset i on o.order_id=i.order_id
inner join nr_orders on nr_orders.customer_id=o.customer_id
inner join product_sales on product_sales.customer_id=o.customer_id and product_sales.product_id=i.product_id
inner join score on score.order_id=o.order_id


