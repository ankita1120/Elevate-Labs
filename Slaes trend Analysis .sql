-- 1. Create the online_sales table
CREATE TABLE online_sales (
    order_id SERIAL PRIMARY KEY,
    order_date DATE NOT NULL,
    amount NUMERIC(10,2) NOT NULL,
    product_id INT
);
-- 2. Insert sample data (12 months of fake orders)
INSERT INTO online_sales (order_date, amount, product_id)
SELECT 
    date_trunc('day', (DATE '2023-01-01' + (random() * 364)::int)) AS order_date,
    round((random() * 100 + 10)::numeric, 2) AS amount,
    (random() * 10 + 1)::int AS product_id
FROM generate_series(1, 1000);

select * from online_sales;

-- 3. Run the trend analysis query
select Date_trunc('month',order_date) as month,
sum(amount) as total_revenue,
COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
where 
order_date between '2023-01-01' AND '2023-12-31'
GROUP By month ORDER BY  month;
Interview
--1. How do you group data by month and year?
-- Option 1: Preferred for grouping
select date_trunc('month', order_date) as month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM
    online_sales
GROUP BY
    DATE_TRUNC('month', order_date)
ORDER BY
    month;
--2. What's the difference between COUNT(*) and COUNT(DISTINCT col)?
select COUNT(*) counts from online_sales

select COUNT(DISTINCT col) counts only unique, non-null values of that column.
select COUNT(*)               -- Total number of rows
select COUNT(DISTINCT order_id) -- Unique order IDs (e.g., order volume)
--3. How do you calculate monthly revenue?

SELECT DATE_TRUNC('month', order_date) AS month,
       SUM(amount) AS monthly_revenue
FROM online_sales
GROUP BY month;

--4. What are aggregate functions in SQL?
Aggregate functions summarize multiple rows into a single value.

Examples:

SUM() – total

COUNT() – row count

AVG() – average

MIN() – minimum

MAX() – maximum

--5. How to handle NULLs in aggregates?
Most aggregates ignore NULLs by default:

SUM(NULL, 100) → 100

COUNT(col) excludes NULLs

Use COALESCE(col, 0) if you want to treat NULLs as 0:
select SUM(COALESCE(amount, 0))
--6What’s the role of ORDER BY and GROUP BY?
GROUP BY clusters rows by a column (for aggregates).

ORDER BY controls the output sort order.

   GROUP BY DATE_TRUNC('month', order_date)
ORDER BY month DESC;

--7. How do you get the top 3 months by sales?
Use ORDER BY + LIMIT:

SELECT DATE_TRUNC('month', order_date) AS month,
       SUM(amount) AS monthly_revenue
FROM online_sales
GROUP BY month
ORDER BY monthly_revenue DESC
LIMIT 3;


SELECT
    DATE_TRUNC('month', order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM
    online_sales
GROUP BY
    DATE_TRUNC('month', order_date)
ORDER BY
    month;

SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM
    online_sales
GROUP BY
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date)
ORDER BY
    year, month;


	