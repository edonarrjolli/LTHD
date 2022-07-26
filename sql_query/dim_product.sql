
select product_id
,product_category_name as Product_Cat_Name_PT
,(select column2 from  Olist.dbo.product_category_name_translation where product_category_name=column1 ) as Product_Cat_Name_EN
, Product_Weight_g,Product_Length_cm,Product_Height_cm,Product_Width_cm
from Olist.dbo.olist_products_dataset 
