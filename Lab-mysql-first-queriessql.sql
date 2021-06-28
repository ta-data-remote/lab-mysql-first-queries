USE appleStore;
UNLOCK tables;
SELECT * FROM data;


-- 1. Which are the different genres?
SELECT prime_genre FROM data;

-- 2. Which is the genre with more apps rated?
SELECT prime_genre, max(DISTINCT(rating_count_tot)) AS most_rated_apps FROM data
GROUP BY prime_genre
ORDER BY most_rated_apps desc;

-- 3. Which is the genre with more apps?
SELECT id, prime_genre, count(DISTINCT(rating_count_tot)) AS count_apps FROM data
GROUP BY prime_genre
ORDER BY count_apps desc;


SELECT prime_genre, MAX(rating_count_tot) FROM data
GROUP BY prime_genre
limit 1;


-- 4. Which is the one with less?
SELECT prime_genre, MIN(rating_count_tot) FROM data
GROUP BY prime_genre
limit 1;

-- 5. Take the 10 apps most rated.
select track_name, sum(rating_count_tot) as most_rated_apps from data
group by track_name
order by most_rated_apps desc
limit 10;

 
-- 6. Take the 10 apps best rated by users.
select track_name, sum(user_rating) as user_rating from data
group by track_name
order by user_rating desc
limit 10;

-- 7. Take a look on the data you retrieved in the question 5. Give some insights.

-- Top apps are highly common apps and non game apps.
-- Apps many of us use (like spotify/Instagram/facebook are in the most rated. This is likely because they have the most users.


-- 8. Take a look on the data you retrieved in the question 6. Give some insights.

-- Seems to be only one app is not a game

-- 9. Now compare the data from questions 5 and 6. What do you see?

-- High rated doesent mean most ratings.

-- 10. How could you take the top 3 regarding the user ratings but also the number of votes?

SELECT rating_count_tot, track_name, user_rating
FROM data
WHERE user_rating = 5
GROUP BY track_name
ORDER BY rating_count_tot DESC 
LIMIT 3;


-- 11. Does people care about the price? Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?

SELECT * FROM data
ORDER BY price DESC;


-- Checking rating_count_tot for changes between free apps and more expensive apps and try to find out which ones are more popular
-- I group by price and compute the average rating_count_tot

SELECT price, avg(rating_count_tot) FROM data
GROUP BY price
ORDER BY price ASC;

SELECT price, avg(rating_count_tot) FROM data
GROUP BY price
ORDER BY avg(rating_count_tot) DESC;

-- Free apps have on avarage more rating count than expensive ones
-- Could be a sign, that free apps are more attractive to download.
