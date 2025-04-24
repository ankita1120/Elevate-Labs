
# 🛒 Superstore Sales Analysis – SQL + Python Visualizations

This project explores Superstore sales data using **SQL** for querying insights and **Python** (with `pandas`, `matplotlib`, `seaborn`) for visual storytelling.

---

## 📦 Dataset Overview

**Main Table:** `superstore_sales`  
Fields include order details, customer information, product categories, financials (sales, discount, profit), and dates.

---

## 🔍 SQL Analysis Summary

### ✅ Highlights:
- Orders with missing region
- Orders shipped late
- Top 5 selling products
- Sales, profit by category/region/month
- Orders with above-average sales
- Most profitable customers
- High discount, low profit products
- Customers with max sales in a region
- Subqueries, `JOIN`, filtering using `IN`, `BETWEEN`, `NOT`, etc.

---

## 🧠 Business Insights Uncovered

- 🔝 **Top-performing categories & regions**
- 💸 **Sales trends by month**
- 📉 **Loss-making product lines with heavy discounts**
- 🚚 **Orders with delayed shipping**
- 👥 **High-value customers by region and product segment**

---

## 📈 Python Visualization Guide

### ✅ Tools Used

- `pandas` – Data wrangling
- `matplotlib` – Static plots
- `seaborn` – Enhanced statistical plots

### 📦 Installation

Set up a virtual environment and install dependencies:

```bash
# Create virtual environment
python -m venv venv
source venv/bin/activate  # or venv\Scripts\activate on Windows

# Install dependencies
pip install pandas matplotlib seaborn
```

### 📊 Sample Visuals

| Visualization             | Python Used                     |
|---------------------------|----------------------------------|
| 📊 Total Sales by Category | `bar chart` via `matplotlib`   |
| 📈 Monthly Sales Trend      | `line plot` via `seaborn`       |
| 📉 Top 5 Products by Sales | `horizontal bar chart`         |
| 🎯 High Discount, Low Profit | `scatter plot` using `seaborn` |
| 📊 Region Sales vs Profit  | `grouped bar chart`            |

---

## 🧪 Running the Python Notebook

Use Jupyter Notebook or any Python IDE:

```bash
jupyter notebook
```

Open the file: `superstore_visuals.ipynb`

Or, create and run a new script:

```python
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Load data
df = pd.read_csv('superstore_sales.csv')
df['Order_Date'] = pd.to_datetime(df['Order_Date'])

# Example: Total Sales by Category
df.groupby('Category')['Sales'].sum().plot(kind='bar', color='skyblue')
plt.title('Total Sales by Category')
plt.ylabel('Sales')
plt.show()
```

---

## 📁 Folder Structure

```
superstore-sales-analysis/
│
├── sql_queries.sql            # All SQL queries
├── README.md                  # This file
├── superstore_sales.csv       # Raw data
├── superstore_visuals.ipynb   # Python visual notebook
├── visualizations/            # Optional: saved plots
└── requirements.txt           # Python deps
```

---

## ✅ Next Steps

- Integrate with **Power BI / Tableau** for dashboards
- Add **interactive filters** with Plotly Dash
- Automate reporting with **scheduled Python scripts**
