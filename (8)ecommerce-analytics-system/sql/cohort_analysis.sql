-- 1. Customer Cohort
SELECT strftime('%Y-%m', registration_date) AS cohort_month,
       COUNT(customer_id) AS total_new_customers
FROM customers
GROUP BY cohort_month
ORDER BY cohort_month DESC;

-- 2. Monthly Retention
WITH Cohort AS (
    SELECT strftime('%Y-%m', registration_date) AS cohort_month,
           COUNT(customer_id) AS cohort_size
    FROM customers
    GROUP BY cohort_month
),
CustomerOrders AS (
    SELECT DISTINCT c.customer_id,
           strftime('%Y-%m', c.registration_date) AS cohort_month,
           strftime('%Y-%m', o.order_date) AS order_month
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
),
MonthlyOrders AS (
    SELECT customer_id,
           cohort_month,
           (CAST(SUBSTR(order_month, 1, 4) AS INTEGER) - CAST(SUBSTR(cohort_month, 1, 4) AS INTEGER)) * 12 +
           (CAST(SUBSTR(order_month, 6, 2) AS INTEGER) - CAST(SUBSTR(cohort_month, 6, 2) AS INTEGER)) AS months_since_reg
    FROM CustomerOrders
)
SELECT cs.cohort_month AS Cohort_Month,
       cs.cohort_size AS Cohort_Size,
       COUNT(DISTINCT CASE WHEN mo.months_since_reg = 0 THEN mo.customer_id END) AS Month_0_Active,
       COUNT(DISTINCT CASE WHEN mo.months_since_reg = 1 THEN mo.customer_id END) AS Month_1_Active,
       COUNT(DISTINCT CASE WHEN mo.months_since_reg = 2 THEN mo.customer_id END) AS Month_2_Active,
       ROUND(CAST(COUNT(DISTINCT CASE WHEN mo.months_since_reg = 1 THEN mo.customer_id END) AS FLOAT) / cs.cohort_size * 100, 2) AS Month_1_Retention_Pct
FROM Cohort cs
LEFT JOIN MonthlyOrders mo ON cs.cohort_month = mo.cohort_month
GROUP BY cs.cohort_month, cs.cohort_size
ORDER BY cs.cohort_month DESC;

-- 3. Repeat Customers
SELECT c.customer_id,
       c.customer_name,
       COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING total_orders > 1
ORDER BY total_orders DESC;

-- 4. Churned Customers
WITH CustomerLastOrder AS (
    SELECT customer_id,
           MAX(DATE(order_date)) AS last_order_date
    FROM orders
    GROUP BY customer_id
),
SystemMaxDate AS (
    SELECT MAX(DATE(order_date)) AS max_date FROM orders
)
SELECT c.customer_id,
       c.customer_name,
       clo.last_order_date,
       (JULIANDAY(smd.max_date) - JULIANDAY(clo.last_order_date)) AS days_inactive
FROM customers c
JOIN CustomerLastOrder clo ON c.customer_id = clo.customer_id
CROSS JOIN SystemMaxDate smd
WHERE days_inactive > 60
ORDER BY days_inactive DESC;
