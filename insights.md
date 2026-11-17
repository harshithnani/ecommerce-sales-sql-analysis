**Insights: E-commerce Sales Analysis (MySQL)
**
Dataset: E-Commerce Customer Behavior & Sales Analysis - TR (Kaggle, author: umuttuygurr, licence CC0). Scope: 5,000 orders, 8 product categories, 10 Turkish cities, 2023-01-01 to 2024-03-26. All amounts are in Turkish Lira (TRY).

Headline findings
Total revenue is 4,915,544.57 TRY from 5,000 orders, an average of about 983 TRY per order.
Electronics alone brings in 47.4% of revenue (2.33M TRY) from only 12.5% of orders. Electronics, Home & Garden and Sports together make up 81.2% of revenue, so three of eight categories pass the 80% mark.
Order volume is almost identical across categories (610 to 667 orders each). The revenue gap is driven by price, not demand: an average Electronics order is 3,732 TRY versus 118 TRY for Books.
Istanbul accounts for 25.7% of orders, and the top three cities (Istanbul, Ankara, Izmir) account for 52.4%.
Cards dominate payments: credit card 40.2% and debit card 25.3% of orders. Cash on delivery is only 5.0%.
Monthly revenue is volatile (about 257K to 397K TRY, with swings of up to 37% month to month). Comparing like for like, January to February 2024 revenue is 18.3% higher than January to February 2023.
69.5% of customers (3,474) never received a discount.
Revenue is split almost evenly between female and male customers (50.3% vs 48.4%), with "Other" at 1.2%.
Question by question
Q1. Total revenue by category

Finding: Electronics 2,328,806.81; Home & Garden 908,348.86; Sports 754,563.56; Fashion 375,214.93; Toys 223,142.48; Beauty 156,584.74; Food 96,138.67; Books 72,744.52. Shares of total: 47.4%, 18.5%, 15.4%, 7.6%, 4.5%, 3.2%, 2.0%, 1.5%. The categories add up to 4,915,544.57, matching the overall total.
So what: Revenue is heavily concentrated, so stock, pricing and marketing decisions for Electronics matter far more than for any other category.

Q2. Customers per category

Finding: Sports has the most customers (667), followed by Electronics (624), Fashion (622), Beauty and Home & Garden (621 each), Food (619), Books (616) and Toys (610). The spread between highest and lowest is only 57 customers.
So what: Customer count does not explain revenue. Sports leads on customers but ranks third on revenue.

Q3. Payment methods

Finding: Credit card 2,012 orders (40.2%); debit card 1,265 (25.3%); digital wallet 965 (19.3%); bank transfer 510 (10.2%); cash on delivery 248 (5.0%).
So what: Two thirds of orders are paid by card, so card checkout reliability and card offers deserve priority. The low cash-on-delivery share means little exposure to COD returns.

Q4. Orders by city

Finding: Istanbul 1,284; Ankara 735; Izmir 600; Bursa 496; Adana 378; Antalya 374; Gaziantep 349; Konya 317; Kayseri 257; Eskisehir 210.
So what: Istanbul has about 1.7 times the orders of the next city. Delivery capacity and regional campaigns should start there.

Q5. Top 5 customers in each category

Finding: The largest customer spends vary hugely by category. The top Electronics customer spent 22,023.90 TRY (CUST_04705), the top Home & Garden customer 11,469.40 (CUST_03859) and the top Sports customer 6,777.93 (CUST_00544). The top Books customer spent 1,000.09 (CUST_00791).
So what: Because each Customer_ID appears on only one order, these rankings are really the largest single orders. They show where big-ticket purchases happen, not customer loyalty.

Q6. Customers with the largest discounts per category

Finding: The largest discount in each category ranges from 38.28 TRY (Books) to 1,525.55 TRY (Electronics, CUST_02839). Several of the biggest discounts went to top spenders, for example CUST_02077 (Beauty), CUST_03413 (Sports) and CUST_03721 (Electronics).
So what: Large discounts appear to go with large orders. Discount percentage has not been calculated yet, so this does not show whether big spenders get a better rate.

Q7. Gender by revenue and quantity

Finding: Female customers 2,474,009.26 TRY and 5,535 units; male 2,381,028.70 TRY and 5,387 units; other 60,506.61 TRY and 178 units. Female customers lead on both measures, by about 3.9% on revenue.
So what: The difference between female and male customers is small, so gender alone is a weak basis for targeting.

Q8. Repeat customers

Finding: No Customer_ID appears on more than one order (the repeat-customer query returned 0), so repeat buying cannot be measured from order history in this dataset. The Is_Returning_Customer flag exists, but it describes purchases that may sit outside this data and cannot be verified here.
So what: The business cannot currently measure retention from this table. Tracking one persistent customer ID across orders would make that possible.

Q9. Age groups

Finding: Senior group (36+): 2,334,470.61 TRY total, 988.76 TRY average per order. Adult (26 to 35): 1,436,643.56 total, 948.91 average. Young (18 to 25): 1,144,430.40 total, 1,017.27 average.
So what: The oldest group has the highest total because it is the largest group by number of orders. Average order values are close (within about 7%), so age has little effect on how much a customer spends per order.

Q10. Average spend per customer in each category

Finding: Electronics 3,732.06 TRY; Home & Garden 1,462.72; Sports 1,131.28; Fashion 603.24; Toys 365.81; Beauty 252.15; Food 155.31; Books 118.09.
So what: The gap in average spend is far larger than the gap in customer count, which confirms that price level drives category revenue.

Q11. Month-over-month revenue
Month	Revenue (TRY)	Change vs previous month
Jan 2023	286,694.32	n/a
Feb 2023	338,784.92	+18.17%
Mar 2023	321,716.01	-5.04%
Apr 2023	257,332.58	-20.01%
May 2023	351,902.03	+36.75%
Jun 2023	324,356.96	-7.83%
Jul 2023	346,618.03	+6.86%
Aug 2023	391,505.89	+12.95%
Sep 2023	262,602.86	-32.92%
Oct 2023	352,286.61	+34.15%
Nov 2023	282,606.10	-19.78%
Dec 2023	384,717.52	+36.13%
Jan 2024	396,874.92	+3.16%
Feb 2024	342,913.06	-13.60%
Mar 2024 (partial, data ends 26 March)	274,632.76	-19.91%

Finding: The best full month is January 2024 (396,874.92) and the weakest full month is April 2023 (257,332.58). Revenue swings up and down from month to month without a steady trend. Comparing January and February only, 2024 is 18.3% above 2023 (739,787.98 vs 625,479.24).
So what: March 2024 should not be read as a decline, because the month is incomplete. Month-to-month changes are large, so planning should use quarterly or yearly comparisons.

Q12. Cumulative revenue

Finding: Cumulative revenue reaches 4,915,544.57 TRY by 26 March 2024. It passes 1M TRY in March 2023, 2M in July 2023, 3M in October 2023 and 4M in January 2024. The 2023 total is 3,901,123.83.
So what: The business sells about 330K TRY per month on average, which gives a baseline for targets.

Q13. Customers who never used a discount

Finding: 3,474 of 5,000 customers (69.5%) never used a discount. The other 1,526 (30.5%) did.
So what: Most customers pay full price, so discounts are not needed to close most sales. Discount spend should be reviewed against the extra revenue it brings.

Q14. Customer segments (High, Medium, Low)

Finding: The ten highest-spending customers are all in the High segment, from 22,023.90 TRY (CUST_04705) down to 16,214.20 TRY (CUST_00642).
So what: [TODO: add the segment summary with customer count, total revenue and revenue share per segment, then write the finding.]

Q15. Categories that make up 80% of revenue

Finding: Electronics (47.4%), Home & Garden (18.5%) and Sports (15.4%) together reach 81.2% of revenue.
So what: Three categories carry the business. The other five contribute under 19% combined.

Data quality notes
One order per customer ID. All 5,000 orders belong to different Customer_IDs, so repeat purchase behaviour cannot be measured from order history.
Is_Returning_Customer flag. The data dictionary defines it as "has made previous purchases", so it can reflect history outside this dataset. It is used as provided and not verified.
Total_Amount. Defined by the author as Unit_Price x Quantity - Discount_Amount. The difference between the gross sum and the Total_Amount sum is explained by the discount.
Partial final month. The data ends on 2024-03-26, so March 2024 is incomplete.
Age groups. Ages run from 18 to 75, so there are no teenagers. Groups used: Young (18 to 25), Adult (26 to 35), Senior (36+).
Currency. All amounts are in Turkish Lira (TRY).
