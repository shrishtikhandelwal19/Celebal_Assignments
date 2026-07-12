-- 1. Total revenue per customer
SELECT c.customer_id,
       c.customer_name,
       SUM(oi.quantity * oi.unit_price * (1.0 - oi.discount_percent / 100.0)) AS total_revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_revenue DESC;

-- 2. Total revenue per category
SELECT p.category,
       SUM(oi.quantity * oi.unit_price * (1.0 - oi.discount_percent / 100.0)) AS total_revenue
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;

-- 3. Total revenue per month
SELECT strftime('%Y-%m', o.order_date) AS order_month,
       SUM(oi.quantity * oi.unit_price * (1.0 - oi.discount_percent / 100.0)) AS total_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY order_month
ORDER BY order_month DESC;

-- 4. Top products by quantity sold
SELECT p.product_id,
       p.product_name,
       SUM(oi.quantity) AS total_qty
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_qty DESC
LIMIT 10;

-- 5. Top products by revenue
SELECT p.product_id,
       p.product_name,
       SUM(oi.quantity * oi.unit_price * (1.0 - oi.discount_percent / 100.0)) AS total_revenue
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_revenue DESC
LIMIT 10;

-- 6. Average Order Value (AOV)
SELECT SUM(quantity * unit_price * (1.0 - discount_percent / 100.0)) / COUNT(DISTINCT order_id) AS average_order_value
FROM order_items;
