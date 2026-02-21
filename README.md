# Supply-Chain-Analysis-SQL
Project Overview
This project demonstrates the application of T-SQL to clean, explore, and analyze a dataset (1,000+ records) containing over 1,000+ transactions. The goal was to transform raw warehouse data into actionable business insights, focusing on sales performance, customer demographics, and operational efficiency.

Technical Skills Applied
Data Cleaning: Handling NULL values to ensure data accuracy.

Exploratory Data Analysis (EDA): Understanding data distribution and unique identifiers.

Advanced Aggregations: Using SUM, AVG, COUNT, and GROUP BY.

Time-Series Analysis: Extracting trends using YEAR(), MONTH(), and DATEPART().

Financial Logic: Calculating profit margins and identifying financial leaks.

 Data Analysis: Solving 10 Key Business Problems
Below are the specific business questions addressed through SQL queries in this project:

1. Initial Data Retrieval
Goal: Retrieve all records for a specific date (2022-11-08) to audit daily transactions.

Key Insight: Ensures the ability to perform granular daily audits.

2. Targeted Inventory Filtering
Goal: Find "Clothing" transactions with a quantity greater than 10 in November 2022.

Key Insight: Identifies bulk orders in specific categories for inventory planning.

3. Category Performance
Goal: Calculate total sales and total orders for each product category.

Key Insight: Highlights which categories are driving the most revenue (e.g., Electronics vs. Clothing).

4. Customer Loyalty Tracking
Goal: Identify the Top 5 Customers based on total spending.

Key Insight: Essential for CRM and loyalty program targeting.

5. Revenue Trends
Goal: Analyze monthly revenue trends to identify seasonal growth or declines.

Key Insight: Helps in forecasting and budgeting for the next fiscal year.

6. Business Health Check (AOV)
Goal: Calculate the Average Order Value (AOV).

Key Insight: A fundamental retail metric to measure the effectiveness of upselling strategies.

7. Gender-Based Segmentation
Goal: Break down revenue and order count by gender.

Key Insight: Informs marketing departments on which demographic to target with ads.

8. Demographic Deep-Dive
Goal: Find the age group generating the highest revenue.

Key Insight: Assists in product development tailored to the most profitable age bracket.

9. Profitability & Leakage Detection
Goal: Identify transactions where Total Sale - COGS < 0.

Key Insight: This is a critical supply chain insight. It detects pricing errors or high procurement costs that result in losses.

10. Operational Peak Hours
Goal: Extract the hour of the day with the highest transaction volume.

Key Insight: Workforce Optimization. By identifying peak hours, warehouse managers can schedule more staff during busy times to improve efficiency.
