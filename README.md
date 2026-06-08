# Celebal Technologies Internship Repository

A comprehensive collection of data analysis and SQL query assignments completed during the **Celebal Technologies Internship Program**.

---

## 📋 Project Overview

This repository showcases practical data analysis and business intelligence skills developed during the internship. The assignments focus on:

- **Data Analysis & Cleaning**: Processing and preprocessing real-world datasets
- **SQL Expertise**: Writing complex queries for data extraction and analysis
- **Database Management**: Working with normalized database structures

Each assignment includes complete source code, cleaned datasets, SQL scripts, detailed reports, and visual documentation through screenshots.

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
├── assignment1/
│   ├── code.ipynb                          # Jupyter notebook with data analysis code
│   ├── Combined_dataset.csv                # Combined dataset from multiple sources
│   ├── final_cleaned_dataset.csv           # Cleaned and processed dataset
│   ├── summary.txt                         # Summary of findings and insights
│   └── README.md                           # Assignment-specific documentation
│
├── assignment2/
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
├── Assignment3/
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
└── README.md                               # Main repository documentation (this file)
```

---

## 📊 Assignment 1: Data Analysis & Cleaning

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

## 📈 Assignment 2: SQL Sales Data Analysis

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

## 🧾 Assignment 3: Advanced SQL Customer Ranking

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
- `Assignment3/README.md` - Assignment-specific documentation
- `Assignment3/brief insights.txt` - Analysis summary and insights
- `Assignment3/sql_script/superstore_assignment_queries.sql`
- `Assignment3/sql_script/task_queries.sql`
- `Assignment3/sql_script/superstore_raw.csv`
- `Assignment3/query results/superstore_assignment_results.txt`
- `Assignment3/query results/task_results.txt`

---

## 🛠️ Tools & Technologies Used

### SQL
- Structured Query Language (SQL) for database operations
- Complex SELECT statements with WHERE, GROUP BY, HAVING, ORDER BY clauses
- AGGREGATE functions: SUM(), COUNT(), AVG(), MAX(), MIN()
- JOINs: INNER, LEFT, RIGHT joins for combining tables
- Subqueries and nested queries for advanced analysiss

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

---

## 🚀 How to Use This Repository

### Clone the Repository
```bash
git clone https://github.com/shrishtikhandelwal19/Celebal_Assignments.git
cd Celebal_Assignments
```

### Explore Assignment 1
```bash
cd assignment1/

# View the Jupyter Notebook
jupyter notebook code.ipynb

# Examine the cleaned dataset
head final_cleaned_dataset.csv
```

### Explore Assignment 2
```bash
cd assignment2/

# View SQL queries
cat "kaggle queries/queries on kaggle.sql"
cat "task queries/task queries.sql"

# Review the brief report
cat Brief_Report.txt
```

### Viewing Results
- SQL query screenshots: Check `assignment2/kaggle queries/screenshots/` and `assignment2/task queries/screenshots/`
- Detailed findings: Read `assignment2/Brief_Report.txt`
- Data insights: Review `assignment1/summary.txt`
- Analysis workflow: Examine `assignment1/code.ipynb`

---

## 📖 Conclusion

This repository demonstrates comprehensive learning and practical application of data analysis and SQL query development during the Celebal Technologies internship. The assignments collectively showcase:

The included datasets, SQL scripts, Jupyter notebooks, screenshots, and reports provide a complete reference for:
- Data validation and quality assurance techniques
- SQL analysis and database query optimization
- Business metrics calculation and analysis
- Professional reporting and documentation

---

## 📞 Contact & Links

- **GitHub Profile**: [shrishtikhandelwal19](https://github.com/shrishtikhandelwal19)
- **Repository**: [Celebal_Assignments](https://github.com/shrishtikhandelwal19/Celebal_Assignments)
- **Organization**: Celebal Technologies

---

**Last Updated**: May 31, 2026  
**Status**: Active & Maintained  
**Type**: Internship Portfolio
