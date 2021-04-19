USE appleStore;

Select * from data;

-- 1. Which are the different genres?
Select distinct prime_genre from data;

-- 2. Which is the genre with more apps rated?
Select prime_genre, count(prime_genre)
from data
where rating_count_tot > 0
group by prime_genre
order by count(prime_genre) DESC
limit 1;

-- 3. Which is the genre with more apps?
Select prime_genre, count(prime_genre)
from data
group by prime_genre
order by count(prime_genre) DESC
limit 1;

-- 4. Which is the one with less?
Select prime_genre, count(prime_genre)
from data
group by prime_genre
order by count(prime_genre)
limit 1;

-- 5. Take the 10 apps most rated. (most nr of rates)
Select track_name, rating_count_tot, user_rating, price, prime_genre
from data
order by rating_count_tot DESC
limit 10;

-- 6. Take the 10 apps best rated by users. (best rated - score)
Select track_name, user_rating, rating_count_tot, price, prime_genre
from data
order by user_rating desc
limit 10;

-- 7. Take a look on the data you retrieved in the question 5. Give some insights.
-- the 10 most rated apps are all free apps, also most of them very known ones. The user ratings are in general high, since the apps not only depend
-- on the times downloaded, but on the way the users see them. 

-- 8. Take a look on the data you retrieved in the question 6. Give some insights.
-- most apps are games and cost money (not much)

-- 9. Now compare the data from questions 5 and 6. What do you see?
-- the number of the apps that are most rated is extremly higher in the case when they are for free, comparing to the ones that are best rated. on the other handler
-- the difference in genres is more divers in the most rated apps, since the best rated ones, are mainly games.

-- 10. How could you take the top 3 regarding the user ratings but also the number of votes?
Select track_name, user_rating, rating_count_tot
from data
order by user_rating desc, rating_count_tot desc
limit 3;

-- 11. Does people care about the price? Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?
-- I think that if the apps are free of charge, they get a lot more reviews, therefore more ppl that downloaded them. this brings me to the conclusion, that money
-- makes a difference when choosing an app. Also since the free of charge apps relay a lot on the reviews, when they reached a high number of downloads, the reviews
-- and ratings start being less important (unless something very "deep" happens that changes the way the customers see the app).

ALTER table data
modify price float;

Select track_name, price, rating_count_tot, user_rating, prime_genre
from data
-- where price = 0
where price > 0
order by price desc, rating_count_tot desc, user_rating desc;
