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
SELECT COUNT( DISTINCT staff_id) 
FROM sakila.rental;
GROUP BY staff_id;