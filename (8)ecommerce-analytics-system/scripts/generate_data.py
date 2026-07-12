import csv
import random
import os
from faker import Faker

# Set up Faker and random seeds for reproducibility
fake = Faker()
random.seed(42)
Faker.seed(42)

# Make raw data directory
raw_folder = os.path.join("..", "data", "raw")
os.makedirs(raw_folder, exist_ok=True)

print("Folders are ready.")
print("Starting data generation...\n")

def generate_customers(num_rows=520):
    customer_types = ["REGULAR", "PREMIUM", "VIP"]
    customers = []
    
    for i in range(1, num_rows + 1):
        email = fake.email()
        # 2% chance email is invalid
        if random.randint(1, 100) <= 2:
            email = email.replace("@", "")
            
        customers.append({
            "customer_id": i,
            "customer_name": fake.name(),
            "email": email,
            "registration_date": fake.date_between(start_date="-5y", end_date="now"),
            "customer_type": random.choice(customer_types)
        })
        
    # Pick 10 random existing customers to duplicate
    duplicates = random.sample(customers, 10)
    customers.extend(duplicates)
    
    print(f"Customers generated: {len(customers)} rows (includes 10 duplicates)")
    return customers

def generate_products(num_rows=520):
    categories = {
        "Electronics": ["Mobile", "Laptop", "Tablet", "Camera", "Headphones"],
        "Clothing":    ["Men", "Women", "Kids", "Sportswear", "Accessories"],
        "Home":        ["Furniture", "Kitchen", "Bedding", "Decor", "Lighting"],
        "Books":       ["Fiction", "Non-Fiction", "Science", "History", "Comics"]
    }
    products = []
    
    for i in range(1, num_rows + 1):
        category = random.choice(list(categories.keys()))
        subcategory = random.choice(categories[category])
        product_name = fake.word().capitalize() + " " + fake.word().capitalize()
        
        # Add extra spaces or messy casing
        rand = random.randint(1, 100)
        if rand <= 15:
            product_name = "  " + product_name + "  "
        elif rand <= 25:
            product_name = product_name.upper()
        elif rand <= 35:
            product_name = product_name.lower()
            
        products.append({
            "product_id": i,
            "product_name": product_name,
            "category": category,
            "subcategory": subcategory,
            "cost_price": round(random.uniform(50, 5000), 2)
        })
        
    print(f"Products generated: {len(products)} rows")
    return products

def generate_orders(num_rows=520, total_customers=520):
    statuses = ["PLACED", "SHIPPED", "DELIVERED", "CANCELLED", "RETURNED"]
    regions = ["NORTH", "SOUTH", "EAST", "WEST", "CENTRAL"]
    orders = []
    
    for i in range(1, num_rows + 1):
        dt = fake.date_time_between(start_date="-2y", end_date="now")
        order_date = dt.strftime("%Y-%m-%d %H:%M:%S")
        
        # 10% chance date format is DD-MM-YYYY
        if random.randint(1, 100) <= 10:
            order_date = dt.strftime("%d-%m-%Y")
            
        cust_id = random.randint(1, total_customers)
        # 5% chance customer_id is empty
        if random.randint(1, 100) <= 5:
            cust_id = ""
            
        orders.append({
            "order_id": i,
            "customer_id": cust_id,
            "order_date": order_date,
            "status": random.choice(statuses),
            "region_code": random.choice(regions)
        })
        
    print(f"Orders generated: {len(orders)} rows")
    return orders

def generate_order_items(num_rows=520, total_orders=520, total_products=520):
    order_items = []
    
    for i in range(1, num_rows + 1):
        order_id = random.randint(1, total_orders)
        # 5% chance order_id is invalid (too high)
        if random.randint(1, 100) <= 5:
            order_id = total_orders + random.randint(1, 100)
            
        quantity = random.randint(1, 10)
        # 3% chance quantity is negative (returns)
        if random.randint(1, 100) <= 3:
            quantity = -random.randint(1, 5)
            
        order_items.append({
            "item_id": i,
            "order_id": order_id,
            "product_id": random.randint(1, total_products),
            "quantity": quantity,
            "unit_price": round(random.uniform(50, 5000), 2),
            "discount_percent": round(random.uniform(0, 40), 2)
        })
        
    print(f"Order items generated: {len(order_items)} rows")
    return order_items

def save_to_csv(data, filename):
    column_names = list(data[0].keys())
    with open(filename, mode="w", newline="", encoding="utf-8") as file:
        writer = csv.DictWriter(file, fieldnames=column_names)
        writer.writeheader()
        for row in data:
            writer.writerow(row)
    print(f"  Saved: {filename}")

if __name__ == "__main__":
    print("-" * 40)
    print("   E-Commerce Data Generator")
    print("-" * 40)
    
    cust = generate_customers()
    prod = generate_products()
    ords = generate_orders()
    items = generate_order_items()
    
    print("\nSaving CSV files to data/raw/ folder...\n")
    save_to_csv(cust, os.path.join(raw_folder, "customers.csv"))
    save_to_csv(prod, os.path.join(raw_folder, "products.csv"))
    save_to_csv(ords, os.path.join(raw_folder, "orders.csv"))
    save_to_csv(items, os.path.join(raw_folder, "order_items.csv"))
    
    print("-" * 40)
    print("All 4 CSV files created successfully!")
    print("Check the data/raw/ folder.")
    print("-" * 40)
