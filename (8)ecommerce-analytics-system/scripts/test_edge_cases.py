import sqlite3
import os
import datetime

# Find path to database relative to this script
script_dir = os.path.dirname(os.path.abspath(__file__))
db_path = os.path.join(script_dir, "..", "data", "ecommerce.db")

def check_database_connection(path):
    """Test if database file exists and connections succeed."""
    print("\n--- Test: Database Connection ---")
    if not os.path.exists(path):
        print(f"Error: Database not found at '{path}'. Run load_to_db.py first.")
        return False
    try:
        conn = sqlite3.connect(path)
        print("Success: Database connected successfully.")
        conn.close()
        return True
    except sqlite3.Error as e:
        print(f"Error connecting: {e}")
        return False

def validate_date(date_str):
    """Validate string format (YYYY-MM-DD) and check if it's a real date."""
    print(f"\n--- Test: Date Format for '{date_str}' ---")
    parts = date_str.split("-")
    if len(parts) != 3:
        print("Error: Format must be YYYY-MM-DD.")
        return False
        
    y, m, d = parts[0], parts[1], parts[2]
    if not (y.isdigit() and m.isdigit() and d.isdigit()) or len(y) != 4 or len(m) != 2 or len(d) != 2:
        print("Error: Ensure YYYY is 4 digits, MM and DD are 2 digits each.")
        return False
        
    try:
        datetime.date(int(y), int(m), int(d))
        print("Success: Valid date.")
        return True
    except ValueError:
        print("Error: Invalid calendar date.")
        return False

def check_future_date(date_str):
    """Verify if the date is in the future relative to today."""
    print(f"\n--- Test: Checking Future Date for '{date_str}' ---")
    parts = date_str.split("-")
    dt = datetime.date(int(parts[0]), int(parts[1]), int(parts[2]))
    today = datetime.date.today()
    
    if dt > today:
        print("Warning: Date is in the future. Query results might be empty.")
        return True
    print("Success: Date is past or today.")
    return False

def handle_query_results(rows, desc):
    """Handle result output and flag empty/single-row results."""
    print(f"\n--- Test: Query Results for '{desc}' ---")
    if len(rows) == 0:
        print("Warning: No records found (zero orders).")
    elif len(rows) == 1:
        print(f"Note: Exactly one record was returned: {rows[0]}")
    else:
        print(f"Success: Found {len(rows)} records. First few:")
        for r in rows[:3]:
            print(f"  {r}")

def main():
    print("--- Running Edge Case Tests ---")
    
    # 1. Test database connections
    check_database_connection(db_path)
    check_database_connection("invalid_path/test.db")
    
    # 2. Test date format validation
    validate_date("2023-13-45")
    validate_date("23-11-12")
    validate_date("2023-abc-12")
    validate_date("2023-12-05")
    
    # 3. Test checking for future dates
    check_future_date("2023-12-05")
    future_str = (datetime.date.today() + datetime.timedelta(days=10)).strftime("%Y-%m-%d")
    check_future_date(future_str)
    
    # 4. Test query result outcomes
    handle_query_results([], "Future Year 2035 orders")
    handle_query_results([(101, "Alice", "alice@test.com", 150.0)], "Customer ID 101 search")
    handle_query_results([
        (101, "Alice", "alice@test.com", 150.0),
        (102, "Bob", "bob@test.com", 200.0),
        (103, "Charlie", "charlie@test.com", 25.5)
    ], "All premium customers")

if __name__ == "__main__":
    main()
