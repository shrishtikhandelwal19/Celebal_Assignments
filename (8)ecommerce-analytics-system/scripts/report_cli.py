import sqlite3
import os
import argparse
from tabulate import tabulate

# Get db path relative to this script
script_dir = os.path.dirname(os.path.abspath(__file__))
db_path = os.path.join(script_dir, "..", "data", "ecommerce.db")

def run_report(query, title):
    """Connect to SQLite database, execute query, and print as table."""
    if not os.path.exists(db_path):
        print("Error: Database not found. Run load_to_db.py first.")
        return
        
    try:
        conn = sqlite3.connect(db_path)
        cursor = conn.cursor()
        cursor.execute(query)
        rows = cursor.fetchall()
        
        # Get column names
        headers = [col[0] for col in cursor.description]
        conn.close()
        
        print(f"\n=== {title} ===")
        if not rows:
            print("No records found.")
        else:
            print(tabulate(rows, headers=headers, tablefmt="grid"))
            
    except sqlite3.Error as e:
        print(f"Database error: {e}")

def main():
    # Set up argparse for report flag
    parser = argparse.ArgumentParser(description="E-Commerce Analytics CLI Tool")
    parser.add_argument(
        "--report", 
        choices=["revenue", "top_customers", "retention"],
        required=True,
        help="Type of report to display (revenue, top_customers, retention)"
    )
    args = parser.parse_args()

    # Route based on the chosen report type
    if args.report == "revenue":
        query = """
            SELECT 
                strftime('%Y-%m', o.order_date) AS Month,
                COUNT(DISTINCT o.order_id) AS Total_Orders,
                SUM(oi.quantity) AS Total_Items_Sold,
                ROUND(SUM(oi.quantity * oi.unit_price * (1.0 - oi.discount_percent / 100.0)), 2) AS Total_Revenue
            FROM orders o
            JOIN order_items oi ON o.order_id = oi.order_id
            GROUP BY Month
            ORDER BY Month DESC;
        """
        run_report(query, "MONTH-WISE REVENUE REPORT")
        
    elif args.report == "top_customers":
        query = """
            SELECT 
                c.customer_id AS Customer_ID,
                c.customer_name AS Customer_Name,
                c.email AS Email,
                ROUND(SUM(oi.quantity * oi.unit_price * (1.0 - oi.discount_percent / 100.0)), 2) AS Total_Spend
            FROM customers c
            JOIN orders o ON c.customer_id = o.customer_id
            JOIN order_items oi ON o.order_id = oi.order_id
            GROUP BY c.customer_id, c.customer_name, c.email
            ORDER BY Total_Spend DESC
            LIMIT 10;
        """
        run_report(query, "TOP 10 CUSTOMERS BY SPEND")
        
    elif args.report == "retention":
        query = """
            WITH CohortSizes AS (
                SELECT strftime('%Y-%m', registration_date) AS cohort_month, COUNT(customer_id) AS cohort_size
                FROM customers GROUP BY cohort_month
            ),
            CustomerOrders AS (
                SELECT DISTINCT c.customer_id, strftime('%Y-%m', c.registration_date) AS cohort_month, strftime('%Y-%m', o.order_date) AS order_month
                FROM customers c
                JOIN orders o ON c.customer_id = o.customer_id
            ),
            MonthDifference AS (
                SELECT customer_id, cohort_month,
                    (CAST(SUBSTR(order_month, 1, 4) AS INTEGER) - CAST(SUBSTR(cohort_month, 1, 4) AS INTEGER)) * 12 +
                    (CAST(SUBSTR(order_month, 6, 2) AS INTEGER) - CAST(SUBSTR(cohort_month, 6, 2) AS INTEGER)) AS months_since_reg
                FROM CustomerOrders
            )
            SELECT 
                cs.cohort_month AS Cohort_Month,
                cs.cohort_size AS Cohort_Size,
                COUNT(DISTINCT CASE WHEN md.months_since_reg = 0 THEN md.customer_id END) AS Month_0_Active,
                COUNT(DISTINCT CASE WHEN md.months_since_reg = 1 THEN md.customer_id END) AS Month_1_Active,
                COUNT(DISTINCT CASE WHEN md.months_since_reg = 2 THEN md.customer_id END) AS Month_2_Active,
                ROUND(CAST(COUNT(DISTINCT CASE WHEN md.months_since_reg = 1 THEN md.customer_id END) AS FLOAT) / cs.cohort_size * 100, 2) AS Month_1_Retention_Pct
            FROM CohortSizes cs
            LEFT JOIN MonthDifference md ON cs.cohort_month = md.cohort_month
            GROUP BY cs.cohort_month, cs.cohort_size
            ORDER BY cs.cohort_month DESC;
        """
        run_report(query, "COHORT RETENTION REPORT")

if __name__ == "__main__":
    main()
