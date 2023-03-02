USE sakila;

#1.
SELECT * FROM store;
SELECT * FROM city;
SELECT * FROM address;
SELECT * FROM country;

SELECT store_id as store, city, country
FROM store s
JOIN address a
USING (address_id)
JOIN city ci
USING (city_id)
JOIN country co
USING (country_id); 

#2.
SELECT * FROM payment;
SELECT * FROM staff;
SELECT * FROM store;

SELECT store_id, SUM(p.amount) as 'Total Revenue'
FROM payment p
JOIN staff sta
USING (staff_id)
JOIN store sto
USING (store_id)
GROUP BY store_id;

#3.
SELECT * FROM film;
SELECT * FROM category;
SELECT * FROM film_category;

SELECT name, sec_to_time(AVG(length)*60) as 'Average Lenght per Category'
FROM film f
JOIN film_category fc
USING (film_id)
JOIN category
USING (category_id)
GROUP BY name;

#4.
SELECT * FROM rental;
SELECT * FROM inventory;
SELECT * FROM film;

SELECT film_id, title, COUNT(rental_id) as 'Frequency of Rental'
FROM rental r
JOIN inventory i
USING (inventory_id)
JOIN film f
USING (film_id)
GROUP BY film_id
ORDER BY COUNT(rental_id) DESC;

#5.
SELECT * FROM payment;
SELECT * FROM category;
SELECT * FROM RENTAL;
SELECT * FROM inventory;
SELECT * FROM FILM_category;

SELECT c.name AS Category, SUM(p.amount) AS 'Total Revenue'
FROM payment p
JOIN rental r
USING (rental_id)
JOIN inventory i
USING (inventory_id)
JOIN film_category f
USING (film_id)
JOIN category c
USING (category_id)
GROUP BY c.name
ORDER BY SUM(p.amount) DESC
LIMIT 5;

#6.
SELECT * FROM film;
SELECT * FROM inventory;

SELECT title, store_id
FROM film f
JOIN inventory i
USING (film_id)
WHERE f.title='ACADEMY DINOSAUR' AND i.store_id='1';

#7. 
SELECT * FROM actor;
SELECT * FROM film_actor;

SELECT fa1.actor_id, fa2.actor_id, fa1.film_id, CONCAT(a1.first_name, ' ', a1.last_name) AS 'Actor 1', CONCAT(a2.first_name, ' ', a2.last_name) AS 'Actor 2'
FROM film_actor fa1
JOIN film_actor fa2
JOIN actor a1
ON a1.actor_id=fa1.actor_id
JOIN actor a2
ON a2.actor_id=fa2.actor_id
WHERE fa1.actor_id>fa2.actor_id AND fa1.film_id=fa2.film_id;
