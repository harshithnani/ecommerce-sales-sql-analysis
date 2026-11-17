# E-commerce Sales Analysis with MySQL

End-to-end SQL analysis of 5,000 e-commerce orders (Turkey, 2023 to 2024): data quality checks first, then revenue trends, customer segments and category concentration using CTEs, window functions and CASE logic.

## Why I built this

I have 2 years of experience as a QA tester, and I'm moving into data analysis. My QA habit is to check whether the thing under test can be trusted before reporting on it, so I approached this dataset the same way. I treated it as a system under test: I wrote validation checks first, logged what I found like a defect report, and only then started answering business questions.

## Dataset

- **Source:** [E-Commerce Customer Behavior & Sales Analysis - TR](https://www.kaggle.com/datasets/umuttuygurr/e-commerce-customer-behavior-and-sales-analysis-tr) by umuttuygurr on Kaggle
- **Licence:** CC0 (public domain)
- **Size:** 5,000 orders, 18 columns
- **Period:** 2023-01-01 to 2024-03-26
- **Currency:** Turkish Lira (TRY)
- **Coverage:** 8 product categories, 10 Turkish cities

| Column group | Columns |
|---|---|
| Order | Order_ID, Date, Product_Category, Unit_Price, Quantity, Discount_Amount, Total_Amount, Payment_Method, Delivery_Time_Days, Customer_Rating |
| Customer | Customer_ID, Age, Gender, City, Is_Returning_Customer |
| Session | Device_Type, Session_Duration_Minutes, Pages_Viewed |

## Tools and techniques

- **Tool:** MySQL 8.0
- **Techniques:** JOIN-free flat-table analysis, GROUP BY / HAVING, subqueries, CTEs, CASE segmentation, window functions (RANK, DENSE_RANK, LAG, running totals, percentage of total), date functions

## My approach: testing the data before trusting it

Before any analysis, I ran checks the way I would write test cases, and recorded what failed or surprised me.

| ID | What I checked | What I found | How I handled it |
|---|---|---|---|
| DQ-1 | Does any Customer_ID appear on more than one order? | No. All 5,000 orders belong to different customers, so the repeat-customer query returns 0. | Repeat purchase behaviour cannot be measured from this data. I reported it as a limitation instead of forcing a retention number. |
| DQ-2 | Does Is_Returning_Customer agree with the order history? | The flag is TRUE for many rows, yet no customer has a second order in the data. The data dictionary defines it as "has made previous purchases", so it can reflect history outside this table. | I used the flag as provided and labelled it unverified. |
| DQ-3 | Does Total_Amount match the pricing formula? | The author defines it as Unit_Price x Quantity - Discount_Amount. Summing Unit_Price x Quantity alone gives a larger number than summing Total_Amount, because the discount is subtracted. | I used Total_Amount (net revenue) for all revenue figures. |
| DQ-4 | Are all months complete? | No. The data ends on 2024-03-26, so March 2024 is a partial month. | I excluded it from "best and worst month" statements and compared January and February only for year-over-year growth. |
| DQ-5 | Do the age values fit my planned groups? | Ages run from 18 to 75, so there are no teenagers. | I used Young (18 to 25), Adult (26 to 35) and Senior (36+), and documented the cutoffs. |

**Reconciliation checks:** after each aggregate query I checked that the parts add up to the whole (category totals, gender totals and age-group totals all sum to the same 4,915,544.57 TRY, and order counts by category, payment method and city all sum to 5,000).

## Key findings

1. **Total revenue is 4,915,544.57 TRY** from 5,000 orders, about 983 TRY per order.
2. **Electronics brings in 47.4% of revenue** from only 12.5% of orders. Electronics, Home & Garden and Sports together make up 81.2%, so three of eight categories pass the 80% mark.
3. **Order volume is almost equal across categories** (610 to 667 orders). Revenue differs because of price: an average Electronics order is 3,732 TRY versus 118 TRY for Books.
4. **Istanbul has 25.7% of all orders**, and the top three cities make up 52.4%.
5. **Cards dominate payments:** credit card 40.2% and debit card 25.3% of orders. Cash on delivery is 5.0%.
6. **Monthly revenue is volatile** (about 257K to 397K TRY). Comparing like for like, January and February 2024 are 18.3% above January and February 2023.
7. **69.5% of customers never received a discount.**
8. **Female and male customers spend almost the same** (50.3% and 48.4% of revenue). Average order value across age groups is also close (within about 7%).

Full results with numbers for every question are in [insights.md](insights.md).

## Repository structure

```
ecommerce-sales-sql-analysis/
├── README.md
├── insights.md
├── data/
│   └── ecommerce.csv
├── sql/
│   ├── 01_data_quality_checks.sql
│   ├── 02_basic_analysis.sql
│   ├── 03_window_functions.sql
│   └── 04_customer_segments.sql
└── screenshots/
```

## What each SQL file covers

| File | Business questions | Main techniques |
|---|---|---|
| 01_data_quality_checks.sql | Repeat customers, formula checks, duplicates, nulls | COUNT DISTINCT, HAVING, subqueries |
| 02_basic_analysis.sql | Revenue by category, customers per category, payment methods, city orders, gender, age groups, average spend per category | GROUP BY, CASE, aggregates |
| 03_window_functions.sql | Top 5 customers per category, largest discounts per category, month-over-month growth, running total, categories making 80% of revenue | DENSE_RANK, LAG, SUM OVER, percentage of total |
| 04_customer_segments.sql | Customers who never used a discount, High / Medium / Low segments | HAVING, CASE, subqueries |

## How to reproduce

1. Install MySQL 8.0 or newer (CTEs and window functions need it).
2. Download the CSV from the Kaggle link above and place it in `data/`.
3. Create a table named `ecommerce` and import the CSV (for example with MySQL Workbench's Table Data Import Wizard). Make sure `Date` is a DATE column.
4. Run the SQL files in order, starting with `01_data_quality_checks.sql`.

## Limitations

- Each customer appears once, so retention and lifetime value cannot be analysed.
- Only 15 months of data, and the last month is partial, so seasonality cannot be established.
- The Is_Returning_Customer flag cannot be verified from this dataset.
- This is a single flat table, so this project does not show JOINs. My next project uses a multi-table dataset for that.

## Next steps

- Build a dashboard from the same data (revenue trend, category mix, city map, discount usage)
- Add delivery time versus customer rating, and device type versus spend
- Start a second SQL project on a multi-table dataset to practise JOINs

## About me

QA tester (2 years) moving into data analysis. I like finding out whether data can be trusted before I draw conclusions from it.

- Name: Harshith P
- Email: harshithnaani@gmail.com
