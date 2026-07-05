-- Superstore SQL assignment for MySQL 8.0
SHOW DATABASES;
CREATE DATABASE superstore_raw;
USE superstore_raw;
DROP TABLE IF EXISTS superstore_raw;
CREATE TABLE superstore_raw (
  row_id INT,
  order_id VARCHAR(20),
  order_date DATE,
  ship_date DATE,
  ship_mode VARCHAR(20),
  customer_id VARCHAR(20),
  customer_name VARCHAR(100),
  segment VARCHAR(50),
  country VARCHAR(50),
  city VARCHAR(50),
  state VARCHAR(50),
  postal_code VARCHAR(20),
  region VARCHAR(20),
  product_id VARCHAR(30),
  category VARCHAR(50),
  sub_category VARCHAR(50),
  product_name VARCHAR(255),
  sales DECIMAL(12,2),
  quantity INT,
  discount DECIMAL(5,2),
  profit DECIMAL(12,2)
);



LOAD DATA LOCAL INFILE 'C:/Users/Lenovo/Desktop/celebal assignment/Superstore_raw.csv'
INTO TABLE superstore_raw
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

DROP TABLE IF EXISTS customers;
CREATE TABLE customers AS
SELECT DISTINCT
  customer_id,
  customer_name,
  segment,
  country,
  city,
  state,
  postal_code,
  region
FROM superstore_raw;

DROP TABLE IF EXISTS products;
CREATE TABLE products AS
SELECT DISTINCT
  product_id,
  category,
  sub_category,
  product_name
FROM superstore_raw;

DROP TABLE IF EXISTS orders;
CREATE TABLE orders AS
SELECT DISTINCT
  order_id,
  order_date,
  ship_date,
  ship_mode,
  customer_id,
  region,
  sales,
  quantity,
  discount,
  profit
FROM superstore_raw;

-- Subquery example: orders above average sales
SELECT order_id,
       customer_id,
       sales
FROM orders
WHERE sales > (
  SELECT AVG(sales)
  FROM orders
);

-- CTE + window function: highest order total per customer
WITH order_totals AS (
  SELECT customer_id,
         order_id,
         SUM(sales) AS order_total
  FROM orders
  GROUP BY customer_id, order_id
)
SELECT customer_id,
       order_id,
       order_total
FROM (
  SELECT customer_id,
         order_id,
         order_total,
         ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_total DESC) AS row_num
  FROM order_totals
) AS ranked_orders
WHERE row_num = 1;

-- CTE: total sales per customer
WITH customer_sales AS (
  SELECT customer_id,
         SUM(sales) AS total_sales,
         SUM(quantity) AS total_quantity,
         SUM(profit) AS total_profit
  FROM orders
  GROUP BY customer_id
)
SELECT customer_id,
       total_sales,
       total_quantity,
       total_profit
FROM customer_sales
ORDER BY total_sales DESC;

-- Simple window function: rank customers by sales
WITH customer_sales AS (
  SELECT customer_id,
         SUM(sales) AS total_sales
  FROM orders
  GROUP BY customer_id
)
SELECT customer_id,
       total_sales,
       RANK() OVER (ORDER BY total_sales DESC) AS sales_rank
FROM customer_sales;

-- Join + CTE + window function: customer sales and rank
WITH customer_sales AS (
  SELECT customer_id,
         SUM(sales) AS total_sales
  FROM orders
  GROUP BY customer_id
)
SELECT c.customer_id,
       c.customer_name,
       cs.total_sales,
       RANK() OVER (ORDER BY cs.total_sales DESC) AS customer_rank
FROM customers c
JOIN customer_sales cs ON c.customer_id = cs.customer_id
ORDER BY customer_rank;

-- Business query: top 10 customers by sales
WITH customer_sales AS (
  SELECT customer_id,
         SUM(sales) AS total_sales
  FROM orders
  GROUP BY customer_id
)
SELECT c.customer_id,
       c.customer_name,
       cs.total_sales
FROM customers c
JOIN customer_sales cs ON c.customer_id = cs.customer_id
ORDER BY cs.total_sales DESC
LIMIT 10;

-- Business query: bottom 10 customers by sales
WITH customer_sales AS (
  SELECT customer_id,
         SUM(sales) AS total_sales
  FROM orders
  GROUP BY customer_id
)
SELECT c.customer_id,
       c.customer_name,
       cs.total_sales
FROM customers c
JOIN customer_sales cs ON c.customer_id = cs.customer_id
ORDER BY cs.total_sales ASC
LIMIT 10;

-- Business query: customers with one order only
SELECT c.customer_id,
       c.customer_name,
       COUNT(DISTINCT o.order_id) AS order_count,
       SUM(o.sales) AS total_sales
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING order_count = 1;

-- Business query: customers above average total sales
WITH customer_sales AS (
  SELECT customer_id,
         SUM(sales) AS total_sales
  FROM orders
  GROUP BY customer_id
)
SELECT c.customer_id,
       c.customer_name,
       cs.total_sales
FROM customers c
JOIN customer_sales cs ON c.customer_id = cs.customer_id
WHERE cs.total_sales > (
  SELECT AVG(total_sales)
  FROM customer_sales
)
ORDER BY cs.total_sales DESC;
