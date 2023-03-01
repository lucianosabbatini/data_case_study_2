USE sakila;

# 1. Select all the actors with the first name ‘Scarlett’.
SELECT * 
FROM actor 
WHERE first_name = 'Scarlett';

# 2. How many films (movies) are available for rent and how many films have been rented?
SELECT COUNT(return_date) FROM sakila.rental;
SELECT return_date FROM sakila.rental;
# 16044 total entries. 15861 entries (meaning they are rented out). The difference is the actual number of films returned, therefore available for renting 
# 16044-15861 = 183

# 3. What are the shortest and longest movie duration? Name the values max_duration and min_duration. 
SELECT * FROM sakila.film;
SELECT MAX(length) AS 'max_duration', MIN(length) AS min_duration FROM sakila.film; #185

# 4. What's the average movie duration expressed in format (hours, minutes)?
SELECT AVG(length)
FROM sakila.film; #115 which is 1 hour and 55 minutes

# 5. How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCT last_name) FROM sakila.actor;

#6. Since how many days has the company been operating (check DATEDIFF() function)?
SELECT * FROM sakila.rental;
SELECT MAX(DATEDIFF(last_update, rental_date)) FROM sakila.rental; # 267 days

#7. Show rental info with additional columns month and weekday. Get 20 results.
SELECT * FROM sakila.rental;
SELECT *, DATE_FORMAT(rental_date, '%M') AS 'Rental Date - Month', DATE_FORMAT(rental_date, '%d') AS 'Rental Date - Day', DATE_FORMAT(return_date, '%M') AS 'Return Date - Month', DATE_FORMAT(return_date, '%d') AS 'Return Date - Day'
FROM sakila.rental
LIMIT 20;

#8. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT *,
  CASE 
    WHEN DAYOFWEEK(rental_date) IN (1, 7) THEN 'Weekend'
    ELSE 'Workday'
  END AS 'day of the week rented'
  FROM sakila.rental;

#9. Get release years.
SELECT DISTINCT release_year FROM sakila.film;

#10. Get all films with ARMAGEDDON in the title.
SELECT *
FROM sakila.film
WHERE title LIKE '%ARMAGEDDON%';

#11. Get all films which title ends with APOLLO.
SELECT *
FROM sakila.film
WHERE title LIKE '%APOLLO';

#12. Get 10 the longest films.
SELECT * FROM sakila.film
ORDER BY length DESC
LIMIT 10;

#13. How many films include Behind the Scenes content?
SELECT *
FROM sakila.film
WHERE special_features LIKE '%BEHIND%';
