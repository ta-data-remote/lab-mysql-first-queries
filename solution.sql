select * from data;

-- 1. Which are the different genres?
select distinct(prime_genre) FROM data;

-- 2. Which is the genre with more apps rated?
select distinct(prime_genre), sum(rating_count_tot) as number_ratings from data
group by prime_genre
order by number_ratings desc;

-- 3. Which is the genre with more apps?
select count(distinct(id)) AS number_apps, prime_genre from data 
group by prime_genre
order by number_apps desc;

-- 4. Which is the one with less?
select count(distinct(id)) AS ranking, prime_genre from data 
group by prime_genre
order by ranking;

-- 5. Take the 10 apps most rated.
select distinct(track_name), sum(rating_count_tot) AS ratings from data
group by track_name
order by ratings desc
limit 10;

-- 6. Take the 10 apps best rated by users.
select distinct(track_name), sum(user_rating) AS ranking from data
group by track_name
order by ranking desc
limit 10;

-- 7. Take a look on the data you retrieved in the question 5. Give some insights.
-- Shows how many times the apps have been rated in total, shows the most rated apps in data

-- 8. Take a look on the data you retrieved in the question 6. Give some insights.
-- Shows the apps that are given the highest rating by the users, regardless of number of ratings

-- 9. Now compare the data from questions 5 and 6. What do you see?
-- The apps with the highest number of ratings are not the apps with the highest user rating
-- If the app has a high number of ratings, the rating itself may get worse since there is so many different ratings
-- Apps with a high number of ratings have a lower rating

-- 10. How could you take the top 3 regarding the user ratings but also the number of votes?

select distinct sum(rating_count_tot) as sum, user_rating, track_name from data
where user_rating = 5
group by rating_count_tot
order by sum desc
limit 3;


select distinct(track_name), sum(user_rating) AS ranking, sum(rating_count_tot) AS ratings from data
group by track_name
order by ranking desc
limit 3;

-- Either the solution is to join the tables of 5 and 6 by using UNION
-- Or the answer is that this is not possible, as the apps with the highest highest user rating are NOT equal to the apps with highest number of votes

-- 11. Does people care about the price? Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?

select distinct(track_name), price, user_rating, rating_count_tot from data
group by track_name
order by price desc;

-- Looking at this output, because I want to see how the user rating of the different apps is next to their price. 
-- It doesn't seem like people care about the price of apps regarding the users ratings of them
-- There is expensive and free apps with high ratings, seems to depend on the app

select distinct sum(rating_count_tot) as sum, user_rating, track_name, price from data
where user_rating = 5 
group by rating_count_tot
order by sum desc;
