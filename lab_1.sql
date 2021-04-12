USE appleStore; 
SELECT * FROM data;

-- 1. Which are the different genres? 
SELECT distinct(prime_genre) FROM data;

-- 2. Which is the genre with more apps rated? >> Games
select prime_genre, sum(rating_count_tot) as total_count_genre from data 
group by prime_genre
order by total_count_genre desc;

-- 3. Which is the genre with more apps? >> Games
select prime_genre, sum(track_name) as total_count_app from data 
group by prime_genre
order by total_count_app desc;

-- 4. Which is the one with less?
select prime_genre, sum(track_name) as total_count_app from data 
group by prime_genre
order by total_count_app;

-- 5. Take the 10 apps most rated.
select * from data 
order by rating_count_tot desc
limit 10;

-- 6. Take the 10 apps best rated by users.
select * from data 
order by user_rating desc
limit 10;

-- 7. Take a look on the data you retrieved in the question 5. Give some insights.
select track_name, prime_genre, price, rating_count_tot from data 
order by rating_count_tot desc
limit 10;
-- the most rated apps are facebook, IG and Clash of Clans. Generally in the top 10, most most rated apps are Games (4), Social Networking & Music (2 each) and they are all free.

-- 8. Take a look on the data you retrieved in the question 6. Give some insights.
select track_name, prime_genre, price, user_rating from data 
order by user_rating desc
limit 10;
-- the highest rated apps (5 stars) are mostly of the genre Games, only 2 are completely free, the rest costs money

-- 9. Now compare the data from questions 5 and 6. What do you see?
-- The highest rated apps are not the ones that are most rated. Games score high in booth comparisons.

-- 10. How could you take the top 3 regarding the user ratings but also the number of votes?
select track_name, user_rating, rating_count_tot from data
order by user_rating desc, rating_count_tot desc;

-- 11. Does people care about the price? Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?
select avg(user_rating) as Average_rating from data
where price <> 0;

select avg(user_rating) as Average_rating from data
where price = 0;
-- the average user rating of the free apps is slightly lower which means that even though some apps cost money, they have higher rating.

-- EXTRA Orders database
USE orders; 
SELECT * FROM orders;

-- Get the total amount spent for each customer (round to the second decimal)
select CustomerID, round(sum(amount_spent),2) as total from orders
group by CustomerID;

-- Get those customers whose total amount spent is higher than 100000 and order them descendingly by the total amount spent
select CustomerID, round(sum(amount_spent),2) as total from orders
group by CustomerID
having total > 100000 
order by total desc;

-- Get the total amount spent for each month in the year 2011 (round to the second decimal) and order them descendingly by the total amount spent
select month, round(sum(amount_spent),2) as total from orders  
where year = 2011
GROUP by month
order by total desc;

-- Get those countries whose total amount spent in the year 2011 is higher than 250000
select Country, round(sum(amount_spent),2) as total from orders  
where year = 2011
group by Country
having total > 250000 
order by total desc;