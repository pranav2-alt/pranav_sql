-- Use Sakila database
USE sakila;

-- 1. Find customers who have made at least one rental
SELECT customer_id, first_name, last_name 
FROM customer c
WHERE EXISTS (SELECT 1 FROM rental r WHERE r.customer_id = c.customer_id);

-- 2. Find films that have been rented more than 5 times
SELECT film_id, title 
FROM film f
WHERE (SELECT COUNT(*) FROM inventory i 
       JOIN rental r ON i.inventory_id = r.inventory_id 
       WHERE i.film_id = f.film_id) > 5;

-- 3. Find actors who have acted in more than 10 films
SELECT actor_id, first_name, last_name
FROM actor a
WHERE (SELECT COUNT(*) FROM film_actor fa WHERE fa.actor_id = a.actor_id) > 10;

-- 4. Find customers whose total payment is above the average payment
SELECT customer_id, first_name, last_name 
FROM customer c
WHERE (SELECT SUM(amount) FROM payment p WHERE p.customer_id = c.customer_id) > 
      (SELECT AVG(amount) FROM payment);
