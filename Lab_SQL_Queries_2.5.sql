		#Lab | SQL Queries - Lesson 2.5
USE sakila;

# 1. Select all the actors with the first name ‘Scarlett’.
SELECT * FROM sakila.actor;

SELECT * FROM sakila.actor
WHERE first_name = 'Scarlett';

# 2. How many films (movies) are available for rent and how many films have been rented?
SELECT COUNT(rental_date) FROM rental;
-- Total count: 16044

SELECT COUNT(return_date) FROM rental;
-- Total count: 15861
-- SO 15861 have been returned and available for rent
-- The ones that are not available for rent is (16044-15861 = 183)

# 3. What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT * FROM film;

SELECT MAX(length) AS max_duration, MIN(length) AS min_duration  FROM film;
-- Max duration: 180
-- Min duration: 46

# 4. What's the average movie duration expressed in format (hours, minutes)?
SELECT AVG(length) AS 'average_movie_duration' FROM film;
-- CONVERT(length, DATETIME)
-- SELECT AVG(lenght(CONVERT(lenght(date), 'hh:mm')) AS 'average_movie_duration' FROM sakila.film;

# 5. How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCT last_name) FROM sakila.actor;
-- There are 121 different actors last names

# 6. Since how many days has the company been operating (check DATEDIFF() function)?



# 7. Show rental info with additional columns month and weekday. Get 20 results.
# 8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
# 9.Get release years.


# 10. all films with ARMAGEDDON in the title.
SELECT title
FROM sakila.film
WHERE title LIKE '%ARMAGEDDON%';

# 11. Get all films which title ends with APOLLO.
SELECT title
FROM sakila.film
WHERE title LIKE '%APOLLO';

# 12. Get 10 the longest films.
SELECT DISTINCT length, title
FROM sakila.film
ORDER BY length DESC
LIMIT 10;

# 13. How many films include Behind the Scenes content?
SELECT *
FROM sakila.film;

SELECT *
FROM sakila.film
WHERE special_features LIKE '%Behind_the_Scenes%';