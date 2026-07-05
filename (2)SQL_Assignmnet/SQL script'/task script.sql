SHOW DATABASES;
CREATE DATABASE customers;
CREATE DATABASE products;
CREATE DATABASE orders;

CREATE TABLE customers ( 
    customer_id   INT           PRIMARY KEY, 
    first_name    VARCHAR(50)   NOT NULL, 
    last_name     VARCHAR(50)   NOT NULL, 
    email         VARCHAR(100)  UNIQUE NOT NULL, 
    city          VARCHAR(50)   NOT NULL, 
    state         VARCHAR(50)   NOT NULL, 
    join_date     DATE          NOT NULL, 
    is_premium    BOOLEAN       DEFAULT FALSE 
); 

CREATE TABLE products ( 
    product_id    INT           PRIMARY KEY, 
    product_name  VARCHAR(100)  NOT NULL, 
    category      VARCHAR(50)   NOT NULL, 
    brand         VARCHAR(50)   NOT NULL, 
    unit_price    DECIMAL(10,2) NOT NULL  CHECK (unit_price > 0), 
    stock_qty     INT           NOT NULL  DEFAULT 0  CHECK (stock_qty >= 0) 
);

CREATE TABLE orders ( 
    order_id      INT           PRIMARY KEY, 
    customer_id   INT           NOT NULL, 
    order_date    DATE          NOT NULL, 
    status        VARCHAR(20)   NOT NULL  DEFAULT 'Pending' 
                  CHECK (status IN ('Pending','Shipped','Delivered','Cancelled')), 
    total_amount  DECIMAL(12,2) NOT NULL  CHECK (total_amount >= 0), 
     
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) 
);

CREATE TABLE order_items ( 
    item_id       INT           PRIMARY KEY, 
    order_id      INT           NOT NULL, 
    product_id    INT           NOT NULL, 
    quantity      INT           NOT NULL  CHECK (quantity > 0), 
    unit_price    DECIMAL(10,2) NOT NULL  CHECK (unit_price > 0), 
    discount_pct  DECIMAL(5,2)  NOT NULL  DEFAULT 0  CHECK (discount_pct >= 0 AND discount_pct <= 100), 
     
    FOREIGN KEY (order_id) REFERENCES orders(order_id), 
    FOREIGN KEY (product_id) REFERENCES products(product_id) 
);

-- ========== CREATE INDEX ========== 
CREATE INDEX idx_orders_date ON orders(order_date);

-- ========== INSERT: customers ========== 
INSERT INTO customers VALUES 
(101, 'Aarav',  'Sharma', 'aarav.s@email.com',  'Mumbai',    'Maharashtra', '2024-01-15', TRUE), 
(102, 'Priya',  'Patel',  'priya.p@email.com',  'Ahmedabad', 'Gujarat',     '2024-02-20', FALSE), 
(103, 'Rohan',  'Gupta',  'rohan.g@email.com',  'Delhi',     'Delhi',       '2024-03-10', TRUE), 
(104, 'Sneha',  'Reddy',  'sneha.r@email.com',  'Hyderabad', 'Telangana',   '2024-04-05', FALSE), 
(105, 'Vikram', 'Singh',  'vikram.s@email.com', 'Jaipur',    'Rajasthan',   '2024-05-12', TRUE), 
(106, 'Ananya', 'Iyer',   'ananya.i@email.com', 'Chennai',   'Tamil Nadu',  '2024-06-18', FALSE), 
(107, 'Karan',  'Mehta',  'karan.m@email.com',  'Pune',      'Maharashtra', '2024-07-22', TRUE), 
(108, 'Divya',  'Nair',   'divya.n@email.com',  'Kochi',     'Kerala',      '2024-08-30', FALSE); 

-- ========== INSERT: products ========== 
INSERT INTO products VALUES 
(201, 'Wireless Earbuds',     'Electronics', 'BoAt',          1499.00, 250), 
(202, 'Cotton T-Shirt',       'Clothing',    'Levis',         799.00,  500), 
(203, 'Smart Watch',          'Electronics', 'Noise',         2999.00, 150), 
(204, 'Running Shoes',        'Clothing',    'Nike',          4599.00, 120), 
(205, 'Bluetooth Speaker',    'Electronics', 'JBL',           3499.00, 200), 
(206, 'Bedsheet Set',         'Home',        'Spaces',        1299.00, 300), 
(207, 'Laptop Stand',         'Electronics', 'AmazonBasics',  899.00,  180), 
(208, 'Cushion Covers (Set)', 'Home',        'HomeCenter',    599.00,  400); 

-- ========== INSERT: orders ========== 
INSERT INTO orders VALUES 
(1001, 101, '2024-08-01', 'Delivered',  4498.00), 
(1002, 102, '2024-08-03', 'Delivered',  799.00), 
(1003, 103, '2024-08-05', 'Shipped',    7498.00), 
(1004, 101, '2024-08-10', 'Delivered',  3499.00), 
(1005, 104, '2024-08-12', 'Cancelled',  2999.00), 
(1006, 105, '2024-08-15', 'Delivered',  5898.00), 
(1007, 106, '2024-08-18', 'Pending',    1299.00), 
(1008, 103, '2024-08-20', 'Delivered',  899.00), 
(1009, 107, '2024-08-25', 'Shipped',    6098.00), 
(1010, 108, '2024-08-28', 'Delivered',  1598.00); 

-- ========== INSERT: order_items ========== 
INSERT INTO order_items VALUES 
(5001, 1001, 201, 2, 1499.00, 0), 
(5002, 1001, 207, 1, 899.00,  10), 
(5003, 1002, 202, 1, 799.00,  0), 
(5004, 1003, 203, 1, 2999.00, 0), 
(5005, 1003, 204, 1, 4599.00, 5), 
(5006, 1004, 205, 1, 3499.00, 0), 
(5007, 1005, 203, 1, 2999.00, 0), 
(5008, 1006, 201, 1, 1499.00, 10), 
(5009, 1006, 204, 1, 4599.00, 5), 
(5010, 1007, 206, 1, 1299.00, 0), 
(5011, 1008, 207, 1, 899.00,  0), 
(5012, 1009, 205, 1, 3499.00, 0), 
(5013, 1009, 208, 2, 599.00,  15), 
(5014, 1010, 206, 1, 1299.00, 0), 
(5015, 1010, 208, 1, 599.00,  0); 

-- Q1. Write a query to display all columns and rows from the customers table.
SELECT * FROM customers;

-- Q2. Retrieve only the first_name, last_name, and city of all customers.
SELECT first_name, last_name, city FROM customers;

-- Q3. List all unique categories available in the products table.
SELECT DISTINCT category FROM products;

-- Q4. Identify the Primary Key of each table in the schema. Explain why a Primary Key must be unique and NOT NULL.

SELECT TABLE_NAME, COLUMN_NAME 
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE 
WHERE CONSTRAINT_NAME = 'PRIMARY' 
AND TABLE_SCHEMA = DATABASE();

-- Q5. What constraints are applied to the email column in the customers table? What would happen if you tried to insert a duplicate email?

-- Explanation:
-- The email column has TWO constraints:
-- 1. UNIQUE - No two customers can have the same email
-- 2. NOT NULL - Every customer must have an email (cannot be empty)

-- WHAT HAPPENS WITH DUPLICATE EMAIL:
-- If you try to insert a customer with an email that already exists,
-- MySQL will show an ERROR: Duplicate entry 'xxx@email.com' for key 'email'
-- The INSERT will FAIL and the row will NOT be added.

-- Q6. Try inserting a product with unit_price = -50. What happens and which constraint prevents it?

-- Explanation:
-- The products table has a CHECK constraint on unit_price:
-- CHECK (unit_price > 0)
-- This means unit_price MUST be greater than 0 (positive number only).
-- Negative prices don't make sense in real business!

-- WHAT HAPPENS WHEN YOU TRY:
-- INSERT INTO products VALUES (209, 'BadProduct', 'Electronics', 'BadBrand', -50.00, 10);
-- ERROR: Check constraint 'products_chk_1' is violated
-- The INSERT FAILS and the row is NOT added.

-- THE CONSTRAINT PREVENTING IT:
-- The CHECK constraint (unit_price > 0) prevents insertion of negative or zero prices.
-- This is data validation at the database level - very important!

-- Q7. Retrieve all orders with status = 'Delivered'.
SELECT * FROM orders 
WHERE status = 'Delivered';

-- Q8. Find all products in the 'Electronics' category with a unit_price greater than 2000.
SELECT * FROM products 
WHERE category = 'Electronics' AND unit_price > 2000;

-- Q9. List all customers who joined in the year 2024 and belong to the state 'Maharashtra'.
SELECT * FROM customers 
WHERE YEAR(join_date) = 2024 AND state = 'Maharashtra';

-- Q10. Find all orders placed between '2024-08-10' and '2024-08-25' (inclusive) that are NOT cancelled.
SELECT * FROM orders 
WHERE order_date BETWEEN '2024-08-10' AND '2024-08-25' 
AND status != 'Cancelled';

-- Q11. Explain what the index idx_orders_date does. How would it improve the performance of a query that filters orders by order_date? Write a sample query that would benefit from this index.

-- Explanation:
-- An INDEX is like a book's table of contents.
-- Instead of reading every page (row) to find information,
-- the database can look up the index and jump directly to the pages (rows) it needs.

-- WHAT idx_orders_date DOES:
-- CREATE INDEX idx_orders_date ON orders(order_date);
-- This creates an index on the order_date column of the orders table.
-- The database sorts all order_dates and remembers which order_id has each date.

-- HOW IT IMPROVES PERFORMANCE:
-- Without index: Database scans ALL 10 orders to find those on 2024-08-15 (SLOW)
-- With index: Database looks up 2024-08-15 in the index and jumps to it (FAST)
-- This is especially important with MILLIONS of rows!

-- QUERY THAT BENEFITS FROM THIS INDEX:
SELECT * FROM orders 
WHERE order_date = '2024-08-15';

-- Or with range:
SELECT * FROM orders 
WHERE order_date BETWEEN '2024-08-10' AND '2024-08-20';

-- Q12. If you run: SELECT * FROM customers WHERE YEAR(join_date) = 2024;
-- Would the index on join_date be used? Explain why or why not, and rewrite the query to be index-friendly (SARGable).

-- Explanation:
-- SARGABLE = "Search ARGument ABLE" - can use an index

-- ORIGINAL QUERY (NOT INDEX-FRIENDLY):
-- SELECT * FROM customers WHERE YEAR(join_date) = 2024;
-- This would NOT use the index because YEAR() is a function.
-- The database has to:
-- 1. Read every join_date value
-- 2. Apply YEAR() function to it
-- 3. Compare with 2024
-- The index cannot help with this function because the index stores actual dates, not years.

-- INDEX-FRIENDLY QUERY (SARGABLE):
SELECT * FROM customers 
WHERE join_date >= '2024-01-01' AND join_date <= '2024-12-31';

-- Q13. Count the total number of orders in the orders table.
SELECT COUNT(*) AS total_orders 
FROM orders;

-- Q14. Find the total revenue (SUM of total_amount) from all Delivered orders.
SELECT SUM(total_amount) AS total_revenue 
FROM orders 
WHERE status = 'Delivered';

-- Q15. Calculate the average unit_price of products in each category.
SELECT category, AVG(unit_price) AS avg_price 
FROM products 
GROUP BY category;

-- Q16. For each order status, find the count of orders and the total revenue. Sort the result by total revenue in descending order.
SELECT status, COUNT(*) AS order_count, SUM(total_amount) AS total_revenue 
FROM orders 
GROUP BY status 
ORDER BY total_revenue DESC;

-- Q17. Find the most expensive (MAX) and cheapest (MIN) product in each category.
SELECT category, 
       MAX(unit_price) AS most_expensive, 
       MIN(unit_price) AS cheapest 
FROM products 
GROUP BY category;

-- Q18. List all product categories where the average unit_price is greater than 2000. Use HAVING.
SELECT category, AVG(unit_price) AS avg_price 
FROM products 
GROUP BY category 
HAVING AVG(unit_price) > 2000;

-- Q19. Write an INNER JOIN query to display each order along with the customer's first_name and last_name. Show: order_id, order_date, first_name, last_name, total_amount.
SELECT o.order_id, o.order_date, c.first_name, c.last_name, o.total_amount 
FROM orders o 
INNER JOIN customers c 
ON o.customer_id = c.customer_id;

-- Q20. Using a LEFT JOIN, list ALL customers and their orders (if any). Customers with no orders should still appear with NULL values for order columns.
SELECT c.customer_id, c.first_name, c.last_name, o.order_id, o.order_date, o.total_amount 
FROM customers c 
LEFT JOIN orders o 
ON c.customer_id = o.customer_id 
ORDER BY c.customer_id;

-- Q21. Write a query using JOINs across three tables (orders → order_items → products) to show: order_id, product_name, quantity, unit_price, and discount_pct for each order item.
SELECT o.order_id, p.product_name, oi.quantity, oi.unit_price, oi.discount_pct 
FROM orders o 
INNER JOIN order_items oi 
ON o.order_id = oi.order_id 
INNER JOIN products p 
ON oi.product_id = p.product_id;

-- Q22. Explain the difference between LEFT JOIN and RIGHT JOIN with an example from this schema. When would you use a FULL OUTER JOIN?

-- Explanation:

-- LEFT JOIN:
-- Returns ALL rows from the LEFT table, plus matching rows from the RIGHT table.
-- Unmatched rows from the right table are excluded.
-- Example:
SELECT c.customer_id, c.first_name, o.order_id 
FROM customers c 
LEFT JOIN orders o 
ON c.customer_id = o.customer_id;

-- RIGHT JOIN:
-- Returns ALL rows from the RIGHT table, plus matching rows from the LEFT table.
-- Unmatched rows from the left table are excluded.
-- Example:
SELECT c.customer_id, c.first_name, o.order_id 
FROM customers c 
RIGHT JOIN orders o 
ON c.customer_id = o.customer_id;

-- FULL OUTER JOIN:
-- Returns ALL rows from BOTH tables, with NULLs where no match exists.
-- Useful when you want to see unmatched rows from both sides.
-- Example (showing all customers and all orders, matched where possible):
-- SELECT c.customer_id, c.first_name, o.order_id 
-- FROM customers c 
-- FULL OUTER JOIN orders o 
-- ON c.customer_id = o.customer_id;
--  MySQL doesn't support FULL OUTER JOIN directly, but you can simulate it with UNION.

-- Q23. Identify all Foreign Key relationships in the schema. Explain what would happen if you tried to insert an order with customer_id = 999 that does not exist in customers.

-- Explanation:

-- FOREIGN KEY RELATIONSHIPS IN THE SCHEMA:
-- 1. orders.customer_id → customers.customer_id
--    (Each order must belong to an existing customer)
-- 2. order_items.order_id → orders.order_id
--    (Each item must belong to an existing order)
-- 3. order_items.product_id → products.product_id
--    (Each item must refer to an existing product)

-- WHAT HAPPENS IF YOU TRY TO INSERT AN ORDER WITH CUSTOMER_ID = 999:
-- INSERT INTO orders VALUES (1011, 999, '2024-08-30', 'Pending', 1500.00);
-- ERROR: Cannot add or update a child row: a foreign key constraint fails
-- The INSERT will FAIL because customer_id 999 does not exist in the customers table.
-- This is good! It prevents invalid data from entering the database.

-- TO FIX:
-- You must first create a customer with customer_id = 999:
INSERT INTO customers VALUES 
(999, 'John', 'Doe', 'john.doe@email.com', 'Mumbai', 'Maharashtra', '2024-09-01', FALSE);
-- Then you can insert the order.

-- Q24. Write a query using CASE to classify products into price tiers: Budget (< 1500), Mid-Range (1500-3000), Premium (> 3000). Display: product_name, unit_price, price_tier.
SELECT product_name, unit_price, 
       CASE 
           WHEN unit_price < 1500 THEN 'Budget'
           WHEN unit_price >= 1500 AND unit_price <= 3000 THEN 'Mid-Range'
           WHEN unit_price > 3000 THEN 'Premium'
       END AS price_tier
FROM products;

-- Q25. Using a CASE statement inside an aggregate function, count how many orders are Delivered vs Not Delivered (all other statuses). Display the result in a single row.
SELECT 
    SUM(CASE WHEN status = 'Delivered' THEN 1 ELSE 0 END) AS delivered_count,
    SUM(CASE WHEN status != 'Delivered' THEN 1 ELSE 0 END) AS not_delivered_count
FROM orders;

-- Q26. Explain each ACID property: Atomicity, Consistency, Isolation, Durability. Use a simple bank transfer example.

-- Explanation ():

-- ACID properties ensure database reliability.
-- Example: Transfer $1000 from Account A to Account B

-- 1. ATOMICITY (All or Nothing):
--    Either the entire transaction completes, or none of it does.
--    In the transfer:
--    - Deduct $1000 from Account A
--    - Add $1000 to Account B
--    Both must happen. If something fails mid-transfer, ROLLBACK both.
--    We never want Account A debited but Account B not credited!

-- 2. CONSISTENCY (Valid State to Valid State):
--    The database always moves from one valid state to another.
--    Before: Account A has $5000, Account B has $3000, Total = $8000
--    After: Account A has $4000, Account B has $4000, Total = $8000
--    The total money is conserved! Rules are never broken.

-- 3. ISOLATION (Parallel Independence):
--    Concurrent transactions don't interfere with each other.
--    If Person X transfers to Account A while Person Y transfers FROM Account A,
--    they don't see inconsistent intermediate states.
--    Each transaction works independently, avoiding race conditions.

-- 4. DURABILITY (Permanent Save):
--    Once a transaction is committed, it's saved forever.
--    Even if the server crashes immediately after COMMIT,
--    the data is safely stored and will be there when the server restarts.
--    COMMIT = "promise the data will survive"

-- Q27. Write a complete SQL transaction that:
-- 1. Inserts a new order (order_id = 1011, customer_id = 102, today's date, 'Pending', 1598.00)
-- 2. Inserts two order items for that order
-- 3. Updates stock_qty of purchased products
-- 4. Uses COMMIT if all steps succeed
-- 5. Uses ROLLBACK if any step fails

-- COMPLETE TRANSACTION BLOCK:

START TRANSACTION;

-- Step 1: Insert a new order
INSERT INTO orders (order_id, customer_id, order_date, status, total_amount) 
VALUES (1011, 102, CURDATE(), 'Pending', 1598.00);

-- Step 2: Insert first order item (Laptop Stand, quantity 1)
INSERT INTO order_items (item_id, order_id, product_id, quantity, unit_price, discount_pct) 
VALUES (5016, 1011, 207, 1, 899.00, 0);

-- Step 2: Insert second order item (Cushion Covers, quantity 1)
INSERT INTO order_items (item_id, order_id, product_id, quantity, unit_price, discount_pct) 
VALUES (5017, 1011, 208, 1, 599.00, 10);

-- Step 3: Update stock for Laptop Stand (product_id 207): reduce by 1
UPDATE products 
SET stock_qty = stock_qty - 1 
WHERE product_id = 207;

-- Step 4: Update stock for Cushion Covers (product_id 208): reduce by 1
UPDATE products 
SET stock_qty = stock_qty - 1 
WHERE product_id = 208;

-- If we reach here, all operations succeeded
COMMIT;

-- IF ANY ERROR OCCURRED, YOU WOULD DO:
-- ROLLBACK;
