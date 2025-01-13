
-- 1. Display All Movies
SELECT title FROM film;

-- 2. List All Customers
SELECT first_name, last_name FROM customer;

-- 3. Find All Movies in a Specific Category
SELECT f.title
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
WHERE c.name = 'Comedy';

-- 4. List All Cities
SELECT city FROM city;

-- 5. Get Total Number of Movies
SELECT COUNT(*) AS total_movies FROM film;

-- 6. Fetch All Stores
SELECT s.store_id, a.address
FROM store s
JOIN address a ON s.address_id = a.address_id;

-- 7. List Movies Released After 2005
SELECT title, release_year
FROM film
WHERE release_year > 2005;

-- 8. Find Customers in a Specific City
SELECT c.first_name, c.last_name
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
WHERE ci.city = 'Paris';

-- 9. Retrieve Inventory for a Movie
SELECT i.inventory_id, f.title
FROM inventory i
JOIN film f ON i.film_id = f.film_id
WHERE f.title = 'Academy Dinosaur';

-- 10. Get Number of Customers
SELECT COUNT(*) AS total_customers FROM customer;
