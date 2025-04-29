
# 📊 Sales Trend Analysis Using PostgreSQL

This project analyzes monthly revenue and order volume from a simulated `online_sales` dataset using SQL aggregate functions in PostgreSQL.

---

## 🧰 Tools & Technologies

- PostgreSQL
- SQL
- Aggregate Functions (SUM, COUNT)
- Date functions (`DATE_TRUNC`, `EXTRACT`)
- Grouping & Sorting

---

## 📁 Dataset Description

**Table: `online_sales`**

| Column Name | Type        | Description                     |
|-------------|-------------|---------------------------------|
| order_id    | SERIAL      | Unique order identifier         |
| order_date  | DATE        | Date when the order was placed  |
| amount      | NUMERIC     | Order amount in currency        |
| product_id  | INT         | Identifier for the product      |

---

## ⚙️ Setup Instructions

1. **Create the table** and **insert sample data**:
   ```sql
   CREATE TABLE online_sales (
       order_id SERIAL PRIMARY KEY,
       order_date DATE NOT NULL,
       amount NUMERIC(10,2) NOT NULL,
       product_id INT
   );

   INSERT INTO online_sales (order_date, amount, product_id)
   SELECT 
       date_trunc('day', (DATE '2023-01-01' + (random() * 364)::int)),
       round((random() * 100 + 10)::numeric, 2),
       (random() * 10 + 1)::int
   FROM generate_series(1, 1000);
   ```

2. **Run trend analysis** (Option 1 – using `DATE_TRUNC`):
   ```sql
   SELECT
       DATE_TRUNC('month', order_date) AS month,
       SUM(amount) AS total_revenue,
       COUNT(DISTINCT order_id) AS order_volume
   FROM online_sales
   GROUP BY month
   ORDER BY month;
   ```

---

## 📌 Key Concepts

| Concept | Description |
|--------|-------------|
| `DATE_TRUNC('month', order_date)` | Groups data by entire month |
| `EXTRACT(YEAR FROM ...)` & `EXTRACT(MONTH FROM ...)` | Splits year/month separately |
| `SUM(amount)` | Calculates monthly revenue |
| `COUNT(DISTINCT order_id)` | Calculates unique order volume |
| `ORDER BY` | Sorts final results |
| `GROUP BY` | Aggregates data per month/year |

---

## 🏆 Bonus Query: Top 3 Sales Months

```sql
SELECT
    DATE_TRUNC('month', order_date) AS month,
    SUM(amount) AS monthly_revenue
FROM online_sales
GROUP BY month
ORDER BY monthly_revenue DESC
LIMIT 3;
```

---

## 📚 Learning Outcome

- Understand how to group data by time periods
- Use aggregate functions to summarize data
- Write clear and useful analytical queries in SQL

---

## 📬 Contact

For help or questions, feel free to reach out via GitHub or email.
