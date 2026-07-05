# Delta Lake Assignment 7 Report

## Objective
This assignment was aimed at learning how to work with Delta Lake using PySpark in Databricks. The main goal was to load data, clean it, convert it into a Delta table, apply incremental updates, and merge new records into the existing table.

## Dataset Used
A CSV dataset was loaded from a Databricks volume. The dataset contained order-related information such as Order_ID, Sales, Profit, Region, and other business fields.

## Steps Performed
1. Loaded the CSV file into a Spark DataFrame.
2. Cleaned the data by removing null values and duplicate rows.
3. Converted the cleaned data into a Delta table.
4. Created an incremental dataset with updated and new records.
5. Applied a merge operation to update existing rows and insert new ones.
6. Validated the final output by checking row counts and duplicates.

## Technologies Used
- PySpark
- Delta Lake
- Databricks

## Results
The data was successfully transformed into a Delta table, and the merge operation worked as expected. The final table contained updated values for existing records and new entries added from the incremental dataset.

## Conclusion
This assignment helped in understanding the basics of Delta Lake operations such as data loading, cleaning, table creation, incremental updates, and merging data efficiently. It also showed how Delta Lake improves data reliability and supports scalable data processing in modern analytics workflows.
