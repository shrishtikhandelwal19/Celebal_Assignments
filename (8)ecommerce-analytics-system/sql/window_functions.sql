-- 1. Ranking customers using RANK()
WITH CustomerRevenue AS (
    SELECT c.customer_name,
           SUM(oi.quantity * oi.unit_price * (1.0 - oi.discount_percent / 100.0)) AS total_revenue
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_items oi ON o.order_id = oi.order_id
    GROUP BY c.customer_id, c.customer_name
)
SELECT customer_name,
       total_revenue,
       RANK() OVER (ORDER BY total_revenue DESC) AS revenue_rank
FROM CustomerRevenue;

-- 2. Ranking customers using DENSE_RANK()
WITH CustomerRevenue AS (
    SELECT c.customer_name,
           SUM(oi.quantity * oi.unit_price * (1.0 - oi.discount_percent / 100.0)) AS total_revenue
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_items oi ON o.order_id = oi.order_id
    GROUP BY c.customer_id, c.customer_name
)
SELECT customer_name,
       total_revenue,
       DENSE_RANK() OVER (ORDER BY total_revenue DESC) AS dense_revenue_rank
FROM CustomerRevenue;

-- 3. Running Total using SUM() OVER()
WITH DailyRevenue AS (
    SELECT DATE(o.order_date) AS order_day,
           SUM(oi.quantity * oi.unit_price * (1.0 - oi.discount_percent / 100.0)) AS daily_revenue
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    GROUP BY DATE(o.order_date)
)
SELECT order_day,
       daily_revenue,
       SUM(daily_revenue) OVER (ORDER BY order_day) AS running_total_revenue
FROM DailyRevenue;

-- 4. Moving Average using AVG() OVER()
WITH DailyRevenue AS (
    SELECT DATE(o.order_date) AS order_day,
           SUM(oi.quantity * oi.unit_price * (1.0 - oi.discount_percent / 100.0)) AS daily_revenue
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    GROUP BY DATE(o.order_date)
)
SELECT order_day,
       daily_revenue,
       AVG(daily_revenue) OVER (
           ORDER BY order_day 
           ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
       ) AS moving_avg_7_days
FROM DailyRevenue;

-- 5. CTEs for Multi-Step Aggregation
WITH MonthlyRevenue AS (
    SELECT strftime('%Y-%m', o.order_date) AS order_month,
           SUM(oi.quantity * oi.unit_price * (1.0 - oi.discount_percent / 100.0)) AS total_revenue
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    GROUP BY order_month
),
CategorizedMonths AS (
    SELECT order_month,
           total_revenue,
           CASE 
               WHEN total_revenue > 50000 THEN 'High Revenue'
               WHEN total_revenue BETWEEN 20000 AND 50000 THEN 'Medium Revenue'
               ELSE 'Low Revenue'
           END AS revenue_performance
    FROM MonthlyRevenue
)
SELECT * FROM CategorizedMonths
ORDER BY order_month DESC;
