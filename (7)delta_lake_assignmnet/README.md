# Assignment 7: Delta Lake Assignment

## Project Overview
This assignment demonstrates how to use Delta Lake with PySpark in Databricks for data loading, cleaning, storage, and incremental processing.

## Objective
The goal of this project is to learn how to:
- Load data from a CSV file
- Clean and prepare the data
- Create a Delta table
- Process incremental data
- Apply a MERGE operation
- Validate the final output

## Folder Structure

```
delta-lake-assignment/
|
├── data/
│   ├── customer_master.csv
│   └── customer_incremental.csv
│
├── notebooks/
│   └── delta_scd_assignment.ipynb
│
├── screenshots/
│   ├── data_loading/
│   ├── data_cleaning/
│   ├── scd1/
│   ├── scd2/
│   ├── validation/
│   └── final_output/
│
└── report/

```

## Technologies Used
- PySpark
- Delta Lake
- Databricks

## Tasks Performed
1. Load Data
   - Read the CSV dataset into a Spark DataFrame.

2. Data Cleaning
   - Removed null values and duplicate records.

3. Delta Table Creation
   - Converted the cleaned data into a Delta table.

4. Incremental Data Processing
   - Created an incremental dataset with updated and new records.

5. MERGE Operation
   - Updated existing rows and inserted new ones using Delta merge logic.

6. Validation
   - Checked row counts and duplicate values.

7. Final Output
   - Verified the final merged Delta table.

## How to Run the Notebook
1. Open the notebook file in Databricks or a compatible Spark environment.
2. Attach the notebook to a running cluster.
3. Run the cells in order from top to bottom.
4. Check the output tables and printed validation results.

## Output
The project creates and updates Delta tables using incremental data. The final output shows:
- Updated records
- Newly inserted records
- Clean and validated data in Delta format

## Author
Shrishti Khandelwal
