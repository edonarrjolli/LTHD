/*create database olist_dwh
*/
use olist_dwh
go

create table DIM_CUSTOMER 
(
Customer_ID nvarchar(50) PRIMARY KEY,
Customer_City nvarchar(50),
Customer_State nvarchar(50)
)


create table DIM_SELLER 
(
Seller_ID nvarchar(50) PRIMARY KEY,
Seller_City nvarchar(50),
Seller_State nvarchar(50)
)


create table DIM_PRODUCT 
(
Product_ID nvarchar(50) PRIMARY KEY,
Product_Cat_Name_PT nvarchar(50),
Product_Cat_Name_EN nvarchar(50),
Product_Weight_g int,
Product_Length_cm int,
Product_Height_cm int,
Product_Width_cm int
)




create table FACT_DELIVERED_ORDERS
(
Unique_ID int IDENTITY(1,1),
Customer_ID nvarchar(50),
Delivery_Day_ID nvarchar(50),
Product_ID nvarchar(50),
Seller_ID nvarchar(50),
Nr_of_Orders int,
Nr_of_Product int,
Product_Sales_Revenue float,
Shipping_Revenue float,
Nr_of_Review_Score int,
Sum_of_Review_Score int

PRIMARY KEY  (Unique_ID, Delivery_Day_ID)
Foreign Key (Customer_ID) references DIM_CUSTOMER (Customer_ID),
Foreign Key (Product_ID) references DIM_PRODUCT (Product_ID),
Foreign Key (Seller_ID) references DIM_SELLER (Seller_ID)
)

