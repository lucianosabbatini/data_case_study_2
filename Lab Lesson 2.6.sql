USE sakila;

#1. Using GROUP BY function to gather all last names that have a single occurance.

SELECT last_name
FROM sakila.actor
GROUP BY last_name
HAVING COUNT(*) = 1;

#2. Using GROUP BY function to gather all last names that have more than 1 occurance.
SELECT last_name
FROM sakila.actor
GROUP BY last_name
HAVING COUNT(*)>1;

#3. Where at the column of staff we find number 1 and 2 we group it and count it in a different column. 
SELECT staff_id, COUNT(*) as 'Rental per Staff' 
FROM sakila.rental
WHERE staff_id IN (1, 2) 
GROUP BY staff_id;

#4. 
SELECT * FROM sakila.film;
SELECT COUNT(release_year) FROM sakila.film; # all movies where released in 2006

#5. At the column rating where there are the desired values, we group them and perform a count by category in an alias column.
SELECT rating, COUNT(*) AS 'Movies per Rating' 
FROM sakila.film
WHERE rating IN ('PG', 'G', 'NC-17', 'PG-13', 'R')
GROUP BY rating;

#6. At the column rating where there are the desired values, we group them and perform a rounded mean calculation by category in an alias column.
SELECT rating, ROUND(AVG(length), 2) AS 'Mean Movie Length' 
FROM sakila.film
WHERE rating IN ('PG', 'G', 'NC-17', 'PG-13', 'R')
GROUP BY rating;

#7. At the column rating where there are the desired values, we group them and perform a rounded mean calculation by category and having its result in a filtered alias column.
SELECT rating, ROUND(AVG(length), 2) AS 'Mean Movie Length' 
FROM sakila.film
WHERE rating IN ('PG', 'G', 'NC-17', 'PG-13', 'R')
GROUP BY rating
HAVING AVG(length)>120;

#8. Create a standard using condtions based on the lenght of the movie that have no null or 0 and is ordered by shortest to longest movie. 
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
