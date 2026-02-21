# Supply-Chain-Analysis-SQL
Project Overview
This project demonstrates the application of T-SQL to clean, explore, and analyze a dataset (1,000+ records) containing over 1,000+ transactions. The goal was to transform raw warehouse data into actionable business insights, focusing on sales performance, customer demographics, and operational efficiency.

Technical Skills Applied
Data Cleaning: Handling NULL values to ensure data accuracy.
Delete from dbo.[Excel dataCSV]
where
transactions_id is null
OR
sale_date is null
OR
sale_time is null
OR
customer_id is null
OR
gender is null
OR
age is null
OR
category is null
OR
quantiy is null
OR
price_per_unit is null
OR 
cogs is null
OR
total_sale is null;

Exploratory Data Analysis (EDA): Understanding data distribution and unique identifiers.

Advanced Aggregations: Using SUM, AVG, COUNT, and GROUP BY.

Time-Series Analysis: Extracting trends using YEAR(), MONTH(), and DATEPART().

Financial Logic: Calculating profit margins and identifying financial leaks.

--How many sales we have?
SELECT COUNT (*) as total_sale from dbo.[Excel dataCSV]

--How many customers we have?
SELECT COUNT (*) as customer_id from dbo.[Excel dataCSV]

  --How many unique customers we have?
SELECT COUNT (DISTINCT customer_id) as total_sale from dbo.[Excel dataCSV]

--How many unique category we have?
 SELECT COUNT (DISTINCT category) as total_sale from dbo.[Excel dataCSV]

 --Names of Distinct Category
    SELECT DISTINCT category from dbo.[Excel dataCSV] 

 Data Analysis: Solving 10 Key Business Problems
Below are the specific business questions addressed through SQL queries in this project:

1. Initial Data Retrieval
Goal: Retrieve all records for a specific date (2022-11-08) to audit daily transactions.
SELECT *
FROM dbo.[Excel dataCSV]
Where sale_date = '2022-11-08'
Key Insight: Ensures the ability to perform granular daily audits.

2. Targeted Inventory Filtering
Goal: Find "Clothing" transactions with a quantity greater than 10 in November 2022.
--Q2. Write SQL query to retrieve all transactions where the category is "clothing" and the quantity sold is more than 10 in the month of Nov 10, 2022?

SELECT *
FROM dbo.[Excel dataCSV]
Where
category = 'clothing' 
AND 
sale_date = '2022-11-10'
Key Insight: Identifies bulk orders in specific categories for inventory planning.

3. Category Performance
Goal: Calculate total sales and total orders for each product category.
SELECT 
    category,
    SUM(total_sale) AS total_revenue,
    COUNT(transactions_id) AS total_orders
FROM dbo.[Excel dataCSV]
GROUP BY category
ORDER BY total_revenue DESC;
Key Insight: Highlights which categories are driving the most revenue (e.g., Electronics vs. Clothing).

4. Customer Loyalty Tracking
Goal: Identify the Top 5 Customers based on total spending.
SELECT TOP 5
    customer_id,
    SUM(total_sale) AS total_spent
FROM dbo.[Excel dataCSV]
GROUP BY customer_id
ORDER BY total_spent DESC;
Key Insight: Essential for CRM and loyalty program targeting.

5. Revenue Trends
Goal: Analyze monthly revenue trends to identify seasonal growth or declines.
SELECT 
    YEAR(sale_date) AS sales_year,
    MONTH(sale_date) AS sales_month,
    SUM(total_sale) AS monthly_revenue
FROM dbo.[Excel dataCSV]
GROUP BY YEAR(sale_date), MONTH(sale_date)
ORDER BY sales_year, sales_month;
Key Insight: Helps in forecasting and budgeting for the next fiscal year.

6. Business Health Check (AOV)
Goal: Calculate the Average Order Value (AOV).
SELECT 
    AVG(total_sale) AS avg_order_value
FROM dbo.[Excel dataCSV];
Key Insight: A fundamental retail metric to measure the effectiveness of upselling strategies.

7. Gender-Based Segmentation
Goal: Break down revenue and order count by gender.
SELECT 
    gender,
    SUM(total_sale) AS total_revenue,
    COUNT(transactions_id) AS total_orders
FROM dbo.[Excel dataCSV]
GROUP BY gender
ORDER BY total_revenue DESC;
Key Insight: Informs marketing departments on which demographic to target with ads.

8. Demographic Deep-Dive
Goal: Find the age group generating the highest revenue.
SELECT 
    age,
    SUM(total_sale) AS total_revenue
FROM dbo.[Excel dataCSV]
GROUP BY age
ORDER BY total_revenue DESC;
Key Insight: Assists in product development tailored to the most profitable age bracket.

9. Profitability & Leakage Detection
Goal: Identify transactions where Total Sale - COGS < 0.
SELECT 
    transactions_id,
    total_sale,
    cogs,
    (total_sale - cogs) AS profit
FROM dbo.[Excel dataCSV]
WHERE (total_sale - cogs) < 0;
Key Insight: This is a critical supply chain insight. It detects pricing errors or high procurement costs that result in losses.

10. Operational Peak Hours
Goal: Extract the hour of the day with the highest transaction volume.
SELECT 
    DATEPART(HOUR, sale_time) AS sale_hour,
    COUNT(*) AS total_transactions
FROM dbo.[Excel dataCSV]
GROUP BY DATEPART(HOUR, sale_time)
ORDER BY total_transactions DESC;
Key Insight: Workforce Optimization. By identifying peak hours, warehouse managers can schedule more staff during busy times to improve efficiency.
