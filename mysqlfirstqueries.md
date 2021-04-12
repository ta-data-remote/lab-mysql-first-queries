-- 1. Which are the different genres?

SELECT distinct prime_genre FROM applestore.data;

-- 2. Which is the genre with more apps rated?**

SELECT * FROM applestore.data;
SELECT prime_genre, MAX(rating_count_tot) as count_tot
FROM applestore.data;

-- 3. Which is the genre with more apps?**

SELECT prime_genre, COUNT(*) as genre_count
FROM applestore.data
GROUP BY prime_genre
ORDER BY genre_count DESC
LIMIT 1;

-- 4. Which is the one with less?**

SELECT prime_genre, COUNT(*) as app_count
FROM applestore.data
GROUP BY prime_genre
ORDER BY app_count asc
Limit 1;

-- 5. Take the 10 apps most rated.**

SELECT id, track_name, rating_count_tot 
FROM applestore.data
ORDER BY rating_count_tot DESC
LIMIT 10;

-- 6. Take the 10 apps best rated by users.**

SELECT track_name, user_rating 
FROM applestore.data
ORDER BY user_rating DESC
LIMIT 10;


-- 7. Take a look on the data you retrieved in the question 5. Give some insights.**

SELECT id, track_name, rating_count_tot, user_rating 
FROM applestore.data
LIMIT 10;

-- has famous websites like eBay, PayPal, Evernote. Ratings rather good but none
-- are the highest that is possible.

-- 8. Take a look on the data you retrieved in the question 6. Give some insights.**

SELECT track_name, user_rating, rating_count_tot 
FROM applestore.data
ORDER BY user_rating desc
LIMIT 10;

-- strange app titles, little reviews for some.

-- 9. Now compare the data from questions 5 and 6. What do you see?**

-- The user ratings in question 5 are lower than the ten highest user ratings 
-- for the query in question 6. good scores but some of the apps have very little reviews. 
-- We have to be careful with assumptions about the data and what columns we include.

-- 10. How could you take the top 3 regarding the user ratings but also the number of votes?**

SELECT id, track_name, rating_count_tot, user_rating
FROM applestore.data
ORDER BY user_rating DESC, rating_count_tot DESC
LIMIT 3;

-- 11. Does people care about the price?
-- Do some queries, comment why are you doing them and the results you retrieve. 
-- What is your conclusion?

SELECT track_name, price, rating_count_tot, user_rating
FROM applestore.data
ORDER BY price DESC, rating_count_tot DESC;

SELECT track_name, price, rating_count_tot, user_rating
FROM applestore.data
ORDER BY price ASC, rating_count_tot DESC;

-- looked at total counts (indicator for amount of users) and price. Compare price 
-- DESC to price ASC to see how price changes the top apps in each case.
-- Free apps have more users and "famous" apps have above average score.
-- Apps with a cost have less users and in the top 10 they have slightly better reviews
-- but very close.