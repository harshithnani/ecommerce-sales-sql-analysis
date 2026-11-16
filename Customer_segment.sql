--------------------------------------------------
-- Customer_segmentation_analysis
--------------------------------------------------

-- 1.Customers who purchased but never used discount
SELECT count(DISTINCT c.Customer_ID)
FROM ecommerce c
WHERE NOT EXISTS (
  SELECT 1 FROM ecommerce d
  WHERE d.Customer_ID = c.Customer_ID AND d.Discount_Amount > 0
);

-- 2. Customer segments (High, medium, low)
	select Customer_ID , Total_spent,
	Case 
		when Total_spent >= 5000 then 'High'
		when Total_spent >= 2000 then 'Medium'
		Else 'low'
	End AS segment
From (
	Select Customer_ID, round(sum(Total_Amount),2) as Total_spent
    from ecommerce
    group by Customer_ID
) as t
order by Total_spent desc;
