-- 1. Purchase Frequency
SELECT c.customer_id,
       c.customer_name,
       COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_orders DESC;

-- 2. Customer Type Segmentation
WITH OrderCounts AS (
    SELECT c.customer_id,
           c.customer_name,
           COUNT(o.order_id) AS order_count
    FROM customers c
    LEFT JOIN orders o ON c.customer_id = o.customer_id
    GROUP BY c.customer_id, c.customer_name
)
SELECT customer_id,
       customer_name,
       order_count,
       CASE 
           WHEN order_count = 1 THEN 'One-time Customer'
           WHEN order_count BETWEEN 2 AND 3 THEN 'Occasional Customer'
           WHEN order_count > 3 THEN 'Loyal Customer'
           ELSE 'No Orders Placed'
       END AS customer_loyalty_segment
FROM OrderCounts
ORDER BY order_count DESC;

-- 3. Spend Tier Segmentation
WITH CustomerSpend AS (
    SELECT c.customer_id,
           c.customer_name,
           COALESCE(SUM(oi.quantity * oi.unit_price * (1.0 - oi.discount_percent / 100.0)), 0) AS total_spend
    FROM customers c
    LEFT JOIN orders o ON c.customer_id = o.customer_id
    LEFT JOIN order_items oi ON o.order_id = oi.order_id
    GROUP BY c.customer_id, c.customer_name
)
SELECT customer_id,
       customer_name,
       total_spend,
       CASE 
           WHEN total_spend < 1000 THEN 'Low Spend'
           WHEN total_spend BETWEEN 1000 AND 5000 THEN 'Medium Spend'
           ELSE 'High Spend'
       END AS spend_tier
FROM CustomerSpend
ORDER BY total_spend DESC;

-- 4. RFM Analysis
WITH MaxDate AS (
    SELECT MAX(DATE(order_date)) AS max_date FROM orders
),
RFM AS (
    SELECT c.customer_id,
           c.customer_name,
           MIN(JULIANDAY((SELECT max_date FROM MaxDate)) - JULIANDAY(DATE(o.order_date))) AS recency,
           COUNT(DISTINCT o.order_id) AS frequency,
           COALESCE(SUM(oi.quantity * oi.unit_price * (1.0 - oi.discount_percent / 100.0)), 0) AS monetary
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_items oi ON o.order_id = oi.order_id
    GROUP BY c.customer_id, c.customer_name
)
SELECT customer_id,
       customer_name,
       ROUND(recency, 0) AS recency_days,
       frequency AS frequency_orders,
       ROUND(monetary, 2) AS monetary_value
FROM RFM
ORDER BY monetary_value DESC;
