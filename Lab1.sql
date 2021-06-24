-- 1. Which are the different genres?
-- SELECT distinct(prime_genre)
-- FROM data;
SELECT *
FROM data;
-- 2. Which is the genre with more apps rated?

SELECT COUNT(distinct(id)), prime_genre
FROM data
WHERE user_rating <> 0
GROUP BY prime_genre
ORDER BY COUNT(id) DESC;


-- 3. Which is the genre with more apps?

SELECT count(distinct(id)), prime_genre
FROM data
GROUP BY prime_genre
ORDER BY count(id) DESC;

-- 4. Which is the genre with the fewest apps?
SELECT count(distinct(id)), prime_genre
FROM data
GROUP BY prime_genre
ORDER BY count(id)
LIMIT 1;

-- 5. Take the 10 apps most rated.

SELECT rating_count_tot, track_name
FROM data
GROUP BY track_name
ORDER BY rating_count_tot DESC 
LIMIT 10;

-- 6. Take the 10 apps best rated by users.

SELECT rating_count_tot, track_name, user_rating
FROM data
WHERE user_rating = 5
GROUP BY track_name
ORDER BY rating_count_tot DESC 
LIMIT 10;

-- 7. Take a look on the data you retrieved in the question 5. Give some insights.

-- It seems to be that most apps here except 4 are non Game apps.
-- Apps that many people use like Facebook / Instagram and Spotify are among the most rated, likely because they have thje most users.

-- 8. Take a look on the data you retrieved in the question 6. Give some insights.

-- Two of the Apps are very similiar (HD, and lite versions) of already excisting apps on this list.
-- It seems to be only one app is not a game

SELECT *
FROM data;
-- 9. Now compare the data from questions 5 and 6. What do you see?

-- The highest rated apps are not the ones that have the most ratings.

-- 10. How could you take the top 3 regarding the user ratings but also the number of votes?

SELECT rating_count_tot, track_name, user_rating
FROM data
WHERE user_rating = 5
GROUP BY track_name
ORDER BY rating_count_tot DESC 
LIMIT 3;

-- 11. Does people care about the price? Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?-- 