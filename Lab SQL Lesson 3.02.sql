use sakila;
#1. How many copies of the film Hunchback Impossible exist in the inventory system?
SELECT * from film;
SELECT * FROM inventory;
SELECT * FROM rental; 

SELECT COUNT(inventory_id) FROM inventory
WHERE film_id IN (
SELECT film_id from film
WHERE title LIKE '%Hunchback Impossible%');

#2. List all films whose length is longer than the average of all the films.
SELECT * from film;

SELECT title, length
FROM film
WHERE length > (SELECT AVG(length) FROM film);

#3.Use subqueries to display all actors who appear in the film Alone Trip.
SELECT * from film_actor;
SELECT * from film;
SELECT * from actor;

SELECT actor_id from film_actor  # concise code
WHERE film_id IN (
SELECT film_id from film
WHERE title LIKE '%Alone Trip%');

SELECT actor.first_name, actor.last_name   # joining table to show the actor name
FROM actor
JOIN (
    SELECT film_id
    FROM film
    WHERE title = 'Alone Trip'
) AS film_info ON actor.actor_id IN (
    SELECT actor_id
    FROM film_actor
    WHERE film_actor.film_id = film_info.film_id
);

#4.Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as family films.
SELECT * from film;

SELECT film.title
FROM film
JOIN (
    SELECT category_id
    FROM category
    WHERE name = 'Family'
) AS family_category ON film.film_id IN (
    SELECT film_id
    FROM film_category
    WHERE film_category.category_id = family_category.category_id
);

# Alternatively, we can use the G -- "General Audience - All Ages Admitted":  to get a broader selection.
select title from film
where rating = 'g';

#5.Get name and email from customers from Canada using subqueries. Do the same with joins. Note that to create a join, you will have to identify 
# the correct tables with their primary keys and foreign keys, that will help you get the relevant information.
SELECT * from customer;
select * from country;
select * from address;
select * from city;

SELECT first_name, last_name, email   # using subquery
FROM customer 
WHERE address_id IN (
select address_id from address
WHERE address_id IN(
select city_id from city
where country_id IN (
select country_id from country
where country = 'Canada'))); 

SELECT customer.first_name, customer.last_name, customer.email   # using JOIN
FROM customer 
JOIN address 
ON customer.address_id = address.address_id 
JOIN city 
ON address.city_id = city.city_id 
JOIN country 
ON city.country_id = country.country_id 
WHERE country.country = 'Canada';


#6.Which are films starred by the most prolific actor? Most prolific actor is defined as the actor that has acted in the most number of films. 
# First you will have to find the most prolific actor and then use that actor_id to find the different films that he/she starred.
select * from actor;
select * from film_actor;
select * from film;

select title from film
where film_id IN(
select film_id from film_actor
where actor_id in (
select actor_id from film_actor
where actor_id = (
select COUNT(actor_id) from film_actor
group by film_id
ORDER by COUNT(actor_id) DESC
limit 1)));

#7. Films rented by most profitable customer. You can use the customer table and payment table to find the most 
# profitable customer ie the customer that has made the largest sum of payments.
select * from payment;
select * from customer;
select * from rental;
SELECT * from film;
select * from inventory;

select title from film
where film_id in(
select film_id from inventory
where inventory_id IN (
select inventory_id from rental
where customer_id IN (
SELECT customer_id
FROM payment
GROUP BY customer_id
HAVING SUM(amount) = (SELECT MAX(sum_amount) 
                      FROM (SELECT SUM(amount) as sum_amount
                            FROM payment
                            GROUP BY customer_id) sub1))));

#8.Customers who spent more than the average payments.
select * from payment;
select * from customer;

SELECT customer.first_name, customer.last_name, SUM(payment.amount) as total_payments 
FROM customer
JOIN payment 
ON customer.customer_id = payment.customer_id 
WHERE payment.amount > (   SELECT AVG(amount)   FROM payment ) GROUP BY customer.customer_id
order by total_payments DESC;
