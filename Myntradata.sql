CREATE DATABASE myntra;
USE myntra;
SELECT product_name From products ;

-- showing specific columns
SELECT brand_name,rating FROM products;

-- showing specific column in specific order
SELECT rating_count FROM products
ORDER BY rating_count DESC;

-- create new column with mathemtical functions | Making Discounted Amount
SELECT product_name,brand_name,marked_price,discounted_price, marked_price - discounted_price as discounted_amount FROM  products;

SELECT * FROM products;

-- create new column with mathemtical functions | Making Rating Count * Rating
SELECT product_name,brand_name,rating,rating_count,rating_count*rating as Multiplication FROM products;


-- create new column with mathemtical functions | Making Discount Percentage
SELECT product_name,brand_name,((marked_price-discounted_price)/marked_price) *100 as discount_per FROM products;

SELECT distinct brand_name FROM products;

-- Adding Where Clause
SELECT product_name,brand_name ,rating_count FROM products
WHERE brand_name='Puma'and rating_count>200;

-- Adding Distinct with Where | Unique Products served by Adidas
SELECT product_name,brand_name FROM products
WHERE brand_name='Adidas';


-- 4. Finding the top 5 brand who has the most number of products | different product in their inventory
SELECT brand_name,count(product_name) as most FROM products
GROUP BY brand_name
ORDER BY most DESC LIMIT 5;

-- 5. Finding the top 5 brand who sold the most number of products
SELECT brand_name,sum(rating_count) as Sold_products FROM products
GROUP BY brand_name
ORDER BY Sold_products DESC LIMIT 5;


-- 6. Finding the top 5 most expensive brands based on their discounted price
SELECT brand_name,round(AVG(discounted_price)) AS expensive FROM products
GROUP BY brand_name
ORDER BY expensive DESC LIMIT 5;

SELECT * from products;

-- 7. Finding the top 5 least expensive brands based on their discounted price
SELECT brand_name,round(AVG(discounted_price)) AS expensive FROM products
GROUP BY brand_name
ORDER BY expensive ASC LIMIT 5;

-- 8. Finding the top 10 best-selling product categories 
SELECT product_name, SUM(rating_count) AS best_sell FROM products
GROUP BY product_name
ORDER BY best_sell DESC LIMIT 10;

-- 9. Finding the top 10 brands who gives maximum discount
SELECT brand_name,SUM(discounted_price) max_dis FROM products
GROUP BY brand_name 
ORDER BY max_dis DEsc limit 10;

-- 13. List top 5 brands which has sold most number of tshirts
select brand_name, product_name, sum(rating_count) as 'orders', avg(discounted_price) as 'avg_price'
from products 
where product_name= 'tshirts'
group by brand_name
order by orders desc limit 5;

-- 17. Most popular product name listed in Myntra
SELECT product_name,count(product_name) as name_count FROM products
GROUP BY product_name
ORDER BY name_count DESC limit 10;

-- 18. Number of products sold for every rating (0 - 5)
SELECT rating,count(rating) as freq FROM products   
GROUP BY rating
ORDER BY freq desc limit 100;

-- 19. Number of products sold for every rating by nike
SELECT brand_name,rating,count(rating) as freq from products
where brand_name='Nike'
GROUP BY rating 
ORDER BY freq asc ;

SELECT * from myntra.products;
