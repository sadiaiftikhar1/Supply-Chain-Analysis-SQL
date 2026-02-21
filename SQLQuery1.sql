SELECT TOP (1000) [transactions_id]
      ,[sale_date]
      ,[sale_time]
      ,[customer_id]
      ,[gender]
      ,[age]
      ,[category]
      ,[quantiy]
      ,[price_per_unit]
      ,[cogs]
      ,[total_sale]
  FROM [SQL_Project1].[dbo].[Excel dataCSV]

  SELECT
  COUNT (*)
  FROM dbo.[Excel dataCSV]
  --Data Celaning
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

  --Data Exploration

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

-- Data Analysis 
--Q1. Write SQL query to retrieve all coulumns for sales made on 2022-11-08?
SELECT *
FROM dbo.[Excel dataCSV]
Where sale_date = '2022-11-08'

--Q2. Write SQL query to retrieve all transactions where the category is "clothing" and the quantity sold is more than 10 in the month of Nov 2022?

SELECT *
FROM dbo.[Excel dataCSV]
Where
category = 'clothing' 
AND 
sale_date = '2022-11-10'

--Q3. Write a SQL query to calculate total sales for each category.

SELECT 
    [Category],
    SUM([total_Sale]) AS net_sale,
    COUNT(*) AS total_orders
FROM dbo.[Excel dataCSV]
GROUP BY [Category]

--Q4: Find top 5 customers based on total spending.
SELECT TOP 5
    customer_id,
    SUM(total_sale) AS total_spent
FROM dbo.[Excel dataCSV]
GROUP BY customer_id
ORDER BY total_spent DESC;

--Q5: Calculate monthly revenue trend.
SELECT 
    YEAR(sale_date) AS sales_year,
    MONTH(sale_date) AS sales_month,
    SUM(total_sale) AS monthly_revenue
FROM dbo.[Excel dataCSV]
GROUP BY YEAR(sale_date), MONTH(sale_date)
ORDER BY sales_year, sales_month;

--Q6: Calculate average order value.
SELECT 
    AVG(total_sale) AS avg_order_value
FROM dbo.[Excel dataCSV];

--Q7: Find revenue by gender.
SELECT 
    gender,
    SUM(total_sale) AS total_revenue,
    COUNT(transactions_id) AS total_orders
FROM dbo.[Excel dataCSV]
GROUP BY gender
ORDER BY total_revenue DESC;

--Q8: Find age group generating highest revenue.
SELECT 
    age,
    SUM(total_sale) AS total_revenue
FROM dbo.[Excel dataCSV]
GROUP BY age
ORDER BY total_revenue DESC;

--Q9: Find transactions where profit is negative.
SELECT 
    transactions_id,
    total_sale,
    cogs,
    (total_sale - cogs) AS profit
FROM dbo.[Excel dataCSV]
WHERE (total_sale - cogs) < 0;

--Q10: Find peak sales hour.
SELECT 
    DATEPART(HOUR, sale_time) AS sale_hour,
    COUNT(*) AS total_transactions
FROM dbo.[Excel dataCSV]
GROUP BY DATEPART(HOUR, sale_time)
ORDER BY total_transactions DESC;