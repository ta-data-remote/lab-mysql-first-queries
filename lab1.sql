USE applestore;


-- 1. Which are the different genres?
select distinct prime_genre from data;

-- 2. Which is the genre with more apps rated?
select sum(rating_count_tot), prime_genre from data
group BY prime_genre
order by sum(rating_count_tot) desc;

-- 3. Which is the genre with more apps?
select count(track_name), prime_genre from data
group BY prime_genre
order by count(track_name) desc;

-- 4. Which is the one with less?
select count(track_name), prime_genre from data
group BY prime_genre
order by count(track_name);

-- 5. Take the 10 apps most rated.
select track_name, rating_count_tot from data
order by rating_count_tot desc
limit 10;

-- 6. Take the 10 apps best rated by users.
select track_name, user_rating from data
order by user_rating desc
limit 10;

-- 7. Take a look on the data you retrieved in the question 5. Give some insights.
-- the most rated apps

-- 8. Take a look on the data you retrieved in the question 6. Give some insights.
-- the best rated apps

-- 9. Now compare the data from questions 5 and 6. What do you see?
select track_name, user_rating, rating_count_tot from data
order by rating_count_tot desc;

-- 10. How could you take the top 3 regarding the user ratings but also the number of votes?
select track_name, user_rating, rating_count_tot from data
order by user_rating desc, rating_count_tot desc 
limit 3;

-- 11. Do people care about the price? Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?

select price, track_name, user_rating from data
order by price
limit 50;

select price, track_name, user_rating, prime_genre from data
order by price desc
limit 50;

select sum(price), prime_genre, user_rating from data
group by prime_genre;