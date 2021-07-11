-- ![Ironhack logo](https://i.imgur.com/1QgrNNw.png)

-- # Lab | My first queries
use applestore
-- Load the *IronHackDB.sql* structure in your local MySQL Workbench database instance. Use the *applestore* (not applestore2) table to query the data about Apple Store Apps and answer the following questions: 
SELECT *
FROM data;
-- **1. Which are the different genres?** 
SELECT DISTINCT (prime_genre) as genre 
FROM data;

-- **2. Which is the genre with more apps rated?** GAMES
SELECT COUNT(id), prime_genre
FROM data
where user_rating = 0
group by prime_genre
order by count(id) DESC;

-- **3. Which is the genre with more apps?** Games
SELECT COUNT(id), prime_genre
FROM data
where user_rating = 0
group by prime_genre
order by count(id) DESC;

-- **4. Which is the one with less?** Catalogs
SELECT COUNT(id), prime_genre
FROM data
group by prime_genre
order by count(id)
LIMIT 1

-- **5. Take the 10 apps most rated.**
select rating_count_tot, track_name From data
Group By track_name
order by rating_count_tot Desc limit 10;

-- **6. Take the 10 apps best rated by users.**
select user_rating, track_name From data
where user_rating = 5
Group By track_name
order by rating_count_tot Desc limit 10;

-- **7. Take a look on the data you retrieved in the question 5. Give some insights.**
-- Distance between first and second app is big. Two most rated apps are social media apps. There is also plenty of games.

-- **8. Take a look on the data you retrieved in the question 6. Give some insights.**
-- Most of them are apps, there is no social media app.

-- **9. Now compare the data from questions 5 and 6. What do you see?**
-- Both lists show completely different apps. 

-- **10. How could you take the top 3 regarding the user ratings but also the number of votes?**
-- with Limit 3.
select user_rating, rating_count_tot, track_name From data
where user_rating = 5
Group By track_name
order by rating_count_tot  Desc 
limit 3;

-- **11. Does people care about the price?** Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?
-- First, we could see the prices for the most downloaded apps by user rating and number of ratings
select user_rating, rating_count_tot, price, track_name From data
where user_rating = 5
Group By track_name
order by rating_count_tot  Desc 
limit 20;


-- ## Deliverables 
-- You need to submit a `.sql` file that includes the queries used to answer the questions above, as well as an `.md` file including your answers. 
