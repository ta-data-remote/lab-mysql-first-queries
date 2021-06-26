USE applestore;

SELECT * FROM data
limit 10;

-- 1. Which are the different genres?
select distinct(prime_genre) from data
order by prime_genre asc;

-- 2. Which is the genre with more apps rated?
select distinct(prime_genre), sum(rating_count_tot) as genre_total from data
group by prime_genre
order by genre_total desc;

-- 3. Which is the genre with more apps?
select distinct(prime_genre), count(prime_genre) as genre_count from data
group by prime_genre
order by genre_count desc;

-- 4. Which is the one with less?
select distinct(prime_genre), count(prime_genre) as genre_count from data
group by prime_genre
order by genre_count asc;

-- 5. Take the 10 apps most rated.
select track_name, sum(rating_count_tot) as top_rated_apps from data
group by track_name
order by top_rated_apps desc
limit 10;


-- 6. Take the 10 apps best rated by users.
select track_name, user_rating as top_rated_by_user from data
group by track_name
order by top_rated_by_user desc
limit 10;


-- 7. Take a look on the data you retrieved in the question 5. Give some insights.
/* 
The most rated apps is Facebook followed by Instagram, but with very huge distance. 
They are very popular.
 Mostly are games, social networks and music apps
*/


-- 8. Take a look on the data you retrieved in the question 6. Give some insights.
/*
 The three top rated apps are very specific and different, but the rest apps very popular games and free time purposeful. 
*/

-- 9. Now compare the data from questions 5 and 6. What do you see?
/*
 The most of the apps are games, also they represents activities that more or less doesn't require high cognitive load.
*/

-- 10. How could you take the top 3 regarding the user ratings but also the number of votes?
-- select top t0 but not only the regardin the first column also the second column
-- select id, track_name, user_rating, sum(rating_count_ver) from data

select track_name, user_rating, rating_count_tot from data
where user_rating = 5
order by rating_count_tot desc
limit 3;


-- 11. Does people care about the price? Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?

-- 11.1 Convert price colum from varchar() to float
alter table data
modify price float;

-- 11.2 Amount of free and paid apps
select count(*) as amount_of_apps from data
where price > 0;
-- where price = 0;

-- 11.3 Frequency distribution of prices and their ratings
select price, count(*) as amount_of_apps, avg(user_rating) as avg_rating from data
group by price
order by avg_rating desc;

-- 11.4 Average rating for paid and free apps
select count(*) as amount_of_apps, avg(user_rating) as avg_rating from data
-- where price > 0
where price = 0
order by avg_rating desc;

-- 11.5 Check top 20 apps that are rated by most of the users  
select track_name, rating_count_tot, user_rating, price from data
order by rating_count_tot desc
limit 20;

-- 11.6 Check which apps are rated by most of the users
select sum(rating_count_tot) as sum_total_count from data
where price > 0
-- where price = 0
order by sum_total_count;




/*
Conclusion:
Our data set consist of more apps that are free than paid (possible bias)
Althout the difference between free and paid apps isn't big (and probably not significant), we can see that on average base rate users are more satisfied with paid apps than with free apps
In top 20 most rated apps are only 3 apps that are paid, the rest 17 are free
Apps that are free are rated by much more number of users than the paid apps
*/
