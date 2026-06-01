# SQL Sales Data Analysis

## Objective
This project demonstrates fundamental SQL skills through comprehensive analysis of the Superstore dataset. The goal is to load data into a SQL database, explore its structure, and perform various queries to extract insights about sales trends, customer behavior, and data quality.

## Dataset Information
**Dataset Name:** Superstore Dataset (Kaggle)  
**Source:** Kaggle  
**Description:** The dataset contains sales transaction records including customer information, product details, order dates, and sales metrics from a retail superstore.

## Tools Used
- **MySQL Workbench** - Database management and query execution
- **SQL** - Data querying and analysis language
- **GitHub** - Version control and project management

## Folder Structure
```
assignment2/
├── README.md                    # Project documentation
├── Brief_Report.txt             # Summary of findings and analysis
├── brief.txt                    # Project brief/requirements
├── SQL script/
│      └── Sample - Superstore.csv
│      └── kaggle script.sql
|      |__task script.sql
└── query result
    │   
    └── screenshots/
```

## SQL Concepts Covered
✓ **Data Loading** - Importing CSV files into SQL database  
✓ **Schema Exploration** - Understanding table structure and relationships  
✓ **WHERE Clause** - Filtering data with specific conditions  
✓ **GROUP BY Aggregations** - Summarizing data by categories  
✓ **ORDER BY & LIMIT** - Sorting and limiting query results  
✓ **Aggregate Functions** - Using COUNT(), SUM(), AVG(), MAX(), MIN()  
✓ **Date Functions** - Working with temporal data for trend analysis  
✓ **Data Validation** - Identifying duplicates and ensuring data quality  

## Key Insights
- Analyzed monthly sales trends to identify peak and low-performing periods
- Identified top-performing customers by sales volume
- Detected and validated duplicate records in the dataset
- Explored product categories and their contribution to overall sales
- Evaluated data quality and integrity

## How to Run the Project

### Prerequisites
- MySQL Workbench installed on your system
- Access to the Superstore CSV dataset

### Steps
1. **Set Up Database:**
   - Open MySQL Workbench
   - Create a new database for the Superstore data

2. **Load Data:**
   - Import the `Sample - Superstore.csv` file into the database

3. **Explore Schema:**
   - Review the table structure and understand the data relationships

4. **Execute Queries:**
   - Open the SQL query files in the `kaggle queries/queries/` and `task queries/queries/` folders
   - Execute queries sequentially to understand the analysis process

5. **Review Results:**
   - Check the query outputs in MySQL Workbench
   - Refer to screenshots in the respective folders for expected results

## Files Included
- **queries on kaggle.sql** - Kaggle assignment queries and analysis
- **task queries.sql** - Additional task-based SQL queries
- **Sample - Superstore.csv** - The dataset file

## Conclusion
This project provides a practical introduction to SQL-based data analysis. By working through these queries, you gain hands-on experience with essential SQL operations used in real-world data analysis and business intelligence roles.

---
**Assignment:** Celebal Technologies Internship - Assignment 2  
**Date:** May 2026  
**Status:** Completed
