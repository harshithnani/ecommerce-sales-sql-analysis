-------------------------------------------------
-- Basic_sales_analysis
-------------------------------------------------

-- Q1. Total amount from each category
select distinct Product_Category, round(sum(Total_Amount),2) as total_amount
from ecommerce
group by Product_Category
order by total_amount desc;

-- Q2. No of customer purchased from each category
select count(Customer_ID), Product_Category
from ecommerce
group by Product_Category
order by count(Customer_ID) desc;

-- Q3.which payment method customer used frequently
select Payment_Method, count(Customer_ID) as no_of_customers
from ecommerce
group by Payment_Method
order by no_of_customers desc;

-- Q4. Which city has more number of purchases.
select City, count(distinct Order_ID) as no_of_customers
from ecommerce
group by City
order by no_of_customers desc;

-- Q5. Which gender have purchased more in price as well in quantity
select Gender, Round(sum(Total_Amount),2) As total_purchase, sum(Quantity) as total_quantity
from ecommerce
group by Gender
order by total_purchase desc;

-- Q6. Segregate which age customers are buying more and take the percentage average of each group (TEEN, ADULT, SENIOR)
select Age_groups, 
Round(AVG(Total_Amount),2) as Average_spend,
round(sum(Total_Amount),2) As Total_spend
from(
select Total_Amount,
	CASE 
		WHEN Age <= '25' THEN 'TEEN'
		When Age <= '35'  THEN 'ADULT'
		WHEN Age > '35' THEN 'SENIOR'
		else 'NOT APPLICABLE'
	END Age_groups
from ecommerce
) as t1
group by Age_groups
order by Total_spend desc;

-- Q7. Average spend per customer in each category
SELECT Product_Category,
       COUNT(*) AS customers,
       ROUND(AVG(customer_total), 2) AS avg_spend_per_customer
FROM (
  SELECT Customer_ID, Product_Category,
         SUM(Total_Amount) AS customer_total
  FROM ecommerce
  GROUP BY Customer_ID, Product_Category
) AS t
GROUP BY Product_Category
ORDER BY avg_spend_per_customer DESC;
