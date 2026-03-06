use geeksforgeek;

select * from restaurants;
-- 1. Select all columns from the restaurant table.
select * from restaurants;
-- 2. Display the names and cities of all restaurants.
SELECT name, city from restaurants;

-- 3. Find all restaurants located in Bangalore.

SELECT * FROM restaurants
where city='Bangalore';
-- 4. List the names and ratings of restaurants with a rating greater than 4.0.

select name, rating from restaurants
where rating>4;

-- 5. Find restaurants where the cost is less than or equal to 300.
select * from restaurants
where cost>300;

-- 6. Display all distinct cuisine types available in the dataset.

select distinct cuisine from restaurants;

-- 7. Find all restaurants serving Biryani cuisine.

-- 8. Show the top 5 restaurants with the highest ratings.
select * from restaurants
ORDER BY rating desc 
LIMIT 5;

select * from restaurants
ORDER BY rating desc 
LIMIT 1,1;

select * from restaurants
ORDER BY rating desc 
LIMIT 1,3;

-- 9. List restaurants with a rating count greater than 1000.

SELECT * FROM restaurants
WHERE rating_count>1000;


-- 10. Count the total number of restaurants in the dataset.
select COUNT(*) FROM restaurants;

select * from restaurants;
-- 11. Find the average cost of all restaurants.
SELECT avg(cost) from restaurants;


-- 12. Display restaurant names and costs ordered by cost in ascending order.
select name,cost from restaurants
order by cost asc;

-- 13. Find the average rating of restaurants for each city.
SELECT AVG(rating),city from restaurants
group by city; 

-- 14. Count the number of restaurants available in each city.
SELECT city,count(*) from restaurants
GROUP BY city;

SELECT city,count(*) as Total_number from restaurants
GROUP BY city
ORDER BY Total_number DESC;

-- 15. Find the maximum and minimum cost of restaurants for each cuisine.

SELECT cuisine,MAX(cost) as maximum_cost, 
MIN(cost) as minimum_cost 
FROM restaurants
GROUP BY cuisine;

SELECT cuisine,MAX(cost) as maximum_cost, 
MIN(cost) as minimum_cost 
FROM restaurants
where cost>50
GROUP BY cuisine;



SELECT cuisine,cost from restaurants
where cuisine='Beverages'
order by cost asc;

CREATE VIEW V2 AS 
SELECT cuisine,MAX(cost) as maximum_cost, 
MIN(cost) as minimum_cost 
FROM restaurants
GROUP BY cuisine;

SELECT * from V2;

-- 16. List cuisines that have more than 10 restaurants.

SELECT cuisine, COUNT(*) AS restaurant_count
FROM restaurants
GROUP BY cuisine
HAVING COUNT(*) > 10;


SELECT name ,count(*) as franchise FROM restaurants
GROUP BY name
order by franchise desc;

-- 17. Find the top 3 cities with the highest number of restaurants.
SELECT city,count(name) as num_restourants FROM restaurants
GROUP BY city
HAVING count(name) 
ORDER BY num_restourants desc LIMIT 3;

-- 18. Display the average cost of restaurants for each cuisine.
SELECT AVG(cost),cuisine FROM restaurants
GROUP BY cuisine
HAVING AVG(cost);


-- 19. Find cities where the average restaurant rating is greater than 4.0.
SELECT city,AVG(rating) FROM restaurants
GROUP BY city
HAVING AVG(rating)>4.0;

-- 20. List restaurants whose cost is higher than the average cost of all restaurants.
SELECT name, city, cost
FROM restaurants
WHERE cost > (SELECT AVG(cost) FROM restaurants)
ORDER BY cost DESC;


-- 21. Find the total number of ratings (rating_count) for each city.
SELECT city, SUM(rating_count) as total_rating
FROM restaurants
GROUP BY city
ORDER BY total_rating DESC LIMIT 10;


-- 22. Display cuisines ordered by their average rating in descending order.
SELECT cuisine,AVG(rating) as average_rating  FROM restaurants
GROUP BY cuisine
ORDER BY AVG(rating) DESC;



-- 23. Find restaurants that have the highest rating within their city.
SELECT city,count(*),AVG(rating) FROM restaurants
GROUP BY city 
ORDER BY AVG(rating) DESC;

SELECT city, name, rating
FROM restaurants r1
WHERE rating = (
    SELECT MAX(rating) 
    FROM restaurants r2 
    WHERE r1.city = r2.city
)
ORDER BY city;

SELECT city, name, rating
FROM (
    SELECT 
        city, 
        name, 
        rating,
        RANK() OVER(PARTITION BY city ORDER BY rating DESC) as rnk
    FROM restaurants
) AS ranked_table
WHERE rnk = 1;



SELECT * FROM restaurants;

-- 24. List cities that have more than one cuisine type available.
SELECT city,count(DISTINCT(cuisine)) AS cuisine_count FROM restaurants
GROUP BY city
HAVING COUNT(DISTINCT cuisine)>1
ORDER BY cuisine_count DESC ;


-- 25. Find the restaurant(s) with the maximum rating_count in the dataset.
SELECT name,rating_count FROM restaurants
ORDER BY rating_count DESC
LIMIT 10;





-- 1. Which restaurant of abohar is visied by least number of people?
SELECT * from restaurants 
where city='abohar'
and rating_count=(SELECT min(rating_count) from restaurants where city ='abohar' );

-- 2. Which restaurant has generated maximum revenue all over india?
SELECT * from restaurants where cost*rating_count=(select max(cost* rating_count) from restaurants);

-- 3. How many restaurants are having rating more than the average rating?
SELECT * FROM restaurants where rating > (select avg(rating) from restaurants);

-- 4. Which restaurant of Delhi has generated most revenue?
select * from restaurants where city='Delhi' and cost*rating_count=(select max(cost*rating_count) from restaurants  where city='Delhi');

-- 5. Which restaurant chain has maximum number of restaurants?

select name , sum(rating_count * cost) as 'revenue' from restaurants
group by name order by sum(rating_count*cost) desc limit 10;

-- 6. Which restaurant chain has generated maximum revenue?

select name , sum(rating_count * cost) as 'revenue' from restaurants
group by name order by sum(rating_count*cost) desc limit 10;
-- 7. Which city has maximum number of restaurants?

-- 8. Which city has generated maximum revenue all over india?

-- 9. List 10 least expensive cuisines?

-- 10. List 10 most expensive cuisines?

-- 11. What is the city is having Biryani as most popular cuisine

-- 12. List top 10 unique restaurants with unique name only thorughout the dataset as per generate maximum revenue (Single restaurant with that name)
