#1. Which are the different genres?

select distinct(prime_genre) from data;

# The different genres are: Games, Productivity, Weather, Shopping, Reference, Finance, Music, Utilities,
#Travel, Social Networking, Sports, Business, Health & Fitness, Entertainment, Photo & Video, Navigation, Education,
#Lifestyle, Food & Drink, News, Book, Medical, Catalogs.

#2. Which is the genre with more apps rated?

select prime_genre, sum(rating_count_tot) from data
group by prime_genre
order by sum(rating_count_tot) desc
limit 1;

# Games is the genre with more apps rated.

#3. Which is the genre with more apps?

select prime_genre,count(prime_genre) from data
group by prime_genre
order by count(prime_genre) desc
limit 1 ;

# Games is the genre with more apps.

#4. Which is the one with less?

select prime_genre,count(prime_genre) from data
group by prime_genre
order by count(prime_genre)
limit 1;

# Catalogs is the genre with less apps.

#5. Take the 10 apps most rated.

select track_name, rating_count_tot from data
order by rating_count_tot desc
limit 10;

#6. Take the 10 apps best rated by users.

select track_name, user_rating, prime_genre from data
order by user_rating desc
limit 10;

#7. Take a look on the data you retrieved in the question 5. Give some insights.

# The most rated apps are the most used such as the social networks Instagram and Facebook.

#8. Take a look on the data you retrieved in the question 6. Give some insights.

# The best rated apps are mostly games. 
# With only the 10 best rated apps we can not infer useful insights as there are many apps rated with a value of 5.

#9. Now compare the data from questions 5 and 6. What do you see?

select track_name, rating_count_tot, user_rating from data
order by rating_count_tot desc
limit 10;


# That the most rated apps are not necesary the best rated apps (many of those review could be bad reviews)

#10. How could you take the top 3 regarding the user ratings but also the number of votes?

select track_name, rating_count_tot, user_rating from data
where user_rating = 5
order by rating_count_tot desc
limit 3;

#The three apps with better rating and more number of votes are: Head Soccer, Plants vs Zombies, Sniper 3D Assasain.

select track_name, rating_count_tot, user_rating from data
order by user_rating desc, rating_count_tot desc
limit 3;


#11. Does people care about the price? Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?

select avg(user_rating), avg(rating_count_tot) from data
where price = 0;

# 3.4 average user rating & 19800 on average of rating counts

select avg(user_rating), avg(rating_count_tot)from data
where price <> 0;

#3.7 average user rating & 4000 on avergare of rating counts

# The conclusion is that people care about the price. Although the non free apps are better rated in average, the figures reflect that
#users are more predisposed to use (an the rate) the apps which are free.
