/* Load the IronHackDB.sql structure in your local MySQL Workbench database instance. Use the applestore (not applestore2) table to query the data about
Apple Store Apps and answer the following questions: */

USE appleStore;

select * from data;

-- 1. Which are the different genres?

select prime_genre, count(prime_genre) as Count
from data
group by prime_genre;

-- 2. Which is the genre with more apps rated?

select prime_genre, count(prime_genre) as 'Number of rated apps'
from data
where rating_count_tot > 0
group by prime_genre
order by count(prime_genre) DESC
LIMIT 1;

-- 3. Which is the genre with more apps?

select prime_genre, count(prime_genre) as 'Number of apps'
from data
group by prime_genre
order by count(prime_genre) DESC
LIMIT 1;

-- 4. Which is the one with less?

select prime_genre, count(prime_genre) as 'Number of apps'
from data
group by prime_genre
order by count(prime_genre)
LIMIT 1;

-- 5. Take the 10 apps most rated.

SELECT track_name, rating_count_tot, user_rating
FROM data
ORDER BY rating_count_tot DESC
LIMIT 10;

-- 6. Take the 10 apps best rated by users.

SELECT track_name, user_rating , rating_count_tot
FROM data
ORDER BY user_rating DESC
LIMIT 10;

-- 7. Take a look on the data you retrieved in the question 5. Give some insights.

/* They are all well-known apps that are used by millions of users, so it makes sense that they have lots of ratings. Also none of them have
 5 stars, so we can assume that a high number of ratings generally makes it harder for any app from getting a perfect score. */

-- 8. Take a look on the data you retrieved in the question 6. Give some insights.

/* I see three diferent kind of apps: First, I see apps with a very specific use (flashlight, turboscan) which probably just do that job very well so they get
 good ratings even though they have a great amount of users. Second, I see apps that have a very small amount of users and probably they were just lucky that
 those users liked the app. Finally, some other apps are games that have been extremely popular and in general people like them a lot, and that's why they
 got such good ratings. Still, even 'Plant vs Zombies' has around half the number of ratings than the last one in question #5's list*/

-- 9. Now compare the data from questions 5 and 6. What do you see?

/* Lots of games present in both lists */

-- 10. How could you take the top 3 regarding the user ratings but also the number of votes?

SELECT track_name, user_rating , rating_count_tot
FROM data
ORDER BY user_rating DESC, rating_count_tot DESC
LIMIT 3;

-- 11. Does people care about the price? Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?

-- change price column from varchar to float
ALTER TABLE data MODIFY price float;

SELECT track_name, rating_count_tot, user_rating, price
FROM data
ORDER BY rating_count_tot DESC
LIMIT 10;

SELECT track_name, rating_count_tot, user_rating, price
FROM data
ORDER BY user_rating DESC
LIMIT 10;

-- How many apps are there for each price

select price, count(price) as 'Number of apps'
from data
group by price
ORDER BY count(price) DESC;
# 
-- Checking what's the price of the best rated apps. Most top rated apps cost less than 3$
SELECT price, count(price)
FROM data
where user_rating > 4
GROUP BY price
ORDER BY count(price) DESC;

-- Checking what's the average rating for different prices. There doesn't seem to be strong connection between price and user_rating in average
SELECT price, avg(user_rating)
FROM data
WHERE rating_count_tot > 0
GROUP BY price
ORDER BY price;

-- Checking what's the average rating for different prices. There doesn't seem to be strong connection between price and user_rating in average
SELECT avg(user_rating)
FROM data
WHERE rating_count_tot > 0 and price > 0;

-- Checking what's the average number of ratings for different prices. We can see that the apps with prices lower than 10$ receive much more ratings in average.
-- Free apps get much much more ratings, almost three times more than the second in the list.
SELECT price, avg(rating_count_tot), sum(rating_count_tot)
FROM data
GROUP BY price
ORDER BY avg(rating_count_tot) DESC;


