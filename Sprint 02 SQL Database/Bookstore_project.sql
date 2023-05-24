-- SQL Project: Built database bookstore
-- Create 5 table
-- Table 1
drop table books_order;

CREATE table books_order (
  book_id INT UNIQUE ,
  book_name TEXT,
  genres_id TEXT,
  price real
);

INSERT INTO books_order VALUES 
	(1, 'Dragonballz', 1, 45),
  (2, 'onepice', 1, 45),
  (3, 'mario', 2, 80),
  (4, 'chelsea', 3, 100),
  (5, 'liverpool', 3, 100);

-- Table 2
drop table customers;

CREATE table customers (
  cus_id INT UNIQUE,
  cus_name TEXT
);

INSERT INTO customers VALUES 
	(1, 'boss'),
  (2, 'wan'),
  (3, 'mos'),
  (4, 'tammy');

-- Table 3
drop table book_bill;

CREATE table book_bill (
  bill_id INT UNIQUE,
  cus_id INT,
  book_id INT
);

INSERT INTO book_bill VALUES 
	(1, 1, 1),
  (2, 1, 2),
  (3, 2, 1),
  (4, 2, 4),
  (5, 3, 3),
  (6, 4, 4);

-- Table 4
drop table rating;

CREATE table rating (
  cus_id INT UNIQUE,
  score real
);

INSERT INTO rating VALUES 
	(1, 4.5),
  (2, 4.8),
  (3, 3.6),
  (4, 3.0);

-- Table 5
drop table genres;

CREATE table genres (
  genres_id INT UNIQUE,
  genres_name TEXT
);

INSERT INTO genres VALUES 
	(1, 'anime'),
  (2, 'game'),
  (3, 'Spot');

-- Query
-- Q1
SELECT 
books_order.book_name,
genres.genres_name
FROM books_order
JOIN genres on genres.genres_id = books_order.genres_id
ORDER BY genres.genres_name;

-- Q2
SELECT 
		customers.cus_name,
    SUM(books_order.price*(1-0.2))   AS total_price
FROM customers  
JOIN book_bill ON customers.cus_id = book_bill.cus_id
JOIN books_order ON books_order.book_id = book_bill.book_id
JOIN rating ON customers.cus_id = rating.cus_id
GROUP BY customers.cus_name
HAVING rating.score > 4.0;

-- Q3
SELECT
customers.cus_name,
books_order.book_name,
books_order.price
FROM customers
JOIN book_bill ON customers.cus_id = book_bill.cus_id
JOIN books_order ON books_order.book_id = book_bill.book_id;

-- Q4
SELECT 
		customers.cus_name,
    SUM(books_order.price)   AS total_price
FROM customers  
JOIN book_bill ON customers.cus_id = book_bill.cus_id
JOIN books_order ON books_order.book_id = book_bill.book_id
GROUP BY customers.cus_name;

-- Q5
WITH sub AS(
SELECT
  customers.cus_name,
  books_order.price,
  customers.cus_id,
  SUM(books_order.price)   AS total_price
FROM customers  
JOIN book_bill ON customers.cus_id = book_bill.cus_id
JOIN books_order ON books_order.book_id = book_bill.book_id
GROUP BY customers.cus_name
 )
 
 SELECT *,CASE
		WHEN total_price < 60 THEN total_price*(1-0.1)
		WHEN total_price <= 100 THEN total_price*(1-0.2)
	ELSE total_price*(1-0.3)
	END AS label_discount
FROM(
SELECT
  sub.cus_name,
  rating.score,
  SUM(sub.total_price)   AS total_price
FROM rating
JOIN sub ON rating.cus_id = sub.cus_id
GROUP BY sub.cus_name
);
