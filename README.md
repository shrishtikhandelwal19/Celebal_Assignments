# Celebal Technologies Internship Repository

A comprehensive collection of data analysis and SQL query assignments completed during the **Celebal Technologies Internship Program**.

---

## 📋 Project Overview

This repository showcases practical data analysis and business intelligence skills developed during the internship. The assignments focus on:

- **Data Analysis & Cleaning**: Processing and preprocessing real-world datasets
- **Spark Processing**: Building a data pipeline using PySpark
- **SQL Expertise**: Writing complex queries for data extraction and analysis
- **Database Management**: Working with normalized database structures

Each assignment includes complete source code, cleaned datasets, SQL scripts, detailed reports, and visual documentation through screenshots. Assignment 4 additionally includes Azure Data Factory implementation with metadata validation and cloud pipeline documentation.

---

## 🎓 Internship Details

- **Organization**: Celebal Technologies
- **Program**: Internship Program (Data Analysis & SQL)
- **Duration**: Multiple assignments over internship period
- **Focus Areas**: Data Analysis, SQL Queries, etc
- **Repository Owner**: [shrishtikhandelwal19](https://github.com/shrishtikhandelwal19)

---

## 📁 Repository Structure

```
Celebal_Assignments/
│
├── (1)Basic_Pandas_Assignmnet/
│   ├── code.ipynb                          # Jupyter notebook with data analysis code
│   ├── Combined_dataset.csv                # Combined dataset from multiple sources
│   ├── final_cleaned_dataset.csv           # Cleaned and processed dataset
│   ├── summary.txt                         # Summary of findings and insights
│   └── README.md                           # Assignment-specific documentation
│
├── (2)SQL_Assignmnet/
│   ├── Brief_Report.txt                    # Executive summary of SQL analysis
│   ├── README.md                           # Assignment-specific documentation
│   │
│   ├── SQL script/
│   │   ├── kaggle script.sql               # SQL queries for Kaggle dataset exploration
│   │   ├── Sample - Superstore.csv         # Sample dataset (Kaggle Superstore)
│   │   └── task script.sql                 # Business requirement SQL queries
│   │       
│   │
│   └── query results                       #result of queries in screenhsots
│       └── screenshots/
│           └── (Query result screenshots and analysis)
│
├── (3)Subqueries_Assignmnet/
│   ├── README.md                           # Assignment-specific documentation
│   ├── brief insights.txt                  # Business insights and analysis summary
│   ├── sql_script/
│   │   ├── superstore_assignment_queries.sql
│   │   ├── task_queries.sql
│   │   └── superstore_raw.csv
│   └── query results/
│       ├── superstore_assignment_results.txt
│       └── task_results.txt
│
├── (4)Azure_Assignmnet/
│   ├── README.md                           # Azure Data Factory assignment documentation
│   ├── SUMMARY.md                          # Assignment 4 project summary
│   ├── mini project screenshots/           # Implementation screenshots
│   ├── objective screesnhots/              # Objective and architecture screenshots
│   └── Task screenshots/                   # Pipeline execution and validation screenshots
│
├── (5)Spark_Assignmnet/
│   ├── README.md                           # Spark assignment documentation
│   ├── data/
│   │   └── sample-superstore.csv           # Superstore dataset for Spark processing
│   ├── notebook/
│   │   └── spark_basics.ipynb              # PySpark notebook for data processing
│   └── output/
│       └── results.csv                     # Processed output data
├── (6)Pysaprk_Assignmnet/
│   ├── README.md                           # Assignment-specific documentation
│   ├── sample-superstore.csv               # Superstore dataset for Spark processing
│   ├── spark codes/
│   │   └── pyspark codes.ipynb             # PySpark notebook for Spark-based processing
│   ├── output_csv/
│   │   └── part-00000-c42043bd-49e9-4b80-b04c-e2fe9337cb2f-c000.csv
│   └── output_parquet/
│       └── part-00000-387e06a4-cf9c-4165-974d-15b59ed0d468-c000.snappy.parquet
├── (7)delta_lake_assignmnet/
│   ├── README.md                           # Delta Lake assignment documentation
│   ├── data/
│   │   ├── Customer_Incremnetal.csv
│   │   └── Customer_master.csv
│   ├── notebook/
│   │   └── delta_scd_assignmnet.ipynb
│   ├── report/
│   │   └── Delta_Lake_Assignment_Report.md
│   └── screenshots/
│       └── (Implementation and validation screenshots)
└── README.md                               # Main repository documentation (this file)
```

---

## � Assignments Overview

| # | Assignment | Focus Area | Technologies |
|---|---|---|---|
| 1 | Basic Pandas Assignment | Data analysis and cleaning | Python, Pandas, NumPy, Jupyter |
| 2 | SQL Sales Data Analysis | SQL-based sales reporting and analysis | SQL, MySQL Workbench, CSV |
| 3 | Advanced SQL Customer Ranking | Subqueries, CTEs, ranking, and segmentation | SQL, MySQL Workbench |
| 4 | Azure Data Factory & Metadata Validation | Cloud data movement and validation | Azure, ADF, Blob Storage, IAM |
| 5 | Spark Data Processing | PySpark data processing pipelines | PySpark, Apache Spark |
| 6 | PySpark Processing and Output Generation | Spark-based ETL and output generation | PySpark, Spark, Parquet |
| 7 | Delta Lake Assignment | Delta Lake and SCD implementation | Delta Lake, PySpark, Python |

---

## 📊 (1)Basic_Pandas_Assignmnet: Basic Pandas Assignment

**Objective**: Process and analyze e-commerce shopping app data through data cleaning, preprocessing, and exploratory data analysis.

**Key Deliverables**:
- ✅ Jupyter Notebook with complete Python implementation
- ✅ Data validation and quality checks
- ✅ Handling of missing values and duplicates
- ✅ Exploratory Data Analysis (EDA) with visualizations
- ✅ Final cleaned dataset ready for further analysis

**Technologies Used**:
- Python 3.x
- Pandas, NumPy for data manipulation
- Matplotlib for data visualization
- Jupyter Notebook for interactive analysis

**Files Included**:
- `code.ipynb` - Complete analysis workflow
- `Combined_dataset.csv` - Consolidated raw data
- `final_cleaned_dataset.csv` - Processed output
- `summary.txt` - Key findings and insights

---

## 📈 (2)SQL_Assignmnet: SQL Sales Data Analysis

**Objective**: Comprehensive analysis of e-commerce sales data using the Superstore Kaggle Dataset to derive business intelligence and answer complex analytical queries.

**Dataset**: Superstore Sales Dataset from Kaggle
- Contains multiple years of transactional data
- Includes customer, order, product, and sales information

**Key Deliverables**:
- ✅ 20+ SQL queries for data exploration and analysis
- ✅ Aggregations and GROUP BY operations for business metrics
- ✅ Query optimization for performance
- ✅ Visual documentation with screenshots
- ✅ Brief report with analytical findings

**Files Included**:
- `kaggle script.sql` - Initial exploratory SQL queries
- `task script.sql` - Business-specific SQL queries
- `Sample - Superstore.csv` - Dataset sample
- `Brief_Report.txt` - Findings and recommendations
- `screenshots/` - Query execution results and visualizations

---

## 🧾 (3)Subqueries_Assignmnet: Advanced SQL Customer Ranking

**Objective**: Analyze Superstore sales performance by building a normalized SQL dataset and applying advanced query techniques to identify top customers, customer rankings, and revenue insights.

**Dataset**: Superstore sales dataset loaded from `superstore_raw.csv`.

**Key Deliverables**:
- ✅ SQL scripts using subqueries, CTEs, and window functions
- ✅ Normalized tables for customers, orders, products, and order items
- ✅ Business-focused ranking and customer segmentation analysis
- ✅ Output files capturing query results and insights
- ✅ Assignment-level documentation

**SQL Concepts Used**:
- **Subqueries** for nested filtering and business-rule derivation
- **CTEs** to structure intermediate calculations and make queries readable
- **Window Functions** such as `RANK()` and `ROW_NUMBER()` for ranking and sequencing
- **JOINs** for combining customer, order, and product datasets
- **Aggregations** for computing totals, averages, and order counts

**Files Included**:
- `(3)Subqueries_AssignmnetREADME.md` - Assignment-specific documentation
- `(3)Subqueries_Assignmnet/brief insights.txt` - Analysis summary and insights
- `(3)Subqueries_Assignmnet/sql_script/superstore_assignment_queries.sql`
- `(3)Subqueries_Assignmnet/sql_script/task_queries.sql`
- `(3)Subqueries_Assignmnet/sql_script/superstore_raw.csv`
- `(3)Subqueries_Assignmnet/query results/superstore_assignment_results.txt`
- `(3)Subqueries_Assignmnet/query results/task_results.txt`

---

## ☁️ (4)Azure_Assignmnet 4: Azure Data Factory & Metadata Validation

**Objective**: Build an Azure Data Factory pipeline that performs metadata validation and moves data from an Azure Blob Storage source container to a destination container.

**Key Deliverables**:
- ✅ Azure Data Factory pipeline with metadata validation
- ✅ Source and destination Azure Blob Storage configuration
- ✅ IAM role configuration for secure access
- ✅ Pipeline execution and monitoring documentation
- ✅ Assignment-specific README and summary files

**Technologies Used**:
- Microsoft Azure
- Azure Blob Storage
- Azure Data Factory
- IAM (Reader and Contributor roles)
- Metadata Validation

**Files Included**:
- `(4)Azure_Assignmnet/README.md` - Assignment-specific documentation
- `(4)Azure_Assignmnet/SUMMARY.md` - Project summary and outcome
- `(4)Azure_Assignmnet/mini project screenshots/` - Visual implementation references
- `(4)Azure_Assignmnet/objective screesnhots/` - Architecture and objective screenshots
- `(4)Azure_Assignmnet/Task screenshots/` - Pipeline execution and monitoring screenshots

---

## 🚀(5)Spark_Assignmnet: Spark Data Processing

**Objective**: Use PySpark to process the Superstore dataset and build a simple data pipeline.

**Key Topics**:
- Spark Fundamentals
- Data Cleaning
- Filtering
- Aggregations
- GroupBy Operations
- Schema Modifications
- Data Processing Pipeline

**Files Included**:
- `(5)Spark_Assignmnet/README.md`
- `(5)Spark_Assignmnet/data/sample-superstore.csv`
- `(5)Spark_Assignmnet/notebook/spark_basics.ipynb`
- `(5)Spark_Assignmnet/output/results.csv`

---

## 🚀 (6)Pysaprk_Assignmnet: PySpark Processing and Output Generation

**Objective**: Build and run a PySpark pipeline to process the Superstore dataset, generate clean output files, and explore the data using Spark notebooks.

**Key Deliverables**:
- ✅ `(6)Pysaprk_Assignmnet/README.md`
- ✅ `(6)Pysaprk_Assignmnet/sample-superstore.csv`
- ✅ `(6)Pysaprk_Assignmnet/spark codes/pyspark codes.ipynb`
- ✅ `(6)Pysaprk_Assignmnet/output_csv/part-00000-c42043bd-49e9-4b80-b04c-e2fe9337cb2f-c000.csv`
- ✅ `(6)Pysaprk_Assignmnet/output_parquet/part-00000-387e06a4-cf9c-4165-974d-15b59ed0d468-c000.snappy.parquet`

**Technologies Used**:
- PySpark
- Apache Spark
- CSV and Parquet file formats
- Jupyter Notebook

---

## 🧠 (7)delta_lake_assignmnet: Delta Lake Assignment

**Objective**: Implement a Delta Lake-based data pipeline with Slowly Changing Dimensions (SCD) logic to manage incremental customer data updates and maintain historical accuracy.

**Key Deliverables**:
- ✅ Delta Lake notebook for data loading and transformation
- ✅ Customer master and incremental dataset processing
- ✅ SCD Type 1 and Type 2 implementation workflow
- ✅ Validation and reporting outputs for final comparison
- ✅ Assignment-specific documentation and screenshots

**Technologies Used**:
- Python
- PySpark
- Delta Lake
- Jupyter Notebook
- CSV and Parquet-based data processing

**Files Included**:
- `(7)delta_lake_assignmnet/README.md` - Assignment-specific documentation
- `(7)delta_lake_assignmnet/data/Customer_master.csv` - Base customer dataset
- `(7)delta_lake_assignmnet/data/Customer_Incremnetal.csv` - Incremental updates
- `(7)delta_lake_assignmnet/notebook/delta_scd_assignmnet.ipynb` - Implementation notebook
- `(7)delta_lake_assignmnet/report/Delta_Lake_Assignment_Report.md` - Summary report
- `(7)delta_lake_assignmnet/screenshots/` - Validation and output screenshots

---

## 🛠️ Tools & Technologies Used

### Azure Cloud Services
- Microsoft Azure for cloud orchestration
- Azure Blob Storage for source and destination containers
- Azure Data Factory for pipeline orchestration and metadata validation
- Azure IAM roles including Reader and Contributor access
- Metadata Validation workflows for file integrity checks

### SQL
- Structured Query Language (SQL) for database operations
- Complex SELECT statements with WHERE, GROUP BY, HAVING, ORDER BY clauses
- AGGREGATE functions: SUM(), COUNT(), AVG(), MAX(), MIN()
- JOINs: INNER, LEFT, RIGHT joins for combining tables
- Subqueries and nested queries for advanced analyses

### MySQL Workbench
- Database management and administration
- Query execution and result analysis
- Performance monitoring and optimization

### VS Code
- Code editor for SQL and documentation
- Git integration for version control
- Extensions for enhanced productivity
- Markdown support for documentation

### Python & Jupyter Notebook
- Python programming for data analysis
- Jupyter Notebook for interactive analysis and visualization
- Data exploration and statistical analysis

---

## 📚 SQL Concepts Covered

### Query Fundamentals
- **SELECT**: Retrieving data columns from tables
- **WHERE**: Filtering records based on specific conditions
- **ORDER BY**: Sorting results in ascending or descending order
- **LIMIT**: Restricting the number of returned rows

### Aggregation & Grouping
- **GROUP BY**: Grouping records by one or multiple columns
- **HAVING**: Filtering grouped data with aggregate conditions
- **Aggregate Functions**: 
  - SUM() - Calculate totals
  - COUNT() - Count records
  - AVG() - Calculate averages
  - MAX() - Find maximum values
  - MIN() - Find minimum values

### Advanced Operations
- **JOINs**: Combining data from multiple tables
  - INNER JOIN for matching records
  - LEFT JOIN for preserving left table data
  - RIGHT JOIN for preserving right table data
- **Subqueries**: Nested queries for complex analysis
- **CTEs**: Common Table Expressions for reusable intermediate result sets
- **Window Functions**: Ranking and row-sequencing using functions like `RANK()` and `ROW_NUMBER()`
- **Data Validation**: Ensuring data accuracy and consistency
- **Query Optimization**: Writing efficient SQL statements for performance

### Practical Applications
- Business metric calculations (revenue, profit, average orders)
- Customer and product analysis
- Sales trend analysis

---

## 🎯 Key Learnings

### 1. Data Quality & Preparation
- Importance of data cleaning for reliable analysis
- Validation techniques to prevent erroneous conclusions
- Preprocessing impact on downstream analysis quality
- Handling missing values, duplicates, and inconsistencies

### 2. SQL Proficiency
- Writing efficient and readable SQL queries
- Understanding query execution plans and optimization
- Working with normalized database structures
- Combining multiple tables using JOINs effectively
- Using aggregate functions for business metrics

### 3. Database Design & Management
- Normalized database structures and relationships
- Primary and foreign keys for data integrity
- Index optimization for query performance
- Table relationships and dependency management

## 📖 Conclusion

This repository demonstrates comprehensive learning and practical application of data analysis and SQL query development during the Celebal Technologies internship. The assignments collectively showcase:

The included datasets, SQL scripts, Jupyter notebooks, screenshots, and reports provide a complete reference for:
- Data validation and quality assurance techniques
- SQL analysis and database query optimization
- Business metrics calculation and analysis
- Professional reporting and documentation

**Last Updated**: 5 jul, 2026  
**Status**: Active & Maintained  
**Type**: Internship Portfolio
