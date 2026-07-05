SHOW DATABASES;
CREATE DATABASE superstore;
USE superstore;

CREATE TABLE superstore_data (
    row_id INT,
    order_id VARCHAR(50),
    order_date VARCHAR(50),
    ship_date VARCHAR(50),
    ship_mode VARCHAR(100),
    customer_id VARCHAR(50),
    customer_name VARCHAR(150),
    segment VARCHAR(50),
    country VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code VARCHAR(20),
    region VARCHAR(50),
    product_id VARCHAR(50),
    category VARCHAR(100),
    sub_category VARCHAR(100),
    product_name TEXT,
    sales DECIMAL(10,2),
    quantity INT,
    discount DECIMAL(5,2),
    profit DECIMAL(10,2)
);

LOAD DATA LOCAL INFILE 'C:/Users/Lenovo/Desktop/sql practise/Sample - Superstore.csv'
INTO TABLE superstore_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT *
FROM superstore_data
LIMIT 10;

SELECT COUNT(DISTINCT order_id) AS unique_orders
FROM superstore_data;

-- Sales in West Region
SELECT *
FROM superstore_data
WHERE region = 'West';

-- Furniture category
SELECT *
FROM superstore_data
WHERE category = 'Furniture';

-- Sales greater than 500
SELECT *
FROM superstore_data
WHERE sales > 500;

-- Discount greater than 20%
SELECT *
FROM superstore_data
WHERE discount > 0.20;

-- Technology products in East region
SELECT *
FROM superstore_data
WHERE category = 'Technology'
AND region = 'East';

-- Top 5 Categories by Profit
SELECT category,
SUM(profit) AS total_profit
FROM superstore_data
GROUP BY category
ORDER BY total_profit DESC
LIMIT 5;

-- Top Customers by Sales
SELECT customer_name,
SUM(sales) AS total_sales
FROM superstore_data
GROUP BY customer_name
ORDER BY total_sales DESC
LIMIT 10;


-- Total sales by category
SELECT region,
SUM(quantity) AS total_quantity
FROM superstore_data
GROUP BY region;

-- Average profit by region
SELECT region,
AVG(profit) AS avg_profit
FROM superstore_data
GROUP BY region;

-- Monthly Sales Trend
SELECT
MONTH(order_date) AS month_no,
SUM(sales) AS total_sales
FROM superstore_data
GROUP BY MONTH(order_date)
ORDER BY month_no;

-- Monthly Profit Trend
SELECT
MONTH(order_date) AS month_no,
SUM(profit) AS total_profit
FROM superstore_data
GROUP BY MONTH(order_date)
ORDER BY month_no;

-- Top 10 Customers by Profit
SELECT customer_name,
SUM(profit) AS total_profit
FROM superstore_data
GROUP BY customer_name
ORDER BY total_profit DESC
LIMIT 10;

-- Most Sold Products
SELECT product_name,
SUM(quantity) AS quantity_sold
FROM superstore_data
GROUP BY product_name
ORDER BY quantity_sold DESC
LIMIT 10;

-- Region with Highest Sales
SELECT region,
SUM(sales) AS total_sales
FROM superstore_data
GROUP BY region
ORDER BY total_sales DESC
LIMIT 1;

-- State with Highest Profit
SELECT state,
SUM(profit) AS total_profit
FROM superstore_data
GROUP BY state
ORDER BY total_profit DESC
LIMIT 10;

-- Negative Profit Orders
SELECT *
FROM superstore_data
WHERE profit < 0;

-- Zero Sales Records
SELECT *
FROM superstore_data
WHERE sales = 0;

-- Duplicate Customer Names
SELECT customer_name,
COUNT(*) AS occurrences
FROM superstore_data
GROUP BY customer_name
HAVING COUNT(*) > 1;

-- Category Wise Record Count
SELECT category,
COUNT(*) AS total_records
FROM superstore_data
GROUP BY category;

-- Region Wise Record Count
SELECT region,
COUNT(*) AS total_records
FROM superstore_data
GROUP BY region;

SELECT order_date
FROM superstore_data
LIMIT 5;
