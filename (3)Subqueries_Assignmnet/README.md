# Assignment 3: SQL Sales Analysis and Customer Ranking

## Objective
The goal of Assignment 3 is to analyze Superstore sales data using advanced SQL techniques. This includes building a normalized schema, using subqueries, CTEs, and window functions to derive customer-level insights and sales rankings.

## Dataset
- `superstore_raw.csv`: Raw Superstore dataset containing order, product, customer, and sales information.
- The dataset is used to construct a normalized database schema and answer business questions related to customer performance.

## Tasks Performed
1. Loaded raw sales data into the `superstore_raw` table.
2. Created normalized tables for:
   - `customers`
   - `products`
   - `orders`
   - `order_items`
3. Implemented SQL queries using:
   - **Subqueries** for filtering and nested selection logic
   - **CTEs** (Common Table Expressions) for intermediate calculations
   - **Window functions** such as `RANK()` and `ROW_NUMBER()` for ranking and row sequencing
4. Generated business insights through query outputs.

## SQL Scripts Included
- `sql_script/superstore_assignment_queries.sql`
- `sql_script/task_queries.sql`

## Query Outputs
- `query results/superstore_assignment_results.txt`
- `query results/task_results.txt`

## Key Insights
- Top and bottom customers were identified based on total sales.
- Customers with only one order were highlighted as retention opportunities.
- Customers whose total sales exceeded the average were marked as high-value targets.
- Window functions produced ranked customer leaderboards for executive analysis.
- The analysis showed which customer accounts deliver the highest value and which require additional sales focus.

## SQL Concepts Used
- Subqueries
- CTEs (Common Table Expressions)
- Window Functions (`RANK()`, `ROW_NUMBER()`)
- JOINs for combining customer, order, and product data
- Aggregations and ranking for business reporting

## Files in this Assignment
- `brief insights.txt` - Summary of business insights and query outcomes
- `query results/superstore_assignment_results.txt` - Output from Superstore query execution
- `query results/task_results.txt` - Output from task-specific queries
- `sql_script/superstore_assignment_queries.sql` - SQL script for Superstore assignment queries
- `sql_script/task_queries.sql` - Task-specific SQL query script
- `sql_script/superstore_raw.csv` - Raw dataset used for SQL loading and analysis
