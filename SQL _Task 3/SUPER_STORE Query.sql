select * from superstore_sales;

--1. Show all orders where region is missing
select order_date , Category from superstore_sales 
where region  is null
order by order_date;
--Total profit by category (sorted)

select  category, SUM(profit) AS total_profit
from superstore_sales
GROUP BY category
ORDER BY total_profit DESC;

--2. Total sales per region

select region ,sum(sales ) as total_sales
from superstore_sales
GROUP BY region
ORDER BY total_sales DESC;

--Orders shipped after 2023-01-01

select order_id ,ship_date ,customer_name
from superstore_sales
where  ship_date > '2023-01-01'
order by  ship_date

--3. Top 5 selling products
SELECT product_name, SUM(sales) AS total_sales
FROM superstore_sales
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 5;

--4. Join customers with their segment (simplified with GROUP BY)
SELECT customer_name, segment, SUM(sales) AS total_spent
FROM superstore_sales
GROUP BY customer_name, segment
ORDER BY total_spent DESC
LIMIT 10;

--5. Subquery: Orders with above-average sales
SELECT *
FROM superstore_sales
WHERE sales > (
    SELECT AVG(sales) FROM superstore_sales
)
ORDER BY sales DESC;
--6. Average discount by category
SELECT category, AVG(discount) AS avg_discount
FROM  superstore_sales
GROUP BY category
ORDER BY avg_discount DESC;

-- 7. Create a view for all "Technology" category orders
CREATE VIEW tech_orders AS
SELECT * FROM superstore_sales
WHERE category = 'Technology';

--✅ Use JOINS (INNER, LEFT, RIGHT)

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    region VARCHAR(50)
);
--INNER JOIN: Combine orders and customers
SELECT s.order_id, c.customer_name, s.sales
FROM superstore_sales
INNER JOIN customers c ON s.customer_id = c.customer_id;

-- where clause using logical operator
   
   /*1.	Write a query to retrieve all orders from the Orders table where the Category is “Technology” and the Sales amount is greater than 500.*/

   Select * from superstore_sales where category = 'Technology' and sales > 500;

	/*2.Write a query to find all orders from the Orders table where the Sub_Category is “Phones” and the Profit is less than 0.*/
	select * from  superstore_sales where Sub_Category ='Phones' and profit < 0;
	
	/*3.	Write a query to retrieve all orders from the Orders table where the Region is “West”, the Category is “Furniture” and the Quantity is less than 10.*/
	SELECT *FROM superstore_salesWHERE Region = 'West'AND Category = 'Furniture'AND Quantity < 10;

	/*--4.	Write a query to retrieve all orders from the Orders table where the Region is either “East” or “West”.*/
	   SELECT * FROM superstore_sales WHERE Region In ('East' , 'West');
	/*--5.	Write a query to retrieve all orders from the Orders table where the Sub_Category is either “Chairs” or “Tables”.*/
	  SELECT * FROM superstore_sales WHERE Sub_Category = 'Chairs' OR Sub_Category= 'Tables';
	/*--6.	Write a query to retrieve all orders from the Orders table where the State is either “Chicago”, “California”, or “New York”.*/
	SELECT * FROM superstore_sales WHERE city = 'Chicago' or city ='New York' or city ='California';
	/*--7.	Write a query to retrive all orders from the Orders table where the State is not “California”.*/
	
	SELECT * FROM superstore_sales WHERE  NOT State = 'CA';
	/*--8.	Write a query to retrieve all orders from the Orders table where the Category is not “Furniture”.*/
	SELECT * FROM superstore_sales WHERE not Category = 'Furniture';
	/*--9.	Write a query to find all orders from the Orders table where the Region is “East” and the Category is either “Office Supplies” or “Furniture”.*/
	SELECT * FROM superstore_sales WHERE Region = 'East' AND Category IN ('Office Supplies', 'Furniture');

	/*--10.	Write a query to find all orders from the Orders table where the Ship Mode is “Same Day” or the Discount is greater than 0.2 or the Sales is greater than 500.*/
	SELECT * FROM superstore_sales 
WHERE Region = 'West' 
AND Category IN ('Office Supplies', 'Furniture');

	/*--11.	Write a query to retrieve all orders from the Orders table where the Category is not “Technology” and either the Sales is greater than 1000 or the Ship Mode is “Standard Class”.*/
SELECT * FROM superstore_sales
WHERE Category <> 'Technology' 
AND (Sales > 1000 OR Ship_Mode = 'Standard Class');

In
--/*Write a query to retrieve all orders from the Orders table where the Region is in “East”, “West”, or “Central”.
select * from superstore_sales where region in ('East','West','Central');
--/*Write a query to retrieve all orders from the Orders table where the Sub-Category is in “Chairs”, “Phones”, “Tables”, or “Art”.
select * from superstore_sales where  Sub_Category in ( 'Chairs', 'Phones', 'Tables',  'Art');
--/*Write a query to retrieve all orders from the Orders table where the State is in “California”, “Florida”, or “New York”.

select * from superstore_sales where state in ('CA','FL','NY')



Between

--/*Write a query to retrieve all orders from the Orders table where the Sales amount is between 500 and 1000.
Select * from superstore_sales where sales between 500 and 1000;
--/*Write a query to retrieve all orders from the Orders table where the Order Date is between ‘2024-01-01’ and ‘2024-12-31’.

SELECT *
FROM superstore_sales
WHERE Order_Date BETWEEN '2024-01-01' AND '2024-06-30';

--/*Write a query to retrieve all orders from the Orders table where the Quantity is between 5 and 20.
SELECT *
FROM supersales_sales
WHERE Quantity BETWEEN 5 AND 20;




Orderby
--/*Write a query to retrieve all orders from the Orders table, sorted by Sales in descending order.
select * from superstore_sales order by sales desc;
--/*Write a query to retrieve all orders from the Orders table, first sorted by Region in ascending order and then by Profit in descending order.
select * from superstore_sales order by region asc, profit desc;
--/*Write a query to retrieve all orders from the Orders table where the Region is “East”, and sort the results by Sales in descending order.
SELECT *FROM superstore_salesWHERE Region = 'East' ORDER BY Sales DESC;



Limit
--Write a query to retrieve the first 10 orders from the Orders table.
select * from superstore_sales  Limit 10;
--Write a query to retrieve the next 10 orders from the Orders table, skipping the first 10.
select * from superstore_sales order by Order_date OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY;
--Write a query to retrieve orders 21 to 30 from the Orders table, sorted by Order Date in ascending order.

select * from superstore_sales order by Order_date  ASC offset 20 rows fetch next 10 rows only; 

-- find which customer is giving  highest  sales
-- customer sales = maximum(sales)
select *  from superstore_sales where sales = (select max(sales) from superstore_sales);

--Find  which customer  is giving  maximum sales in west region 

select * from  superstore_sales  where region ='West' and sales = (select max(sales) from superstore_sales where region ='West');

--customer_details in west region  +sales = max(Sales) in west region
select * from  superstore_sales where region ='West' and sales =(select max(sales) from superstore_sales where region = 'West');

select max(sales) from superstore_sales where region ='West';

select * from  superstore_sales where region ='West' and sales= (select max(sales)
from superstore_sales where region ='West');

-- customer details from west region  whose  sales in maximum in west

--  find which customer  has  given highest sales w.r.t  phones
select * from superstore_sales where sub_category  = 'Phones' 
and sales =(select max(sales) from superstore_sales where sub_category = 'Phones');

-- find  which customer has  given  less profit  in technology  related product 
select * from superstore_sales where category = 'Technology' and  profit = (select min(profit)  from superstore_sales where category = 'Technology');

-- Find  which customer  has given maximum sales  in each region
Select * from  superstore_sales where sales in (select  max(Sales) from superstore_sales  group by region );

--find  which customer  has  given maximum profit in each category

select * from superstore_sales where profit in (select max(profit)  from  superstore_sales
 group by category );

 -- total sales;
select sum(sales) as total_sales from superstore_sales;
-- Total profit
select sum(profit) as total_profit from superstore_sales;
--sales of category
select category , sum(sales) as total_sales from superstore_sales
group by category 
order by total_sales desc;

--Top 5 Products by Sales
select product_name , sum(sales) as total_sales 
from superstore_sales
group by product_name
order by total_sales desc 
limit 5;

--Monthly Sales Trend
SELECT TO_CHAR(Order_Date, 'YYYY-MM') AS month,
       SUM(Sales) AS monthly_sales
FROM superstore_sales
GROUP BY month
ORDER BY month;

-- sales by region 
select sub_category , avg(discount) as avg_discount 
from superstore_sales
group by sub_category
order by avg_discount desc;

--Most Profitable Customers--
select customer_name ,sum(sales) as total_profit 
from superstore_sales 
group by customer_name order by total_profit desc limit 10;

--High Discount but Low Profit Products--
select product_name ,avg(discount) as Avg_Discount , sum(profit) 
as total_profit from superstore_sales
group by product_name having avg(discount) > 0.2 and sum(profit) < 0
order by avg_discount desc;

--Orders with Late Shipping (if date comparison is needed)
SELECT Order_ID, Order_Date, Ship_Date, Customer_Name, Region
FROM superstore_sales
WHERE Ship_Date ::date > Order_Date::date
ORDER BY Order_Date

