import pandas as pd
import os
import warnings

# Suppress pandas warning messages
warnings.filterwarnings("ignore")

# Define folder paths
raw_folder = os.path.join("..", "data", "raw")
cleaned_folder = os.path.join("..", "data", "cleaned")
os.makedirs(cleaned_folder, exist_ok=True)

def is_email_invalid(email):
    """Check if an email format is bad (missing @ or a dot in domain)."""
    email = str(email)
    if "@" not in email:
        return True
    parts = email.split("@")
    if len(parts) != 2 or "." not in parts[1]:
        return True
    return False

def validate_emails():
    """Find and return customer IDs with invalid emails in raw data."""
    print("\nValidating Emails (from raw data)")
    df = pd.read_csv(os.path.join(raw_folder, "customers.csv"))
    bad_mask = df["email"].apply(is_email_invalid)
    bad_ids = df.loc[bad_mask, "customer_id"].tolist()
    
    print(f"  Customer IDs with invalid emails: {bad_ids}")
    print(f"  Total invalid emails found: {len(bad_ids)}")
    return bad_ids

def check_referential_integrity():
    """Check if order items have invalid order IDs in raw data."""
    print("\nChecking Referential Integrity")
    orders_df = pd.read_csv(os.path.join(raw_folder, "orders.csv"))
    items_df = pd.read_csv(os.path.join(raw_folder, "order_items.csv"))
    
    valid_ids = orders_df["order_id"].tolist()
    orphan_rows = items_df[~items_df["order_id"].isin(valid_ids)]
    
    print(f"  Total orders           : {len(orders_df)}")
    print(f"  Total order_items      : {len(items_df)}")
    print(f"  Orphan order_items     : {len(orphan_rows)}")
    
    if len(orphan_rows) > 0:
        print("\n  Sample orphan rows:")
        print(orphan_rows.head(5).to_string(index=False))
    return orphan_rows

def clean_customers():
    """Clean customers raw CSV file."""
    print("\nCleaning: customers.csv")
    df = pd.read_csv(os.path.join(raw_folder, "customers.csv"))
    print(f"  Rows before cleaning : {len(df)}")
    
    # Remove duplicates and clean casing/spaces
    dup_count = df.duplicated().sum()
    df = df.drop_duplicates()
    print(f"  Duplicate rows removed : {dup_count}")
    
    df["customer_name"] = df["customer_name"].str.strip().str.title()
    df["email"] = df["email"].str.strip().str.lower()
    
    # Flag and substitute bad emails
    bad_emails = df["email"].apply(is_email_invalid)
    print(f"  Invalid emails found  : {bad_emails.sum()}")
    df.loc[bad_emails, "email"] = "invalid@placeholder.com"
    
    # Fill missing customer types
    missing_type = df["customer_type"].isna().sum()
    df["customer_type"] = df["customer_type"].fillna("REGULAR").str.strip().str.upper()
    print(f"  Missing customer_type filled : {missing_type}")
    
    # Clean date strings
    df["registration_date"] = pd.to_datetime(df["registration_date"], errors="coerce").dt.strftime("%Y-%m-%d")
    print(f"  Rows after cleaning  : {len(df)}")
    
    out_path = os.path.join(cleaned_folder, "customers_clean.csv")
    df.to_csv(out_path, index=False)
    print(f"  Saved: {out_path}")
    return df

def clean_products():
    """Clean products raw CSV file."""
    print("\nCleaning: products.csv")
    df = pd.read_csv(os.path.join(raw_folder, "products.csv"))
    print(f"  Rows before cleaning : {len(df)}")
    
    # Remove duplicates and format strings
    df = df.drop_duplicates()
    df["product_name"] = df["product_name"].str.strip().str.title()
    df["category"] = df["category"].str.strip().str.title()
    df["subcategory"] = df["subcategory"].str.strip().str.title()
    
    # Fill empty prices with average
    missing_price = df["cost_price"].isna().sum()
    mean_price = df["cost_price"].mean()
    df["cost_price"] = pd.to_numeric(df["cost_price"].fillna(round(mean_price, 2)), errors="coerce")
    print(f"  Missing cost_price filled : {missing_price}")
    
    print(f"  Rows after cleaning  : {len(df)}")
    out_path = os.path.join(cleaned_folder, "products_clean.csv")
    df.to_csv(out_path, index=False)
    print(f"  Saved: {out_path}")
    return df

def clean_orders():
    """Clean orders raw CSV file."""
    print("\nCleaning: orders.csv")
    df = pd.read_csv(os.path.join(raw_folder, "orders.csv"))
    print(f"  Rows before cleaning : {len(df)}")
    
    df = df.drop_duplicates()
    
    # Parse dates with mixed formats
    df["order_date"] = pd.to_datetime(df["order_date"], format="mixed", dayfirst=True, errors="coerce")
    nat_count = df["order_date"].isna().sum()
    print(f"  Dates that could not be parsed: {nat_count}")
    df["order_date"] = df["order_date"].dt.strftime("%Y-%m-%d %H:%M:%S")
    
    # Handle missing customer_id
    null_custs = df["customer_id"].isna().sum()
    df["customer_id"] = df["customer_id"].fillna(0).astype(int)
    print(f"  NULL customer_id rows found : {null_custs}")
    
    # Validate order status
    valid_statuses = ["PLACED", "SHIPPED", "DELIVERED", "CANCELLED", "RETURNED"]
    df["status"] = df["status"].str.strip().str.upper()
    invalid_status = ~df["status"].isin(valid_statuses)
    print(f"  Invalid status values replaced : {invalid_status.sum()}")
    df.loc[invalid_status, "status"] = "PLACED"
    
    df["region_code"] = df["region_code"].str.strip().str.upper()
    print(f"  Rows after cleaning  : {len(df)}")
    
    out_path = os.path.join(cleaned_folder, "orders_clean.csv")
    df.to_csv(out_path, index=False)
    print(f"  Saved: {out_path}")
    return df

def clean_order_items(valid_order_ids):
    """Clean order items raw CSV file, filtering orphans."""
    print("\nCleaning: order_items.csv")
    df = pd.read_csv(os.path.join(raw_folder, "order_items.csv"))
    print(f"  Rows before cleaning : {len(df)}")
    
    df = df.drop_duplicates()
    df["quantity"] = pd.to_numeric(df["quantity"], errors="coerce")
    df["unit_price"] = pd.to_numeric(df["unit_price"], errors="coerce").fillna(0)
    df["discount_percent"] = pd.to_numeric(df["discount_percent"], errors="coerce").fillna(0)
    
    print(f"  Rows with negative quantity (returns): {(df['quantity'] < 0).sum()}")
    
    # Filter quantity == 0 rows
    zero_qty = (df["quantity"] == 0).sum()
    df = df[df["quantity"] != 0]
    print(f"  Rows with zero quantity removed: {zero_qty}")
    
    # Cap discount percent
    bad_discount = ((df["discount_percent"] < 0) | (df["discount_percent"] > 100)).sum()
    df["discount_percent"] = df["discount_percent"].clip(lower=0, upper=100)
    print(f"  Invalid discount_percent values fixed: {bad_discount}")
    
    # Referential integrity check
    orphan_mask = ~df["order_id"].isin(valid_order_ids)
    print(f"  Orphan order_items (invalid order_id) removed: {orphan_mask.sum()}")
    df = df[~orphan_mask]
    
    print(f"  Rows after cleaning  : {len(df)}")
    out_path = os.path.join(cleaned_folder, "order_items_clean.csv")
    df.to_csv(out_path, index=False)
    print(f"  Saved: {out_path}")
    return df

if __name__ == "__main__":
    print("\n  E-Commerce Data Cleaning Pipeline")
    
    # Validate raw data integrity
    bad_emails = validate_emails()
    orphan_items = check_referential_integrity()
    
    # Run cleaning functions
    clean_cust = clean_customers()
    clean_prod = clean_products()
    clean_ord = clean_orders()
    
    # Clean order items passing active order IDs
    clean_items = clean_order_items(clean_ord["order_id"].tolist())
    
    print("\n  CLEANING REPORT SUMMARY")
    print(f"  customers_clean.csv  : {len(clean_cust)} rows")
    print(f"  products_clean.csv   : {len(clean_prod)} rows")
    print(f"  orders_clean.csv     : {len(clean_ord)} rows")
    print(f"  order_items_clean.csv: {len(clean_items)} rows")
    print(f"  Invalid emails found : {len(bad_emails)}")
    print(f"  Orphan order_items   : {len(orphan_items)}")
    print("\n  All cleaned files saved to data/cleaned/")
