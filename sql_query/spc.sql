

with seller as (
select 
s.Seller_State
,avg(f.Sum_of_Review_Score/f.Nr_of_Review_Score ) as Nr_of_Review_Score_seller
, year(Delivery_Day_ID) as 'Delivery_year'
,sum(Product_Sales_Revenue) as Product_Sales_Revenue_seller
,sum(Shipping_Revenue) as  Shipping_Revenue_seller
from olist_dwh.dbo.DIM_SELLER s
inner join olist_dwh.dbo.FACT_DELIVERED_ORDERS f on f.Seller_ID=s.Seller_ID

group by s.Seller_State, year(Delivery_Day_ID)
)
, customer as (
select avg(f.Sum_of_Review_Score/f.Nr_of_Review_Score )as Nr_of_Review_Score_customer 
,c.Customer_State, year(Delivery_Day_ID) as Delivery_year
,sum(Product_Sales_Revenue) as Product_Sales_Revenue_customer
,sum(Shipping_Revenue) as  Shipping_Revenue_customer
from 
 olist_dwh.dbo.FACT_DELIVERED_ORDERS f 
inner join olist_dwh.dbo.DIM_CUSTOMER c on c.Customer_ID=f.Customer_ID

group by c.Customer_State,year(Delivery_Day_ID)

)
, all_years as (
select
s.Seller_State as STATE
,s.Delivery_year
,s.Nr_of_Review_Score_seller
,c.Nr_of_Review_Score_customer
,s.Product_Sales_Revenue_seller
,c.Product_Sales_Revenue_customer
,s.Shipping_Revenue_seller
,c.Shipping_Revenue_customer
from seller s inner  join customer c on s.Seller_State=c.Customer_State and s.Delivery_year=c.Delivery_year
--where s.Delivery_year in ('2017','2018')
)
select a.*,(a.Nr_of_Review_Score_seller - b.Nr_of_Review_Score_seller) as DIFF_of_Review_Score_seller
,(a.Nr_of_Review_Score_customer - b.Nr_of_Review_Score_customer) as DIFF_of_Review_Score_customer
,(a.Product_Sales_Revenue_seller - b.Product_Sales_Revenue_seller) as DIFF_Product_Sales_Revenue_seller
,(a.Shipping_Revenue_seller - b.Shipping_Revenue_seller) as DIFF_Shipping_Revenue_seller
,(a.Shipping_Revenue_customer - b.Shipping_Revenue_customer) as DIFF_Shipping_Revenue_customer
from all_years a
left join all_years b on b.Delivery_year=a.Delivery_year-1 and a.STATE=b.STATE

