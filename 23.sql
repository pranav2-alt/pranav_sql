use sakila;
SELECT first_name, last_name FROM customer;

SELECT COUNT(*) FROM film;

SELECT COUNT(*) FROM rental;

SELECT DISTINCT city FROM city;

SELECT title, release_year FROM film LIMIT 5;

SELECT COUNT(*) FROM store;

SELECT film_id, COUNT(rental_id) AS rental_count  
FROM rental  
GROUP BY film_id  
ORDER BY rental_count DESC  
LIMIT 5;

SELECT email FROM customer  
WHERE address_id IN (  
    SELECT address_id FROM address  
    WHERE city_id IN (  
        SELECT city_id FROM city  
        WHERE country_id IN (  
            SELECT country_id FROM country  
            WHERE country = 'Canada'  
        )  
    )  
);

SELECT title FROM film WHERE rental_duration > 5;

SELECT SUM(amount) FROM payment;
