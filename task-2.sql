-- Part 1: Data Retrieval Queries (SELECT)

-- 1. Getting the List of Movies and Their Categories
SELECT 
    m.title AS movie_title, 
    m.duration AS movie_duration, 
    c.category_name AS category
FROM 
    movies AS m
JOIN 
    categories AS c ON m.category_id = c.id;

-- 2. Movies Rented by a Specific Customer
SELECT 
    m.title AS movie_title, 
    r.rental_date AS rental_date
FROM 
    rentals AS r
JOIN 
    movies AS m ON r.movie_id = m.id
JOIN 
    customers AS c ON r.customer_id = c.id
WHERE 
    c.name = 'John Doe';

-- 3. Top 5 Most Popular Movies Based on Rentals
SELECT 
    m.title AS movie_title, 
    COUNT(r.id) AS rental_count
FROM 
    movies AS m
JOIN 
    rentals AS r ON m.id = r.movie_id
GROUP BY 
    m.id
ORDER BY 
    rental_count DESC
LIMIT 5;

-- Part 2: Data Manipulation Queries (INSERT, UPDATE, DELETE)

-- 1. Adding a New Customer
INSERT INTO customers (name, address, city) 
VALUES ('Alice Cooper', '123 Main St', 'San Francisco');

-- 2. Updating the Address of Customer "Alice Cooper"
UPDATE customers 
SET address = '456 Elm St' 
WHERE name = 'Alice Cooper';

-- 3. Deleting Customer "Alice Cooper"
DELETE FROM customers 
WHERE name = 'Alice Cooper';
