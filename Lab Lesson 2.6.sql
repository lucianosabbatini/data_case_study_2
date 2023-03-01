USE sakila;

#1.

SELECT last_name
FROM sakila.actor
GROUP BY last_name
HAVING COUNT(*) = 1;

#2. 
SELECT last_name
FROM sakila.actor
GROUP BY last_name
HAVING COUNT(*)>1;

#3. 
SELECT staff_id, COUNT(*) as 'Rental per Staff' 
FROM sakila.rental
WHERE staff_id IN (1, 2) 
GROUP BY staff_id;

#4.
SELECT * FROM sakila.film;
SELECT COUNT(release_year) FROM sakila.film; # all movies where released in 2006

#5.
SELECT rating, COUNT(*) AS 'Movies per Rating' 
FROM sakila.film
WHERE rating IN ('PG', 'G', 'NC-17', 'PG-13', 'R')
GROUP BY rating;

#6.
SELECT rating, ROUND(AVG(length), 2) AS 'Mean Movie Length' 
FROM sakila.film
WHERE rating IN ('PG', 'G', 'NC-17', 'PG-13', 'R')
GROUP BY rating;

#7.
SELECT rating, ROUND(AVG(length), 2) AS 'Mean Movie Length' 
FROM sakila.film
WHERE rating IN ('PG', 'G', 'NC-17', 'PG-13', 'R')
GROUP BY rating
HAVING AVG(length)>120;

#8.
SELECT title, length,
  CASE 
    WHEN length>=150 THEN 'Super Long Movie'
    WHEN length BETWEEN 150 AND 110 THEN 'Long Movie'
    WHEN length BETWEEN 60 AND 109 THEN 'Standard Movie' 
    ELSE 'Short Movie'
  END AS 'Duration Rank'
  FROM sakila.film
  WHERE length IS NOT NULL AND length != 0
  ORDER BY length ASC;
