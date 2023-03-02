USE sakila;
SELECT * FROM film_category;
SELECT * FROM film;
SELECT * FROM category;

#1. 
SELECT category_id, COUNT(fc.film_id)
FROM film f
JOIN film_category fc
USING (film_id)
GROUP BY category_id;

#2. 
SELECT * FROM payment;
SELECT * FROM staff;

SELECT s.staff_id, COUNT(s.staff_id), SUM(p.amount)
FROM sakila.payment p
JOIN sakila.staff s
USING (staff_id)
WHERE p.payment_date >= '2005-08-01' AND p.payment_date <= '2005-08-31'
GROUP BY s.staff_id;

#3.
SELECT * FROM film;
SELECT * FROM film_actor;

SELECT f.film_id
FROM film f
JOIN film_actor fa
USING (film_id);
GROUP BY film_id;

SELECT film_actor.actor_id,count(film_actor.film_id) as film_count
from film_actor
join film
on film.film_id=film_actor.film_id
group by film_actor.actor_id;

#4.
SELECT * FROM customer;
SELECT * FROM rental;

SELECT customer_id, COUNT(customer_id), concat(c.first_name, ' ',c.last_name) as customer_name
FROM customer c
JOIN rental 
USING (customer_id)
GROUP BY customer_id;

#5. 
SELECT * FROM staff;
SELECT * FROM address;  #the staff has address_id 3 and 4 

SELECT CONCAT(s.first_name, ' ', s.last_name) AS 'Staff Name', address_id, a.address 
FROM staff s
JOIN address a
USING (address_id);

#6.
SELECT * FROM film_actor;
SELECT * FROM film;

SELECT f.film_id AS Film, COUNT(fa.actor_id) AS 'Number of actors', f.title AS Title
FROM film f
JOIN film_actor fa
USING (film_id)
GROUP BY film_id;

#7.
SELECT * FROM payment;
SELECT * FROM customer;

SELECT customer_id, SUM(p.amount) AS 'Total Amount Paid', c.last_name AS 'Family Name'
FROM payment p
JOIN customer c
USING (customer_id)
GROUP BY customer_id;

#8.
SELECT * FROM film_category;
SELECT * FROM film;
SELECT * FROM category;

SELECT category_id, COUNT(f.film_id) AS 'Films per Category', c.name as 'Category Type'
FROM film_category fa
LEFT JOIN film f
USING (film_id)
LEFT JOIN category c
USING (category_id)
GROUP BY category_id
ORDER BY COUNT(f.film_id) DESC;

