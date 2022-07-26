USE [olist_dwh]
GO

UPDATE [olist_dwh].[dbo].[FACT_DELIVERED_ORDERS] 
set Nr_of_Orders=fact_stage.Nr_of_Orders
,Nr_of_Product=fact_stage.Nr_of_Product
,Product_Sales_Revenue=fact_stage.Product_Sales_Revenue
,Shipping_Revenue=fact_stage.Shipping_Revenue
,Nr_of_Review_Score=fact_stage.Nr_of_Review_Score
,Sum_of_Review_Score=fact_stage.Sum_of_Review_Score

from dbo.[FACT_DELIVERED_ORDERS] as fact
inner join olist_dwh_stage.dbo.FACT_DELIVERED_ORDERS_STAGE as fact_stage on fact.Customer_ID=fact_stage.Customer_ID
and fact.Delivery_Day_ID=fact_stage.Delivery_Day_ID and fact.Product_ID=fact_stage.Product_ID and fact.Seller_ID=fact_stage.Seller_ID



