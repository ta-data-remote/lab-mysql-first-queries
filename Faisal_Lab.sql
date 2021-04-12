select * from data;


-- 1. Which are the different genres?
Use appleStore;
select distinct(prime_genre) as Genres from data;


-- 2. Which is the genre with more apps rated?
select count(user_rating) as ratings, prime_genre from data
where user_rating > 0
group by prime_genre 
order by ratings desc
limit 1;


-- 3. Which is the genre with more apps?
select count(id) as apps, prime_genre from data
group by prime_genre 
order by apps desc
limit 1;


-- 4. Which is the one with less?
select count(id) as apps, prime_genre from data
group by prime_genre 
order by apps
limit 1;

-- 5. Take the 10 apps most rated.
select track_name, rating_count_tot from data
order by rating_count_tot desc
limit 10;

-- 6. Take the 10 apps best rated by users.
select track_name, user_rating from data
order by user_rating desc
limit 10;

-- 7. Take a look on the data you retrieved in the question 5. Give some insights.
/* 
The data retrieved shows the top 10 apps with the most number of ratings meaning they're popular and had a big reach.
But this data does not show the user satisfaction factor.
*/

-- 8. Take a look on the data you retrieved in the question 6. Give some insights.
/* 
The data retrieved shows the top 10 apps with the highest possible rating : "5*****"
The number of apps that have a 5 star rating is more than 10, and the number of ratings for the app is a factor that affects the average rating.
*/
-- 9. Now compare the data from questions 5 and 6. What do you see?
/* 
The data is inconsistent and biased 
*/
-- 10. How could you take the top 3 regarding the user ratings but also the number of votes?
select track_name, user_rating,rating_count_tot from data
where user_rating = 5
order by rating_count_tot desc
limit 3;


-- 11. Does people care about the price? Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?


-- This query shows us that the apps with 0 price have a general lower average rating than paid apps
select price, count(*) as number_of_apps, avg(user_rating) as average_rating from data
group by price
order by average_rating desc;


-- This query shows us the number of paid apps over the free average
select price, count(*) as number_of_apps, avg(user_rating) as average_rating from data
group by price
order by average_rating desc;

select count(*) as number_of_apps, avg(user_rating) as average_rating from data
where price > 0
order by average_rating desc;

-- the overall user satisfaction is higher with paid apps than free ones

