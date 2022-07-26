USE [olist_dwh_stage]
GO

/****** Object:  Table [dbo].[FACT_DELIVERED_ORDERS_STAGE]    Script Date: 7/26/2022 9:08:35 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FACT_DELIVERED_ORDERS_STAGE](
	[Unique_ID] [int] IDENTITY(1,1) NOT NULL,
	[Customer_ID] [nvarchar](50) NULL,
	[Delivery_Day_ID] [nvarchar](50) NOT NULL,
	[Product_ID] [nvarchar](50) NULL,
	[Seller_ID] [nvarchar](50) NULL,
	[Nr_of_Orders] [int] NULL,
	[Nr_of_Product] [int] NULL,
	[Product_Sales_Revenue] [float] NULL,
	[Shipping_Revenue] [float] NULL,
	[Nr_of_Review_Score] [int] NULL,
	[Sum_of_Review_Score] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Unique_ID] ASC,
	[Delivery_Day_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


