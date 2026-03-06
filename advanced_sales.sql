CREATE DATABASE asales;
USE asales;

SELECT * from sales;


-- 1 Show the first 10 rows from the dataset.
SELECT * FROM sales
LIMIT 10;

--  2 Display order_id, city, sales, and profit for all orders.
SELECT  order_id,city,sales,profit FROM sales;

-- 3 Show all orders where region = 'West'.
SELECT * FROM sales
WHERE region='West';

-- 4 Display orders where discount is greater than 0.20.
SELECT * FROM sales
where discount>0.20;

-- 5 Show all orders where category = 'Electronics'.
SELECT * FROM sales
WHERE category='Electronics';

-- 6 Find orders where sales > 50,000.
SELECT * FROM sales
where sales>50000;

-- 7 Display orders where profit > 10,000.
SELECT * FROM sales
WHERE profit>10000;

-- 8 Show orders placed in 2024.
SELECT *
FROM sales
WHERE YEAR(order_date) = 2024; 

-- 9 Find orders where quantity is greater than 3.
SELECT * FROM sales
WHERE quantity>3;


-- 10 Display orders where city = 'Mumbai' AND sales > 30,000.
SELECT * FROM sales
where city='Mumbai' AND sales>30000;

-- 11Show top 10 highest sales orders.
SELECT customer_id,order_id,sales FROM sales
ORDER BY sales desc limit 10;

-- 12Show 10 lowest profit orders.
SELECT customer_id,order_id,profit FROM sales
ORDER BY profit ASC LIMIT 10; 

-- 13 Display orders sorted by order_date (latest first).

SELECT MIN(order_date), MAX(order_date)
FROM sales;
-- 14Count the total number of orders
SELECT count(*) FROM sales;

-- 15 Count how many unique cities exist.
SELECT count(distinct(city))  from sales;

-- 16Count how many orders belong to each region.
SELECT region,count(*) as orders_each_region from sales
GROUP BY region;


-- 17 Find total sales of all orders.
select round(sum(sales)) as total_sales from sales;


-- 18 Find total profit of all orders.
select round(sum(profit)) as total_profit from sales;

-- 19Find average discount given.
SELECT avg(discount) from sales;


-- 20Find maximum sales value in the dataset.
select max(sales) from sales;


-----------------------------------------------------------
-- 1 Find total sales for each region.
SELECT region,sum(sales) FROM sales
GROUP BY region ;

-- 2 Find total profit for each category.
SELECT category,sum(profit) FROM sales
GROUP BY category;

-- 3 Show average discount given in each region.
SELECT region,AVG(discount) FROM sales
GROUP BY region;

-- 4 Find total quantity sold for each product.
SELECT product_name,SUM(quantity) as sold_per_quantity FROM sales
GROUP BY product_name;


-- 5 Find number of orders per city.
SELECT city,count(*) as number_of_orders FROM sales
GROUP BY city;

-- Find top 5 cities with highest total sales.
SELECT city,sum(sales) as total_sales FROM sales
GROUP BY city 
order by total_sales desc limit 5; 

-- 7 Find categories where total sales exceed 1,000,000.

SELECT category, SUM(sales) AS total_sales
FROM sales
GROUP BY category
HAVING SUM(sales) > 1000000;
-- 8Find regions where average profit is greater than 5,000.
SELECT region,avg(profit) as average_profit FROM sales
GROUP BY region 
HAVING average_profit>5000;


-- 9Find minimum and maximum sales for each category.
SELECT category,min(sales) as min_sales,max(sales) as max_sales   FROM sales
GROuP BY category; 
-- 10 Find average sales per order for each region.
SELECT region,avg(sales) as average_sales FROM sales
GROUP BY region;

SELECT category, SUM(profit) AS total_profit
FROM sales
GROUP BY category
ORDER BY total_profit DESC
LIMIT 1;

-- 11Find the most profitable category.
SELECT product_name, SUM(profit) AS total_profit
FROM sales
GROUP BY product_name
ORDER BY total_profit ASC
LIMIT 1;


-- 12 Find the least profitable product.
SELECT category,avg(profit) as profitable from sales
GROUP BY category
ORDER BY profitable  asc LIMIT 1;

-- 13 Find top 10 customers by total sales.
SELECT customer_id,sum(sales) as total_sales  from sales
GROUP BY customer_id
ORDER BY total_sales desc LIMIT 10;

-- 14 Find cities with more than 50 orders.
SELECT city, COUNT(order_id) AS total_orders
FROM sales
GROUP BY city
HAVING COUNT(order_id) > 50;

SELECT * from sales;
-- 15 Find products where average discount is greater than 20%.


SELECT product_name, AVG(discount) AS dis
FROM sales
GROUP BY product_name
HAVING dis > 0.20;


-- 16 Find total profit generated in each year.

SELECT YEAR(order_date), SUM(profit)
FROM sales
GROUP BY YEAR(order_date);
-- 17 Find total sales per month.
SELECT order_date,sum(sales) from sales
SELECT DATE_FORMAT(order_date,'%Y-%m') AS month,
SUM(sales)
FROM sales
GROUP BY month;
-- 18 Find region with highest number of orders.
SELECT region, COUNT(*) AS orders
FROM sales
GROUP BY region
ORDER BY orders DESC
LIMIT 1;


-- 19Find top 3 most sold products (by quantity).
SELECT product_name,sum(quantity) as q from sales
GROUP BY product_name 
ORDER BY q desc limit 3;

SELECT * from sales;

-- 20 Find categories where average profit is greater than overall average profit.
SELECT category, AVG(profit) AS a
FROM sales
GROUP BY category
HAVING a > (SELECT AVG(profit) FROM sales);
