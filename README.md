# ChocSales SQL Analysis

A hands-on SQL project that explores a chocolate sales dataset using **Microsoft SQL Server (T-SQL)**. It walks step by step from basic `SELECT` queries to advanced window functions, CTEs, and `CASE` logic, with comments explaining each query.

---

## Repository Structure

```
├── ChocSales.csv                         # Dataset (1,094 sales records)
├── Chocsales_Data_Combined_Queries.sql   # All queries, organized by topic
└── README.md
```

---

## Dataset

**File:** `ChocSales.csv` | **Rows:** 1,094 | **Columns:** 6 | **Missing values:** 0

| Column | Description | Type |
|---|---|---|
| `Sales_Person` | Name of the salesperson (25 unique) | Text |
| `Country` | Sales country: UK, India, Australia, New Zealand, USA, Canada | Text |
| `Product` | Chocolate product sold (22 unique) | Text |
| `Date` | Date of sale (Jan 2022 to Aug 2022) | Date |
| `Amount` | Sale amount | Integer |
| `Boxes_Shipped` | Number of boxes shipped | Integer |

> **Note:** The CSV header uses spaces (`Sales Person`, `Boxes Shipped`). When importing into SQL Server, name the columns `Sales_Person` and `Boxes_Shipped` so the queries run as written.

---

## Tech Stack

- **Database:** Microsoft SQL Server
- **Language:** T-SQL
- **Tool:** SQL Server Management Studio (SSMS)

---

## Topics Covered

| # | Topic | Concepts Practiced |
|---|---|---|
| 1 | **Basic Queries** | `SELECT`, column selection, `WHERE`, `DISTINCT`, `ORDER BY`, `TOP`, `TOP PERCENT` |
| 2 | **Aggregate Functions** | `SUM`, `AVG`, `MAX`, `MIN`, `COUNT` |
| 3 | **Filtering & Operators** | `=`, `<>`, `>=`, `<=`, `AND`, `OR`, `NOT`, `IN`, `BETWEEN` |
| 4 | **Pattern Matching** | `LIKE` with wildcards `%`, `_`, `[ ]`, `[^ ]` |
| 5 | **GROUP BY** | Sales by country, product, salesperson, and month; Top/Bottom N |
| 6 | **HAVING** | Filtering aggregated results |
| 7 | **CTEs** | `WITH` clauses, multi-step calculations, comparing against averages |
| 8 | **OVER()** | Window aggregates without collapsing rows |
| 9 | **PARTITION BY** | Per-group calculations while keeping every row |
| 10 | **ROW_NUMBER()** | Ranking, top sale per salesperson, latest sale per country, Nth highest value |
| 11 | **DENSE_RANK()** | Ranking with ties |
| 12 | **NTILE()** | Quartile bucketing |
| 13 | **LEAD() / LAG()** | Next/previous row comparisons, next sale date |
| 14 | **Running Total** | `SUM() OVER(... ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)` |
| 15 | **Text Functions** | `LEN`, `UPPER`, `LOWER`, `LEFT`, `RIGHT`, `TRIM`, `CONCAT`, `REPLACE`, `CHARINDEX`, `REVERSE`, `SUBSTRING` |
| 16 | **UNION / UNION ALL** | Combining result sets |
| 17 | **CASE** | Performance labels, amount slabs, country codes |

---

## Sample Queries

**Top 5 products by total sales**
```sql
SELECT TOP 5 [Product], SUM(Amount) AS total_sales
FROM ChocSales
GROUP BY [Product]
ORDER BY total_sales DESC;
```

**Highest sale of each salesperson (ROW_NUMBER)**
```sql
SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY Sales_Person ORDER BY Amount DESC) AS Row_Num
    FROM ChocSales
) AS SalesData
WHERE Row_Num = 1;
```

**Countries with above-average total sales (CTE)**
```sql
WITH Tq1 AS (
    SELECT Country, SUM(Amount) AS TotalCountrySales
    FROM ChocSales
    GROUP BY Country
)
SELECT *
FROM Tq1
WHERE TotalCountrySales > (SELECT AVG(TotalCountrySales) FROM Tq1);
```

**Salesperson performance bands (CASE)**
```sql
SELECT Sales_Person,
       SUM(Amount) AS Total_Sales,
       CASE
           WHEN SUM(Amount) < 100000 THEN 'LESS'
           WHEN SUM(Amount) < 200000 THEN 'AVERAGE'
           WHEN SUM(Amount) < 250000 THEN 'GOOD'
           ELSE 'VERY GOOD'
       END AS Sales_Performance
FROM ChocSales
GROUP BY Sales_Person
ORDER BY Total_Sales DESC;
```

---

## How to Run

1. **Create a database** in SQL Server (or use an existing one).
2. **Import the data:** in SSMS, right-click the database → *Tasks* → *Import Flat File…* → select `ChocSales.csv`. Name the table `ChocSales`, and make sure the column names are `Sales_Person` and `Boxes_Shipped`.
3. **Open** `Chocsales_Data_Combined_Queries.sql` in SSMS.
4. **Run queries** one at a time by highlighting a query and pressing `F5`.

---

## Key Learnings

- Difference between `GROUP BY` (collapses rows) and `OVER()` / `PARTITION BY` (keeps rows).
- `ROW_NUMBER()` vs `RANK()` vs `DENSE_RANK()`, and how to filter ranked results using a subquery or CTE.
- Using CTEs to break complex logic into readable steps.
- `WHERE` filters rows before grouping; `HAVING` filters groups after aggregation.
- Using `LEAD()` and `LAG()` to compare rows without self-joins.

---

## Author

**Vikrant Kumar**
