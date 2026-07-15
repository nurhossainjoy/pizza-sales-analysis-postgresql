# 🍕 Pizza Sales Analysis Using PostgreSQL

## 📌 Project Overview

This project presents a comprehensive SQL analysis of a Pizza Sales dataset using **PostgreSQL**. The objective is to transform raw transactional data into meaningful business insights by answering real-world analytical questions related to sales performance, customer purchasing behavior, revenue generation, and product popularity.

The analysis demonstrates fundamental to advanced SQL concepts including joins, aggregate functions, Common Table Expressions (CTEs), window functions, ranking functions, and date/time analysis.

---

## 🎯 Project Objectives

- Analyze overall business performance.
- Calculate total revenue and total orders.
- Identify best-selling pizzas.
- Determine customer ordering patterns.
- Analyze revenue contribution by pizza category.
- Calculate cumulative revenue over time.
- Rank pizzas based on sales performance.
- Practice writing optimized PostgreSQL queries for business analytics.

---

# 🗂 Dataset

The project consists of four relational tables.

| Table | Description |
|--------|-------------|
| **orders** | Stores order date and time information. |
| **order_details** | Stores individual pizzas included in each order. |
| **pizzas** | Stores pizza sizes and prices. |
| **pizza_types** | Stores pizza names, categories, and ingredients. |

---

# 🗃 Database Schema

![Database Schema](Images/Database_Schema.png)

---

# 📊 Entity Relationship (ER) Diagram

![ER Diagram](Images/ER_Diagram.png)

---

# 🛠 Technologies Used

- PostgreSQL
- pgAdmin 4
- SQL
- CSV Dataset
- Git
- GitHub

---

# 📚 SQL Concepts Demonstrated

This project demonstrates practical applications of:

- SELECT Statement
- Filtering (WHERE)
- ORDER BY
- GROUP BY
- Aggregate Functions
- INNER JOIN
- LEFT JOIN
- Common Table Expressions (CTEs)
- Window Functions
- Ranking Functions
  - RANK()
  - DENSE_RANK()
- Date & Time Functions
- EXTRACT()
- ROUND()
- CASE Statement
- Subqueries

---

# 📈 Business Questions Solved

### Basic Analysis

1. Retrieve the total number of orders placed.
2. Calculate the total revenue generated from pizza sales.
3. Identify the highest-priced pizza.
4. Identify the most common pizza size ordered.
5. List the top five most ordered pizza types.

---

### Intermediate Analysis

6. Calculate the total quantity of pizzas ordered for each category.
7. Determine the distribution of customer orders by hour.
8. Calculate the category-wise distribution of pizzas.
9. Calculate the average number of pizzas ordered per day.
10. Determine the top three pizza types based on revenue.

---

### Advanced Analysis

11. Calculate the percentage contribution of each pizza category to total revenue.
12. Analyze cumulative revenue generated over time.
13. Determine the top three highest revenue-generating pizzas within each category.

---

# 📂 Repository Structure

```
Pizza-Sales-SQL-Analysis
│
├── Dataset
│   ├── order_details.csv
│   ├── orders.csv
│   ├── pizzas.csv
│   └── pizza_types.csv
│
├── Images
│   ├── Database_Schema.png
│   └── ER_Diagram.png
│
├── Results
│   ├── Query Results.xlsx
│   └── Screenshots
│
├── SQL
│   └── Pizza_Sales_Analysis.sql
│
├── README.md
│
├── LICENSE
│
└── .gitignore
```

---

# 📌 Key SQL Techniques Used

### Joins

- INNER JOIN
- LEFT JOIN

### Aggregate Functions

- COUNT()
- SUM()
- AVG()
- ROUND()
- MAX()

### Window Functions

- SUM() OVER()
- DENSE_RANK()
- RANK()

### Date Functions

- EXTRACT()
- DATE

### Advanced SQL

- Common Table Expressions (CTEs)
- Ranking Analysis
- Revenue Contribution Analysis
- Cumulative Revenue Analysis

---

# 📷 Sample Output

The project includes screenshots and result files demonstrating:

- Revenue Analysis
- Best Selling Pizzas
- Hourly Sales Trend
- Revenue Contribution
- Category Analysis
- Cumulative Revenue

*(See the **Results** folder.)*

---

# 💡 Key Insights

- Identified the highest revenue-generating pizzas.
- Determined customer ordering patterns throughout the day.
- Analyzed revenue contribution by pizza category.
- Ranked top-performing pizzas using window functions.
- Calculated cumulative revenue trends over time.
- Produced business-ready analytical reports using SQL.

---

# 🚀 Learning Outcomes

Through this project, I strengthened my understanding of:

- Relational Database Design
- Data Cleaning
- Business Analytics
- SQL Query Optimization
- Window Functions
- PostgreSQL
- Writing production-quality SQL queries
- Solving real-world business problems using SQL

---

# ▶️ How to Run This Project

### Clone the repository

```bash
git clone https://github.com/yourusername/pizza-sales-sql-analysis.git
```

### Open PostgreSQL

Launch **pgAdmin 4** or connect using your preferred PostgreSQL client.

### Create Schema

```sql
CREATE SCHEMA pizza_sales_project;
```

### Import CSV Files

Import all CSV files into the schema:

- orders
- order_details
- pizzas
- pizza_types

### Execute SQL Script

Run:

```
SQL/Pizza_Sales_Analysis.sql
```

---

# 📁 Dataset Source

**Maven Analytics Pizza Sales Dataset**

This dataset is publicly available for learning and portfolio projects.

---

# 🤝 Contributing

Contributions, suggestions, and improvements are welcome.

Feel free to fork the repository and submit a pull request.

---

# 📄 License

This project is licensed under the MIT License.

---

# 👨‍💻 Author

**MD Nur Hossain Joy**

- GitHub: https://github.com/nurhossainjoy
- LinkedIn: *https://www.linkedin.com/in/md-nur-hossain-joy-0b0bb9190/*

---

## ⭐ If you found this project useful, please consider giving it a star!
