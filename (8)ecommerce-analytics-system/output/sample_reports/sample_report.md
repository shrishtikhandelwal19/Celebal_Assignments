# E-Commerce Order Analytics — Business Report

**Report Date:** July 2026

---

## Executive Summary

This report presents key business insights derived from the E-Commerce Order Analytics System. Data was collected from four operational datasets, cleaned, loaded into a relational database, and analyzed using SQL. The findings highlight revenue performance, top customers, product rankings, and customer retention behavior across a 2-year period.

---

## Dataset Summary

| Dataset        | Total Records |
|----------------|---------------|
| Customers      | 520           |
| Products       | 520           |
| Orders         | 520           |
| Order Items    | 502           |

---

## Data Cleaning Summary

| Issue Found                    | Action Taken                          |
|-------------------------------|---------------------------------------|
| Duplicate customer rows       | 10 duplicates removed                 |
| NULL customer IDs in orders   | 20 records flagged, filled with 0     |
| Invalid email addresses       | 9 emails replaced with placeholder    |
| Mixed date formats            | Standardized to YYYY-MM-DD HH:MM:SS   |
| Orphan order items            | 18 records removed (invalid order ID) |

---

## Key Business Metrics

| Metric                  | Value          |
|-------------------------|----------------|
| Total Revenue           | $5,222,297.17  |
| Total Orders            | 322            |
| Average Order Value     | $16,218.31     |
| Unique Customers        | 324            |
| Total Items Sold        | 2,596          |

---

## Top 5 Customers by Revenue

| Rank | Customer Name    | Total Revenue  |
|------|------------------|----------------|
| 1    | Kevin Davis      | $102,716.05    |
| 2    | Erica Harris     | $100,931.96    |
| 3    | Melissa Mayer    | $94,872.99     |
| 4    | Samuel Zamora    | $88,584.10     |
| 5    | Andrea Figueroa  | $78,298.72     |

---

## Top 5 Products by Revenue

| Rank | Product Name      | Total Revenue |
|------|-------------------|---------------|
| 1    | People Near       | $72,045.26    |
| 2    | Your Skin         | $70,119.21    |
| 3    | Specific I        | $64,194.31    |
| 4    | Perhaps Picture   | $56,535.96    |
| 5    | Magazine Watch    | $55,797.22    |

---

## Revenue by Category

| Category     | Revenue        | Share  |
|--------------|----------------|--------|
| Books        | $1,602,402.72  | 30.7%  |
| Home         | $1,305,627.54  | 25.0%  |
| Clothing     | $1,260,054.06  | 24.1%  |
| Electronics  | $1,054,212.85  | 20.2%  |

---

## Monthly Revenue Summary (Last 6 Months)

| Month   | Orders | Revenue        |
|---------|--------|----------------|
| 2026-07 | 6      | $62,552.43     |
| 2026-06 | 11     | $133,819.58    |
| 2026-05 | 13     | $285,747.02    |
| 2026-04 | 14     | $326,832.13    |
| 2026-03 | 14     | $273,560.53    |
| 2026-02 | 10     | $99,988.54     |

> April 2026 was the highest revenue month in this period ($326,832) with 14 orders.

---

## Customer Segmentation Summary

| Segment         | Count | Description                       |
|-----------------|-------|-----------------------------------|
| Loyal           | 5     | More than 3 orders placed         |
| Occasional      | 130   | 2 to 3 orders placed              |
| One-time        | 189   | Exactly 1 order placed            |
| No Orders       | 196   | Registered but never ordered      |

**Spend Tier Breakdown:**

| Tier    | Count |
|---------|-------|
| Low     | 289   |
| High    | 189   |
| Medium  | 42    |

---

## Cohort / Retention Summary

- Customers are grouped into monthly cohorts based on their registration date.
- Retention is tracked across Month 0 (registration month), Month 1, and Month 2.
- Most cohorts show a sharp drop between Month 0 and Month 1, indicating low early retention.
- Only 5 customers qualify as loyal (4+ orders), suggesting a significant opportunity to improve repeat purchase rate.

---

## Key Findings

- **Books is the highest-grossing category**, contributing 30.7% of total revenue despite no obvious product pricing advantage over Electronics.
- **Top 5 customers alone contributed approximately 8.9% of total revenue**, showing high dependence on a small group of buyers.
- **37% of registered customers never placed a single order**, pointing to a weak onboarding or conversion funnel.
- **Average Order Value is $16,218**, which is high, suggesting customers tend to make fewer but larger purchases.
- **Monthly revenue dropped significantly in February 2026 ($99,988)** and again in July 2026, indicating possible seasonal dips that warrant targeted marketing campaigns.

---

## Conclusion

The E-Commerce analytics pipeline successfully processed raw, messy data into clean, structured insights. The business is generating healthy revenue with a high average order value, but suffers from low customer retention and a large inactive customer base. Priority actions should include a re-engagement campaign for the 196 customers who registered but never ordered, and loyalty programs to convert the 189 one-time buyers into repeat customers.

---

*This report was auto-generated by the E-Commerce Order Analytics System.*
