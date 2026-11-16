----------------------------------------------
-- Data Quality check 
----------------------------------------------
Select count(*) AS repeat_customers
from(
select Customer_ID
from ecommerce
group by Customer_ID
having count(distinct Order_ID)>1
) as t;
