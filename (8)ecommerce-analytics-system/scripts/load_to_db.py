import sqlite3
import pandas as pd
import os

# Define file paths
db_path = os.path.join("..", "data", "ecommerce.db")
schema_path = os.path.join("..", "sql", "schema.sql")
cleaned_folder = os.path.join("..", "data", "cleaned")

def setup_database():
    """Create database file and execute the DDL schema."""
    print("\nSetting up the Database")
    conn = sqlite3.connect(db_path)
    cursor = conn.cursor()
    
    with open(schema_path, "r", encoding="utf-8") as f:
        schema_sql = f.read()
        
    cursor.executescript(schema_sql)
    print("  Successfully executed schema.sql")
    conn.commit()
    return conn

def load_data(conn):
    """Load cleaned CSV files into matching SQLite tables."""
    print("\nLoading Data into SQLite")
    tables = {
        "customers": "customers_clean.csv",
        "products": "products_clean.csv",
        "orders": "orders_clean.csv",
        "order_items": "order_items_clean.csv"
    }
    
    for table_name, file_name in tables.items():
        file_path = os.path.join(cleaned_folder, file_name)
        df = pd.read_csv(file_path)
        # Write pandas DataFrame to database table
        df.to_sql(table_name, conn, if_exists="append", index=False)
        print(f"  Loaded {len(df)} rows into '{table_name}' table")

def verify_data(conn):
    """Run verification queries to check counts and foreign key matches."""
    print("\nVerifying Database Data")
    
    # 1. Row counts verification
    print("\n--- Row Counts ---")
    for table in ["customers", "products", "orders", "order_items"]:
        count = pd.read_sql_query(f"SELECT COUNT(*) FROM {table}", conn).iloc[0, 0]
        print(f"  {table}: {count} rows")
        
    # 2. Check relationship between orders and customers
    print("\n--- Relationship Check: Orders to Customers ---")
    valid_orders = pd.read_sql_query("""
        SELECT COUNT(*) FROM orders o
        JOIN customers c ON o.customer_id = c.customer_id
    """, conn).iloc[0, 0]
    total_orders = pd.read_sql_query("SELECT COUNT(*) FROM orders", conn).iloc[0, 0]
    print(f"  Orders with valid customers: {valid_orders} / {total_orders}")
    
    # 3. Check relationship between items, orders and products
    print("\n--- Relationship Check: Order Items ---")
    valid_items = pd.read_sql_query("""
        SELECT COUNT(*) FROM order_items oi
        JOIN orders o ON oi.order_id = o.order_id
        JOIN products p ON oi.product_id = p.product_id
    """, conn).iloc[0, 0]
    total_items = pd.read_sql_query("SELECT COUNT(*) FROM order_items", conn).iloc[0, 0]
    print(f"  Order items with valid orders & products: {valid_items} / {total_items}")

if __name__ == "__main__":
    conn = setup_database()
    load_data(conn)
    verify_data(conn)
    conn.close()
    
    print("\nDatabase Loading Complete!")
    print(f"Database saved to: {db_path}")
