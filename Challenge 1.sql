USE applestore;

UNLOCK TABLES;
-- 1. Which are the different genres?
SELECT distinct(prime_genre) FROM data;

-- 2. Which is the genre with more apps rated?
SELECT prime_genre, sum(rating_count_tot) AS number_apps_rated FROM data
GROUP BY prime_genre
ORDER by number_apps_rated desc;

-- 3. Which is the genre with more apps?
SELECT prime_genre, count(distinct(id)) AS number_apps FROM data
GROUP BY prime_genre
ORDER by number_apps desc;

-- 4. Which is the one with less?
SELECT prime_genre, count(distinct(id)) AS number_apps FROM data
GROUP BY prime_genre
ORDER by number_apps asc;

-- 5. Take the 10 apps most rated.
SELECT distinct(track_name), sum(rating_count_tot) AS number_apps_ratedm FROM data
GROUP BY track_name
ORDER by number_apps_ratedm desc
LIMIT 10;
-- 6. Take the 10 apps best rated by users.
SELECT track_name, sum(user_rating) AS number_apps_ratedb FROM data
GROUP BY track_name
ORDER by number_apps_ratedb desc
LIMIT 10;
-- 7. Take a look on the data you retrieved in the question 5. Give some insights.
-- The most rated are by far the games which are almost 20 times more than the least which is the shopping genre
-- 8. Take a look on the data you retrieved in the question 6. Give some insights.
-- A similar picture can be seen in this table
-- 
-- 9. Now compare the data from questions 5 and 6. What do you see?
-- it is similar so there is a correlation between the number of apps rated and the best rating
-- 10. How could you take the top 3 regarding the user ratings but also the number of votes?
SELECT track_name, sum(rating_count_tot) AS number_apps_ratedx ,  sum(user_rating) AS number_apps_ratedy FROM data
GROUP BY track_name
ORDER by number_apps_ratedx desc , number_apps_ratedy desc
LIMIT 3;

SELECT track_name, sum(rating_count_tot) AS number_apps_ratedx ,  sum(user_rating) AS number_apps_ratedy FROM data
GROUP BY track_name
ORDER by number_apps_ratedy desc, number_apps_ratedx desc 
LIMIT 3;

-- 11. Does people care about the price? Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?
SELECT track_name, sum(price) AS price_apps FROM data
SELECT track_name, sum(price) AS price_apps , sum(user_rating) AS number_apps_ratedy FROM data
GROUP BY track_name
ORDER by price_apps desc
LIMIT 100;