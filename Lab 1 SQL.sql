# 1. Use sakila database.
USE sakila;
# 2.Get all data from actor, film and customer
SELECT * FROM actor;
SELECT * FROM film;
SELECT * FROM customer;
# 3. get film titles
SELECT title FROM film;
# 4. get unique list of film languages
SELECT * FROM language;
# 5.1 Find out how many stores does the company have?
SELECT COUNT(store_id) FROM store;
# 5.2 Find out how many employees staff does the company have?
SELECT * FROM staff WHERE staff_id;
# 5.3 Return a list of employee first names only?
SELECT first_name FROM staff; 
