# E-Commerce Order Analytics System

A beginner-friendly data analytics project built with Python, Pandas, SQLite, and SQL.  
This project simulates the complete data pipeline of an e-commerce company — from raw, messy data to business insights.

---

## Project Overview

In the real world, data is never clean. It comes from multiple sources with missing values, wrong formats, duplicate records, and invalid entries.

This project solves exactly that problem. It:
1. **Generates** realistic fake order data (with intentional issues)
2. **Cleans** that data using Python and Pandas
3. **Loads** the clean data into a local SQLite database
4. **Analyzes** the data using SQL queries
5. **Reports** business insights through a command-line tool

This was built as an internship mini-project to demonstrate end-to-end data engineering and analytics skills.

---

## Features

- Generates 500+ rows of realistic fake e-commerce data using the `Faker` library
- Intentionally introduces data quality problems (missing values, bad dates, invalid emails, orphan records)
- Cleans every issue using Pandas and validates referential integrity
- Creates a proper SQLite relational database with foreign keys
- Runs SQL queries for aggregations, window functions, cohort analysis, and RFM segmentation
- Command-line reporting tool that prints formatted tables directly in the terminal
- Edge case testing for invalid inputs, future dates, and empty results

---

## Technologies Used

| Tool / Library | Purpose |
|----------------|---------|
| Python 3.x | Core programming language |
| Pandas | Data loading, cleaning, and transformation |
| Faker | Generating realistic fake data |
| SQLite3 | Local relational database |
| Tabulate | Printing formatted CLI tables |
| Argparse | Handling command-line arguments |
| SQL | Data analysis and reporting queries |

> No web frameworks, cloud databases, or paid services are needed. Everything runs locally.

---

## Folder Structure

```
ecommerce-analytics-system/
│
├── data/
│   ├── raw/                      # Original messy CSVs (auto-generated)
│   │   ├── customers.csv
│   │   ├── products.csv
│   │   ├── orders.csv
│   │   └── order_items.csv
│   │
│   ├── cleaned/                  # Cleaned CSVs after processing
│   │   ├── customers_clean.csv
│   │   ├── products_clean.csv
│   │   ├── orders_clean.csv
│   │   └── order_items_clean.csv
│   │
│   └── ecommerce.db              # SQLite database (auto-created)
│
├── sql/
│   ├── schema.sql                # Table creation with primary/foreign keys
│   ├── aggregations.sql          # Basic revenue and product queries
│   ├── window_functions.sql      # RANK, running totals, moving averages
│   ├── cohort_analysis.sql       # Retention, repeat, and churn queries
│   └── rfm_and_segmentation.sql  # Customer segmentation and RFM analysis
│
├── scripts/
│   ├── generate_data.py          # Generates all 4 raw CSV files
│   ├── clean_data.py             # Cleans raw data and saves to cleaned/
│   ├── load_to_db.py             # Loads cleaned data into SQLite
│   ├── report_cli.py             # CLI tool for generating reports
│   └── test_edge_cases.py        # Tests edge cases and error handling
│
├── output/
│   └── sample_reports/
│       └── sample_report.md      # Auto-generated business report
│
└── README.md
```

---

## Dataset Description

The project works with 4 related datasets. They are linked together like a real database.

### `customers.csv`
Stores customer account information.

| Column | Type | Notes |
|--------|------|-------|
| customer_id | Integer | Unique ID for each customer |
| customer_name | Text | Full name |
| email | Text | Some are intentionally invalid |
| registration_date | Date | Date they signed up |
| customer_type | Text | REGULAR, PREMIUM, or VIP |

### `products.csv`
Stores product catalog information.

| Column | Type | Notes |
|--------|------|-------|
| product_id | Integer | Unique ID for each product |
| product_name | Text | Some have extra spaces or wrong case |
| category | Text | Electronics, Clothing, Home, Books |
| subcategory | Text | More specific type |
| cost_price | Real | Price of product |

### `orders.csv`
Each row is one order placed by a customer.

| Column | Type | Notes |
|--------|------|-------|
| order_id | Integer | Unique order ID |
| customer_id | Integer | Some are NULL (unknown customer) |
| order_date | Text | Mixed formats: YYYY-MM-DD and DD-MM-YYYY |
| status | Text | PLACED, SHIPPED, DELIVERED, CANCELLED, RETURNED |
| region_code | Text | NORTH, SOUTH, EAST, WEST, CENTRAL |

### `order_items.csv`
Each row is one product line inside an order.

| Column | Type | Notes |
|--------|------|-------|
| item_id | Integer | Unique item ID |
| order_id | Integer | Links to orders table |
| product_id | Integer | Links to products table |
| quantity | Integer | Negative values = product returns |
| unit_price | Real | Price at time of order |
| discount_percent | Real | Between 0 and 100 |

---

## Project Workflow

Run the scripts in this exact order:

### Step 1 — Generate Raw Data
```bash
python scripts/generate_data.py
```
Creates all 4 CSV files in `data/raw/` with 520+ rows each.  
Includes intentional problems: duplicate rows, NULL IDs, invalid emails, mixed date formats, and orphan order items.

---

### Step 2 — Clean the Data
```bash
python scripts/clean_data.py
```
Loads each raw CSV, fixes all data quality issues, and saves clean versions to `data/cleaned/`.

**What gets fixed:**
- Duplicate rows → removed
- Invalid emails → replaced with a placeholder
- Mixed date formats → standardized to `YYYY-MM-DD HH:MM:SS`
- NULL customer IDs → filled with `0`
- Invalid order statuses → replaced with `PLACED`
- Orphan order items (invalid order_id) → removed
- Extra spaces and wrong casing in text columns → trimmed and standardized

---

### Step 3 — Load Data into SQLite
```bash
python scripts/load_to_db.py
```
Creates the `data/ecommerce.db` SQLite database, runs `schema.sql` to create all tables with proper constraints, loads the cleaned CSVs, and prints a verification report.

---

### Step 4 — Run SQL Analysis
Open any SQL file from the `sql/` folder in DB Browser for SQLite, DBeaver, or any SQL tool connected to `data/ecommerce.db`.

Example queries are pre-written and ready to run.

---

### Step 5 — Generate CLI Reports
```bash
python scripts/report_cli.py --report revenue
python scripts/report_cli.py --report top_customers
python scripts/report_cli.py --report retention
```

---

### Step 6 — Run Edge Case Tests
```bash
python scripts/test_edge_cases.py
```
Tests database connectivity, date validation, future date warnings, empty result handling, and single-record edge cases.

---

## SQL Files Overview

### `schema.sql`
Defines the 4 database tables with:
- `PRIMARY KEY` on every table
- `FOREIGN KEY` linking `orders → customers`, `order_items → orders`, `order_items → products`
- `NOT NULL` on required fields

### `aggregations.sql`
Contains basic business queries:
- Total revenue per customer, category, and month
- Top 10 products by quantity sold and by revenue
- Average Order Value (AOV)

### `window_functions.sql`
Contains advanced SQL using window functions:
- `RANK()` and `DENSE_RANK()` to rank customers by revenue
- `SUM() OVER()` for a running total of daily revenue
- `AVG() OVER()` for a 7-day moving average of revenue
- CTEs to categorize months as High, Medium, or Low revenue

### `cohort_analysis.sql`
Groups customers into monthly cohorts and tracks:
- How many customers registered per month
- Month 0, 1, and 2 retention rates
- Repeat customers (more than 1 order)
- Churned customers (no order in 60+ days)

### `rfm_and_segmentation.sql`
Segments customers using business logic:
- **Purchase Frequency** — how often they buy
- **Customer Type** — One-time, Occasional, or Loyal
- **Spend Tier** — Low, Medium, or High spend
- **RFM Analysis** — Recency, Frequency, Monetary value per customer

---

## Installation

### Prerequisites
- Python 3.7 or higher (Anaconda recommended)
- pip

### Install Required Libraries
```bash
pip install pandas faker tabulate
```

> `sqlite3` and `argparse` are part of the Python standard library — no installation needed.

---

## How to Run the Project

```bash
# Step 1: Generate data
python scripts/generate_data.py

# Step 2: Clean data
python scripts/clean_data.py

# Step 3: Load into database
python scripts/load_to_db.py

# Step 4: View a report
python scripts/report_cli.py --report revenue
python scripts/report_cli.py --report top_customers
python scripts/report_cli.py --report retention

# Step 5: Run edge case tests
python scripts/test_edge_cases.py
```

---

## Sample Output

### CLI Report — Month-wise Revenue
```
=== MONTH-WISE REVENUE REPORT ===
+---------+----------------+--------------------+-----------------+
| Month   |   Total_Orders |   Total_Items_Sold |   Total_Revenue |
+=========+================+====================+=================+
| 2026-07 |              6 |                 39 |         62552.4 |
+---------+----------------+--------------------+-----------------+
| 2026-06 |             11 |                 71 |        133820   |
+---------+----------------+--------------------+-----------------+
| 2026-05 |             13 |                128 |        285747   |
+---------+----------------+--------------------+-----------------+
```

### CLI Report — Top Customers
```
=== TOP 10 CUSTOMERS BY SPEND ===
+---------------+-----------------+---------------------------+-------------+
| Customer_ID   | Customer_Name   | Email                     | Total_Spend |
+===============+=================+===========================+=============+
|           312 | Kevin Davis     | kevindavis@example.com    |   102716.05 |
+---------------+-----------------+---------------------------+-------------+
|            87 | Erica Harris    | erica.harris@example.com  |   100931.96 |
+---------------+-----------------+---------------------------+-------------+
```

For a complete business report with all metrics, see [`output/sample_reports/sample_report.md`](output/sample_reports/sample_report.md).

---

## Future Improvements

- **Add a web dashboard** using Streamlit or Flask to visualize the reports as charts and graphs
- **Schedule the pipeline** using a cron job or Python `schedule` library to run data generation daily
- **Export reports as PDF** using a library like `reportlab` or `weasyprint`
- **Add more SQL reports** to the CLI tool (e.g., category breakdown, churn rate by region)
- **Connect to a real database** like PostgreSQL or MySQL for production use
- **Add unit tests** for every cleaning function using `pytest`

---

## Author

**Internship Project — E-Commerce Order Analytics System**  
Built as part of a 3–4 week internship assignment to demonstrate skills in:
- Python data processing
- SQL database design
- Data cleaning and validation
- Business reporting

> This project was built using only beginner to intermediate Python, Pandas, SQLite, and SQL.  
> No advanced frameworks, cloud services, or complex libraries were used.
