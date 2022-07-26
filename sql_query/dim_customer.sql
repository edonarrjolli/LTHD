USE [olist_dwh]
GO


select * from olist_dwh.dbo.DIM_CUSTOMER



MERGE [dbo].[DIM_CUSTOMER] AS TARGET
USING ( select customer_id,customer_city,customer_state from Olist.dbo.olist_customers_dataset) AS SOURCE (customer_id,customer_city,customer_state)
ON  (TARGET.customer_id=source.customer_id)
WHEN MATCHED 
   THEN update set customer_id=source.customer_id,customer_city=source.customer_city,customer_state=source.customer_state
WHEN NOT MATCHED 
   THEN insert (customer_id,customer_city,customer_state)
   values (source.customer_id,source.customer_city,source.customer_state)
;