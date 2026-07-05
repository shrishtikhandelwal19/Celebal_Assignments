# Shopping App Dataset - Data Analysis & Cleaning

A comprehensive data analysis and cleaning project for e-commerce shopping app datasets. This project processes and analyzes product information across multiple categories from shopping platforms.

## 📋 assignment Overview

This repository contains scripts and datasets for analyzing product data from an e-commerce shopping platform. The project focuses on:
- Data cleaning and preprocessing
- Dataset consolidation and analysis
- Handling missing values and data quality issues
- Exploratory Data Analysis (EDA)

## 📁 assignment Structure

```
celebal_assignment1/
├── codes/
│   └── code.ipynb                    # Main Jupyter notebook for data analysis and cleaning
├── dataset/
│   ├── original_dataset.csv          # Consolidated dataset from all categories
│   ├── final_cleaned_dataset.csv     # Final cleaned and processed dataset
│   └── [category-specific CSV files] # Individual product category datasets
└── README.md                         # This file
```

## 📊 Dataset Details

### Data Columns

Each dataset contains the following fields:
- `product_id`: Unique product identifier
- `title`: Product name/title
- `product_description`: Detailed product description
- `rating`: Product rating (1-5)
- `ratings_count`: Number of customer ratings
- `initial_price`: Original price
- `discount`: Discount percentage
- `final_price`: Final selling price (after discount)
- `currency`: Currency (INR)
- `images`: Product image URLs
- `seller_name`: Name of the seller
- `sizes`: Available sizes
- `best_offer`: Best promotional offer
- `more_offers`: Additional offers
- `category`: Product category
- Additional metadata fields

## 🛠️ Tools & Libraries

- **Python 3.x**
- **Pandas**: Data manipulation and analysis
- **NumPy**: Numerical computing
- **Matplotlib**: Data visualization
- **Jupyter Notebook**: Interactive analysis environment

## 🚀 Getting Started

### Prerequisites
- Python 3.7 or higher
- Jupyter Notebook
- Required packages: pandas, numpy, matplotlib

### Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/celebal_assignment1.git
cd celebal_assignment1
```

2. Install required dependencies:
```bash
pip install pandas numpy matplotlib jupyter
```

3. Open Jupyter Notebook:
```bash
jupyter notebook
```

4. Navigate to `codes/code.ipynb` and run the cells

## 📝 Usage

1. **Load Data**: The notebook loads individual category CSV files from the `1stweek_dataset` directory
2. **Data Exploration**: Explore data structure, shape, and initial statistics
3. **Data Cleaning**: Handle missing values, duplicates, and data inconsistencies
4. **Analysis**: Perform statistical analysis and generate insights
5. **Export**: Cleaned data is exported as `final_cleaned_dataset.csv`

## 📈 Key Features

- ✅ Multi-category product data consolidation
- ✅ Missing value handling and data quality checks
- ✅ Exploratory data analysis (EDA)
- ✅ Data visualization and statistical summaries
- ✅ Processed and cleaned dataset export


## 🤝 Contributing

Contributions are welcome! Please feel free to submit pull requests or open issues for bugs and feature suggestions.

## 📄 License

This project is open source and available under the MIT License.

## ✉️ Contact

For questions or inquiries about this project, please open an issue on GitHub.

---

**Last Updated**: 2026-05-19  
**Project Type**: Data Analysis & Cleaning  
**Status**: Active
