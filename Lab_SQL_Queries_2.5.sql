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
SELECT AVG(length) AS Average_movie_duration
FROM sakila.film;
-- The average movie duration is 115.27 minutes which equals to 1h 55 minutes.


SELECT date_format(CONVERT(AVG(length), DATETIME), '%m')  AS 'average_movie_duration' 
FROM sakila.film
-- WHERE date_format(CONVERT(length, DATETIME), '%m-%h');

SELECT AVG(length) AS 'Average_movie_duration',
	FORMAT(DATEADD(minute, Start, 0), 'hh:mm')
FROM sakila.film;

SELECT length, CONCAT(floor(film.length/60),':', 
CASE    
WHEN film.length - floor(film.length/60)*60 < 1 THEN '0'
ELSE FLOOR(film.length - floor(film.length/60)*60 )
END) AS hours
FROM sakila.film;


-- SELECT AVG(lenght(CONVERT(lenght(date), 'hh:mm')) AS 'average_movie_duration' FROM sakila.film;

# 5. How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCT last_name) FROM sakila.actor;
-- There are 121 different actors last names

# 6. Since how many days has the company been operating (check DATEDIFF() function)?
SELECT DATEDIFF (MAX(LAST_UPDATE), MIN(RENTAL_DATE) )
FROM sakila.rental;
-- The company has been operating for 275 days.

# 7. Show rental info with additional columns month and weekday. Get 20 results.
SELECT * FROM sakila.rental;

SELECT *, date_format(CONVERT(left(rental_date, 10), date), '%M') AS 'Month of rental', DATE_FORMAT(rental_date,'%W') as weekday
FROM sakila.rental
LIMIT 20;
-- or:
SELECT *, DATE_FORMAT(rental_date,'%M') as month, DATE_FORMAT(rental_date,'%W') as weekday FROM sakila.rental
LIMIT 20;

# 8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT *, DATE_FORMAT(rental_date,'%W') as weekday,
CASE
WHEN DATE_FORMAT(rental_date,'%W') = 'Monday' then 'workday'
WHEN DATE_FORMAT(rental_date,'%W') = 'Tuesday' then 'workday'
WHEN DATE_FORMAT(rental_date,'%W') = 'Wednesday' then 'workday'
WHEN DATE_FORMAT(rental_date,'%W') = 'Thursday' then 'workday'
WHEN DATE_FORMAT(rental_date,'%W') = 'Friday' then 'workday'
ELSE 'weekend'
END AS 'day_type'
FROM sakila.rental;

-- or
SELECT *, WEEKDAY(rental_date) AS 'Weekday',
CASE
WHEN (WEEKDAY(rental_date) >  4 ) then 'weekend'
ELSE 'workday'
END AS day_type
FROM sakila.rental;

# 9.Get release years.
SELECT DISTINCT(release_year) FROM sakila.film;
-- All films have the same release year: 2006

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

SELECT COUNT(film_id)
FROM sakila.film
WHERE special_features LIKE '%Behind_the_Scenes%';
-- The number of films that contain Behind the scenes are 538