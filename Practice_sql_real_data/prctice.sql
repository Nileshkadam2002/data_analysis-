CREATE DATABASE shirpur;
use shirpur;
SELECT * FROM products;
select count(*) from products;


-- Showing the Data
select * from products;

-- showing specific columns
SELECT product_name,rating,rating_count FROM products;

-- showing specific column in specific order
SELECT brand_tag,product_tag,brand_name FROM products;

-- create new column with mathemtical functions | Making Discounted Amount
SELECT (marked_price-discounted_price) as discounted_amount from products;

-- Finding UNIQUE values
SELECT count(brand_name) FROM products;


-- Adding Where Clause
SELECT product_name,brand_name FROM products
WHERE rating > 4;

-- Adding Distinct with Where | Unique Products served by Adidas
SELECT distinct(product_name),brand_tag FROM products
WHERE brand_tag='Adidas';

-- Products with Multiple Where Clause with AND
SELECT distinct(product_name),brand_tag,discount_percent FROM products
WHERE brand_tag='Adidas' and discount_percent > 30;

-- Products with BETWEEN
SELECT distinct(product_name),rating,rating_count FROM products
WHERE  rating_count between 30 and 1000
 and rating between 3.5 and 5;

-- Using OR
SELECT distinct(product_name),rating,rating_count FROM products
WHERE  rating_count between 30 and 1000
 or rating between 3.5 and 5;

-- Using NOT
SELECT * from products
WHERE NOT (brand_tag='Adidas' );

-- Using IN
SELECT product_name,brand_name,rating,brand_tag from products
WHERE brand_name IN ('adidas','puma') and (discounted_price between 7000 and  10000) and rating >3; 

-- Using NOT IN
SELECT product_name,brand_name,rating,brand_tag,discounted_price from products
WHERE brand_name NOT IN ('adidas','puma','CASIO','Fossil','SKAGEN') and (discounted_price between 10000 and  12000) and rating >4.5;




