Use applestore;
select * from data;

#1. Which are the different genres?

Select distinct prime_genre from data;

#2. Which is the genre with more apps rated?

select prime_genre, user_rating, sum(user_rating) as sum from data
group by prime_genre
order by sum desc;

#3. Which is the genre with more apps?

select prime_genre, count(distinct(id))  as sum_ap from data
group by prime_genre
order by sum_ap desc;

#4. Which is the one with less?

select prime_genre, count(distinct(id)) as sum_ap from data
group by prime_genre
order by sum_ap asc;

#5. Take the 10 apps most rated.
select  track_name, sum(rating_count_tot) as sum_ap  from data
group by track_name
order by sum_ap desc
limit 10;

#6. Take the 10 apps best rated by users.
select  track_name, sum(user_rating) as user_rat  from data
group by track_name
order by user_rat desc
limit 10;

#7. Take a look on the data you retrieved in the question 5. Give some insights.
# Facebook, Instagram, Clash of Clans are not surprisingly the most rated tracks. They are some kind of outliers compared to the dataset. Obviously, they are the most known and publicly used tracks. 

#8. Take a look on the data you retrieved in the question 6. Give some insights.
#The user rate the tracks very differently (games king of dragon, sudoku) and learning programs are very high rated.

#9. Now compare the data from questions 5 and 6. What do you see?
#It seems that the user ratings and number of votes do not match. Facebook and Co do not have the highest user_rating mark.

#10. How could you take the top 3 regarding the user ratings but also the number of votes?
select  track_name, sum(rating_count_tot) as sum_ap, sum(user_rating) as user_rat  from data
group by track_name
order by sum_ap desc , user_rat desc 
limit 3;
#11. Does people care about the price? Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?

select  track_name, sum(rating_count_tot) as sum_ap, sum(user_rating) as user_rat, sum(price) as price  from data
group by track_name
order by sum_ap desc , user_rat desc 
;

select  track_name, sum(rating_count_tot) as sum_ap, sum(user_rating) as user_rat, sum(price) as price  from data
group by track_name
order by sum_ap asc , user_rat asc 
;

select  track_name, sum(rating_count_tot) as sum_ap, sum(user_rating) as user_rat, sum(price) as price  from data
group by track_name
order by sum_ap desc , user_rat desc, price asc 
;

#definitely the price  has an impact. The top rated counts as well as user rates are all free (facebook, instagram). The worst rated apps mostly charge some kind of fee.
#The highest apps are either free or cost lower than than 1 Euro. For some special games minecraft, terraria (very well known) users are willing to pay a larger price