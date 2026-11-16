-----------------------------------------------------
-- Windows_functions
-----------------------------------------------------

-- 1. Top 5 customers from each product category
WITH ranked AS (
  SELECT Product_Category, Customer_ID,
         SUM(Total_Amount) AS total_spent,
         DENSE_RANK() OVER (PARTITION BY Product_Category
                            ORDER BY SUM(Total_Amount) DESC) AS spend_rank
  FROM ecommerce
  GROUP BY Product_Category, Customer_ID
)
SELECT *
FROM ranked
WHERE spend_rank <= 5
ORDER BY Product_Category, spend_rank;

-- 2. Which category and customer have got more discounted price?
select * from(
select Customer_ID, Product_Category, sum(Discount_Amount) as total_discount,
	DENSE_RANK() over(Partition by Product_Category order by sum(Discount_Amount) desc) as discount_rank
from ecommerce
group by Customer_ID, Product_Category
)as Table_1
where discount_rank <=5
order by Product_Category, discount_rank;

-- 3. MOM revenue growth 
select month,
	Monthly_sales,
    LAG(Round(Monthly_sales),2) OVER(order by month) AS Previous_month,
    Round(Monthly_sales - LAG(Monthly_sales) OVER(order by month),2) AS MOM_change,
    round(Monthly_sales - LAG(Monthly_sales) over(order by month)/ 
		LAG(Monthly_sales) over(order by month) *100, 2) AS MOM_growth_pct
From(
	select DATE_FORMAT(Date, '%y-%m') AS month,
		Round(sum(Total_amount),2) as Monthly_sales
	from ecommerce
	group by Date_format(Date, '%y-%m')
) as Monthly
order by month;

-- 4. Running cumulative per month?
select month,Monthly_sales,
	round(sum(Monthly_sales) over(order by month),2) as cumulative_sales
from(
	select date_format(date, '%y-%m') AS month,
		Round(sum(Total_Amount),2) as Monthly_sales
	from ecommerce
	group by date_format(date,'%y-%m')
) as Monthly
order by month;

