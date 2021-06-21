-- We open the script, run with the tunder, and refresh the schemas
-- Now we select out DB
USE appleStore;
-- We are gonna have a look to the table
UNLOCK TABLES; 

SELECT * FROM data;

-- **1. Which are the different genres?**

SELECT distinct(prime_genre) FROM data;

-- **2. Which is the genre with more apps rated?**

SELECT prime_genre, sum(rating_count_tot) FROM data
GROUP BY prime_genre
ORDER BY sum(rating_count_tot) desc
LIMIT 1;

-- **3. Which is the genre with more apps?**

-- ALL THE ROWS BELONGING TO THE GENRE WITH COUNTS, NUMBER OF ROWS COUNT(*) 

SELECT prime_genre,count(*) FROM data
GROUP BY prime_genre
ORDER BY count(*) desc
LIMIT 1;

-- we detect that are duplicates

SELECT prime_genre,count(distinct(track_name)) FROM data
GROUP BY prime_genre
ORDER BY count(distinct(track_name)) DESC
LIMIT 1;


-- **4. Which is the one with less?**

SELECT prime_genre,count(distinct(track_name)) FROM data
GROUP BY prime_genre
ORDER BY count(distinct(track_name)) ASC
LIMIT 1;



-- **5. Take the 10 apps most rated.**

SELECT track_name, rating_count_tot,prime_genre FROM data
ORDER BY rating_count_tot desc
LIMIT 10;

-- **6. Take the 10 apps best rated by users.**

SELECT track_name, user_rating,prime_genre FROM data
ORDER BY user_rating desc
LIMIT 10;

-- **7. Take a look on the data you retrieved in the question 5. Give some insights.**

-- We can see that most rated Apps are Facebook, followed by Instagram

-- **8. Take a look on the data you retrieved in the question 6. Give some insights.**

-- The majority of the Apps of the top 10 best rated Apps belong to the genre Games.

-- **9. Now compare the data from questions 5 and 6. What do you see?**

-- That a App has more rating counts does not mean it has the best rate. 

-- **10. How could you take the top 3 regarding the user ratings but also the number of votes?**

SELECT track_name, user_rating, rating_count_tot, prime_genre FROM data
ORDER BY user_rating DESC, rating_count_tot DESC
LIMIT 3; 

-- **11. Does people care about the price?** Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?

SELECT * FROM data
ORDER BY price DESC;

SELECT * FROM data
ORDER BY price ASC;

-- Looking at the rating_count_tot how it changes between free apps and more expensive apps I would see  which ones are more popular
-- I group by price and compute the average rating_count_tot

SELECT price, avg(rating_count_tot) FROM data
GROUP BY price
ORDER BY price ASC;

SELECT price, avg(rating_count_tot) FROM data
GROUP BY price
ORDER BY avg(rating_count_tot) DESC;

-- I CAN SEE THAT THE FREE APPS HAVE ON AVERAGE MUCH MORE RATING COUNTS THAN THE EXPENSIVE APPS

-- If we aggregate by genre, we can see which genres have more ratings on average for each of the prices
SELECT prime_genre, price, avg(rating_count_tot) FROM data
GROUP BY prime_genre ,price
ORDER BY price ASC,avg(rating_count_tot) DESC;

-- WITHIN THE FREE APPS, THE GENRE REFERENCE IS THE MOST POPULAR
-- WE CAN ALSO OBSERVE THAT NOT FOR ALL PRICES WE HAVE ALL GENRES OF APPS. THE MOST EXPENSIVE, LESS GENRES WE FIND










