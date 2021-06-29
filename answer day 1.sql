USE applestore;

UNLOCK TABLES;



-- 1. Which are the different genres?

SELECT * FROM data;
SELECT DISTINCT (prime_genre) AS genres FROM data;

-- 2. Which is the genre with more apps rated?
SELECT count(distinct(id)), prime_genre FROM data
WHERE user_rating <> 0
GROUP BY prime_genre

ORDER BY count(id) DESC;

-- 3. Which is the genre with more apps?

SELECT count(distinct(id)), prime_genre FROM data

GROUP BY prime_genre

ORDER BY count(id) DESC;

-- 4. Which is the one with less?

SELECT count(distinct(id)), prime_genre FROM data

GROUP BY prime_genre

ORDER BY count(id) ASC LIMIT 1;

-- 5. Take the 10 apps most rated.

SELECT  rating_count_tot, track_name, prime_genre FROM data

GROUP BY track_name 

ORDER BY rating_count_tot DESC LIMIT 10;

-- 6. Take the 10 apps best rated by users.

SELECT  rating_count_tot, track_name, prime_genre FROM data
WHERE user_rating = 5
GROUP BY track_name 

ORDER BY rating_count_tot DESC LIMIT 10;

-- 7. Take a look on the data you retrieved in the question 5. Give some insights.
-- Not a big percentage of the apps are games, although this is the genre most represented.

-- 8. Take a look on the data you retrieved in the question 6. Give some insights.
-- Best rated apps are all games except for Domino's

-- 9. Now compare the data from questions 5 and 6. What do you see?
-- The most frequently rated apps (the most used or interacted with) are not the best rated

-- 10. How could you take the top 3 regarding the user ratings but also the number of votes?
SELECT  rating_count_tot, track_name, prime_genre, price FROM data
WHERE user_rating = 5
GROUP BY track_name 

ORDER BY rating_count_tot DESC LIMIT 3;

-- 11. Does people care about the price? Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?
SELECT  rating_count_tot, track_name, prime_genre, price FROM data
WHERE user_rating = 5
GROUP BY track_name 
ORDER BY rating_count_tot DESC LIMIT 10;

SELECT d.rating_count_tot, track_name, d.price, d.user_rating FROM data as d
HAVING rating_count_tot > (sum(rating_count_tot) /count(rating_count_tot))
ORDER BY d.price DESC;

-- Even if there are some non free apps in the top 10 better rated apps, this is minimal and the price is not very high. 
-- Additionally, the rating count total is much lower to non free apps, users have less access to them so the interactions 
-- (ratings and total ratings) are less than in the free apps. 