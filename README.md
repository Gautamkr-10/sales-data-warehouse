# 📊 Sales Analytics Data Warehouse & BI Dashboard

An end-to-end **Data Analytics project** demonstrating real-world data modeling, ETL, SQL analytics, Python reporting, and Metabase dashboarding on a large sales dataset.

This project simulates how raw transactional data is transformed into **business-ready insights** using modern analytics tools.

---

## 🚀 Project Overview

The goal of this project is to build a **Sales Analytics System** that enables decision-makers to analyze revenue, customer behavior, product performance, and regional trends.

- Dataset Size: **~1,000,000 sales records**
- Architecture: **Star Schema (Fact & Dimension tables)**
- Analytics Layers: **SQL, Python, BI Dashboard**

---

## 🏗️ Architecture
```
Raw CSV Data
↓
Staging Table (PostgreSQL)
↓
Dimension Tables
(Customer, Product, Store, Date, Employee)
↓
Fact Table (Sales)
↓
Analytics Layer
(SQL Queries & Python Scripts)
↓
BI Dashboards (Metabase)
```

## 🛠️ Technologies Used

- **Database:** PostgreSQL  
- **Query Language:** SQL  
- **Programming:** Python (Pandas, Matplotlib, SQLAlchemy)  
- **BI Tool:** Metabase  
- **Version Control:** Git & GitHub  

---

## 📁 Project Structure
```
sales-data-warehouse/
│
├── data/
│ └── (dataset excluded due to size)
│
├── sql/
│ ├── create_tables.sql
│ ├── load_dimensions.sql
│ ├── load_fact.sql
│ └── analytics_queries.sql
│
├── notebooks/
│ ├── etl_load_sales_data.py
│ └── analytics_visuals.py
│
├── reports/
│ ├── total_revenue.txt
│ ├── monthly_revenue_trend.png
│ ├── top_5_products.png
│ └── revenue_by_region.png
│
└── README.md
```

---

## 🔄 ETL Process

1. Loaded raw CSV data into a **staging table**
2. Cleaned and standardized data (dates, nulls, duplicates)
3. Built **dimension tables** with deduplication logic
4. Loaded **fact table** using join-based inserts to maintain referential integrity
5. Validated data consistency across SQL and Python analytics

---

## 📊 Analytics Performed

### 🔹 SQL Analytics
- Total Revenue calculation
- Monthly revenue trends
- Revenue by region
- Top products by revenue
- Customer segmentation analysis

### 🔹 Python Analytics
- Automated SQL querying using Pandas
- Revenue aggregation and trend analysis
- Generated and saved charts using Matplotlib

### 🔹 BI Dashboards (Metabase)
- KPI card for Total Revenue
- Interactive Monthly Revenue Trend
- Revenue by Region bar chart
- Top Products performance analysis

---

## 📈 Key Insights

- Total Revenue: **₹5.68+ Billion**
- Clear seasonal revenue patterns identified
- Regional performance comparison enabled
- High-value products and customer segments identified

---

## 🧠 Key Learnings

- Star schema data modeling
- ETL pipeline design and debugging
- Handling foreign keys and duplicates
- SQL joins and aggregations at scale
- Python-based analytics automation
- BI dashboard creation for business users

---

## ▶️ How to Run the Project

### 1️⃣ Database Setup
- Create PostgreSQL database
- Run SQL scripts in `/sql` folder

### 2️⃣ Run Python Analytics
```bash
python notebooks/analytics_visuals.py
```

### Run Metabase
```
java -jar metabase.jar
```
### Access Metabase at:
```
http://localhost:3000
```
### MetaBase Dashboard
<img width="1898" height="868" alt="Screenshot (431)" src="https://github.com/user-attachments/assets/5a75df3f-50dd-44ac-9bf2-6e13b754f6c8" />
