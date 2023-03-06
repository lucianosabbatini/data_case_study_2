use sakila;

#1.Drop column picture from staff.
select * from staff;
ALTER table staff
DROP COLUMN picture;

#2. A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
select * from customer;
select * from address;
SELECT * from staff;

INSERT INTO staff (first_name, last_name, address_id, email, store_id, username, password)
SELECT 'Tammy', 'Sanders', address_id, 'TAMMY.SANDERS@sakilacustomer.org', 2, 'tammy.sanders', 'password123'
FROM customer
WHERE address_id = 79;

#3.
SELECT title, film_id from film
where title like '%academy%';  # film_id = 1

select customer_id from customer
where first_name='charlotte' and last_name='hunter';  # inventory_id = 130

insert into rental (rental_date, inventory_id, customer_id, return_date, staff_id, last_update)
values
('2005-08-23 22:50:12', 1, 130, '2005-08-30 01:01:12', 1, '2006-02-15 21:30:53'); 