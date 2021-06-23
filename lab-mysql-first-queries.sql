
-- In this file all sql codes along with answers are included and hence there is no .md file made as discussed before! 

-- 1. Which are the different genres?
USE appleStore;

SELECT * FROM data
limit 100000;

SELECT distinct(prime_genre) FROM data;

-- 2. Which is the genre with more apps rated?
SELECT prime_genre, sum(rating_count_tot) FROM data
GROUP BY  prime_genre
ORDER BY sum(rating_count_tot) desc
Limit 1;

-- 3. Which is the genre with more apps?
SELECT  count(distinct(track_name)), prime_genre FROM data
group by prime_genre
order by count(distinct(track_name)) desc
limit 1;

-- 4. Which is the one with less?
SELECT count(distinct(track_name)), prime_genre FROM data
group by prime_genre
order by count(distinct(track_name)) asc
LIMIT 1;

-- 5. Take the 10 apps most rated.
SELECT track_name, prime_genre, rating_count_tot FROM data
order by rating_count_tot desc
LIMIT 10;

-- 6. Take the 10 apps best rated by users.
SELECT track_name, prime_genre, user_rating FROM data
order by user_rating desc
LIMIT 10;

-- 7. Take a look on the data you retrieved in the question 5. Give some insights.
/*
In the above dataset, we see Facebook as having highest rating counts in total which is 2974676
Apart from that, Instagram too having good number of rating counts followed by clash of clans.alter
Mostly, they are of catergory Social Networking and Games.
*/

-- 8. Take a look on the data you retrieved in the question 6. Give some insights.
/*
In the above dataset, we see all the top 10 apps have user ratings of 5
Also, out of 10, prime genre category of 'Game' has 60% of data share.
Game is more popular in top 10 with resepect to User_rating.
*/


-- 9. Now compare the data from questions 5 and 6. What do you see?
SELECT track_name, prime_genre, rating_count_tot, user_rating FROM data
order by rating_count_tot desc
LIMIT 10;

/*
When We consider the user ratings of top 10 rated apps, it shows they have having less user_rating than 
top 10 user_rating apps. This is clear distinction between the results of two questions. 
Also, there is not a single apps from top 20 user rated apps in list of top 10 most rated apps!
*/

-- 10. How could you take the top 3 regarding the user ratings but also the number of votes?
SELECT track_name, user_rating, rating_count_tot FROM data
order by user_rating desc, rating_count_tot desc
LIMIT 3;

-- 11. Does people care about the price? Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?

-- calling all counts with average rating and user rating where apps are totally free!!!
SELECT round(avg(rating_count_tot)) as 'Average Rating Count', 
round(avg(user_rating),1) as 'Average User Rating',
count(*) FROM data
WHERE price = 0;

-- calling all counts with average rating and user rating where apps are paid!!!
SELECT round(avg(rating_count_tot)) as 'Average Rating Count', 
round(avg(user_rating),1) as 'Average User Rating',
count(*) FROM data
WHERE price <> 0;

-- we can also recall all prime genre where price is 0!
SELECT prime_genre, round(avg(rating_count_tot)) as 'Average Rating Count', 
round(avg(user_rating),1) as 'Average User Rating',
count(*) FROM data
WHERE price = 0
GROUP BY prime_genre;

-- -- we can also recall all prime genre where price is more than 0!
SELECT prime_genre, round(avg(rating_count_tot)) as 'Average Rating Count', 
avg(user_rating) as 'Average User Rating',
count(*) FROM data
WHERE price <> 0
GROUP BY prime_genre;

/*
From the result, it shows that free apps are more preferred than paid apps. Thouhg Free apps having 
average user rating of 3.4 but total share of 
*/
