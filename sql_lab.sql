SELECT * FROM data;

-- 1. Which are the different genres?

SELECT distinct(prime_genre) FROM data;
-- The line above puts out all the genres as unique values



-- 2. Which is the genre with more apps rated?

SELECT prime_genre, max(rating_count_tot) FROM data;
-- The Games genre is the most rated genre.


-- 3. Which is the genre with more apps?

select distinct sum(id) as sum, prime_genre from data
group by prime_genre
order by sum desc
limit 1;

-- 4. Which is the one with less?

select distinct sum(id) as sum, prime_genre from data
group by prime_genre
order by sum asc
limit 1;


-- 5. Take the 10 apps most rated.
select distinct sum(rating_count_tot) as sum, track_name from data
group by rating_count_tot
order by sum desc
limit 10;


-- 6. Take the 10 apps best rated by users.
select track_name, user_rating from data
order by user_rating desc
limit 10;

-- 7. Take a look on the data you retrieved in the question 5. Give some insights.

select distinct sum(rating_count_tot) as sum, track_name from data
group by rating_count_tot
order by sum desc
limit 10;

/* Answer
The data shows us which apps have the most ratings. 
Here we can see that Facebook has the most ratings in the applestore. 
Followed by Instagram and Clash of Clans.
*/

-- 8. Take a look on the data you retrieved in the question 6. Give some insights.

select track_name, user_rating from data
order by user_rating desc
limit 10;

/* Answer
This data shows the best rated apps.
However the number of ratings is not considered. 
So a user_rating of 5 could be the rating of only one person. 
*/

-- 9. Now compare the data from questions 5 and 6. What do you see?

/* Answer
As mentioned above the data from 6 does not consider the number of ratings per app. 
In contrast to that number 5 only considers the number but not the total rating at the end.
*/

-- 10. How could you take the top 3 regarding the user ratings but also the number of votes?

select distinct sum(rating_count_tot) as sum, user_rating, track_name from data
where user_rating = 5
group by rating_count_tot
order by sum desc
limit 3;

-- 11. Does people care about the price? Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?

select distinct sum(rating_count_tot) as sum, user_rating, track_name, price from data
where user_rating = 5
group by rating_count_tot
order by sum desc
limit 3;

/*Answer 1
Among the most and best rated apps there is one that costs money.
The others are for free. 
*/

select distinct sum(rating_count_tot) as sum, user_rating, track_name, price from data
where user_rating = 5
group by rating_count_tot
order by price desc;

select distinct sum(rating_count_tot) as sum, user_rating, track_name, price from data
where user_rating = 5 AND price = 0.99
group by rating_count_tot
order by sum desc;

select distinct sum(rating_count_tot) as sum, user_rating, track_name, price from data
where user_rating = 5 AND price = 1.99
group by rating_count_tot
order by sum desc;


/*Answer 2
We can see that apps that cost money will also have high numbers of user_rating if the app is popular. 
People do not refuse to spend money on apps. 
Although we should check the ratio between paid/unpaid.
*/