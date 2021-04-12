#1. Which are the different genres?

select distinct(prime_genre) from data;

# The different genres are: Games, Productivity, Weather, Shopping, Reference, Finance, Music, Utilities,
#Travel, Social Networking, Sports, Business, Health & Fitness, Entertainment, Photo & Video, Navigation, Education,
#Lifestyle, Food & Drink, News, Book, Medical, Catalogs.

#2. Which is the genre with more apps rated?

select prime_genre from data
order by rating_count_tot desc
limit 1;

# Social Networking is the genre with more apps rated.

#3. Which is the genre with more apps?

select prime_genre,count(prime_genre) from data
group by prime_genre
order by count(prime_genre) desc ;

# Games is the genre with more apps.

#4. Which is the one with less?

select prime_genre,count(prime_genre) from data
group by prime_genre
order by count(prime_genre);

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

# That the most rated apps are not necesary the best rated apps (many of those review could be bad reviews)

#10. How could you take the top 3 regarding the user ratings but also the number of votes?

select track_name, rating_count_tot, user_rating from data
where user_rating = 5
order by rating_count_tot desc
limit 3;

#The three apps with better rating and more number of votes are: Head Soccer, Plants vs Zombies, Sniper 3D Assasain.

#11. Does people care about the price? Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?

select track_name, rating_count_tot, user_rating, price from data
where user_rating = 5 and price = 9.99
order by rating_count_tot desc
limit 10;

select track_name, rating_count_tot, user_rating, price from data
where user_rating = 5 and price <> 0
order by rating_count_tot desc
limit 10;

select track_name, rating_count_tot, user_rating, price from data
where user_rating = 5 and price <> 0
order by rating_count_tot desc
limit 10;

# My first conclusion is that the users do care about price, as the most expensive apps are the less valued ones in average (independiently of the rating).
# Another conclusion is that users prefer free apps but they will be fine with paying until 2 dollars/euro (the results of the 
# most rated apps, with a valoration of 5 where the price was different to 0 reflect this)