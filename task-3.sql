-- Практична робота 3. Агрегаційні функції
-- 1. Total number of films in each category
SELECT category.name AS category_name, COUNT(film.film_id) AS total_films
FROM category
JOIN film_category ON category.category_id = film_category.category_id
JOIN film ON film_category.film_id = film.film_id
GROUP BY category.name;

-- 2. Average film duration in each category
SELECT category.name AS category_name, AVG(film.length) AS avg_length
FROM category
JOIN film_category ON category.category_id = film_category.category_id
JOIN film ON film_category.film_id = film.film_id
GROUP BY category.name;

-- 3. Minimum and maximum film duration
SELECT MIN(length) AS min_duration, MAX(length) AS max_duration
FROM film;

-- 4. Total number of customers
SELECT COUNT(customer_id) AS total_customers
FROM customer;

-- 5. Total payment amount by each customer
SELECT customer.first_name || ' ' || customer.last_name AS customer_name, SUM(payment.amount) AS total_payments
FROM customer
JOIN payment ON customer.customer_id = payment.customer_id
GROUP BY customer.first_name, customer.last_name;

-- 6. Top 5 customers with the highest total payment amount
SELECT customer.first_name || ' ' || customer.last_name AS customer_name, SUM(payment.amount) AS total_payments
FROM customer
JOIN payment ON customer.customer_id = payment.customer_id
GROUP BY customer.first_name, customer.last_name
ORDER BY total_payments DESC
LIMIT 5;

-- 7. Total number of films rented by each customer
SELECT customer.first_name || ' ' || customer.last_name AS customer_name, COUNT(rental.rental_id) AS total_rentals
FROM customer
JOIN rental ON customer.customer_id = rental.customer_id
GROUP BY customer.first_name, customer.last_name;

-- 8. Average age of films
SELECT AVG(EXTRACT(YEAR FROM AGE(NOW(), release_year))) AS avg_age
FROM film;

-- 9. Number of films rented in a specific period
SELECT COUNT(rental.rental_id) AS total_rentals
FROM rental
WHERE rental_date BETWEEN '2023-01-01' AND '2023-12-31';

-- 10. Total payment per month
SELECT DATE_TRUNC('month', payment_date) AS month, SUM(amount) AS total_payments
FROM payment
GROUP BY DATE_TRUNC('month', payment_date)
ORDER BY month;

-- 11. Maximum payment made by each customer
SELECT customer.first_name || ' ' || customer.last_name AS customer_name, MAX(payment.amount) AS max_payment
FROM customer
JOIN payment ON customer.customer_id = payment.customer_id
GROUP BY customer.first_name, customer.last_name;

-- 12. Average payment amount per customer
SELECT customer.first_name || ' ' || customer.last_name AS customer_name, AVG(payment.amount) AS avg_payment
FROM customer
JOIN payment ON customer.customer_id = payment.customer_id
GROUP BY customer.first_name, customer.last_name;

-- 13. Number of films by rating
SELECT rating, COUNT(film_id) AS total_films
FROM film
GROUP BY rating;

-- 14. Average payment amount by store
SELECT store.store_id, AVG(payment.amount) AS avg_payment
FROM store
JOIN staff ON store.store_id = staff.store_id
JOIN payment ON staff.staff_id = payment.staff_id
GROUP BY store.store_id;
