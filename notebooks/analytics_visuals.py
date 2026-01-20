import pandas as pd
import os
import matplotlib.pyplot as plt
from sqlalchemy import create_engine

os.makedirs("../reports", exist_ok=True)
# PostgreSQL connection
engine = create_engine(
    "postgresql://postgres:YOUR_PASSWORD@localhost:5432/sales_dw"
)

print(" Connected to PostgreSQL")

query_total_revenue = """
SELECT SUM(COALESCE(final_amount, 0)) AS total_revenue
FROM dw.fact_sales;

"""

df_revenue = pd.read_sql(query_total_revenue, engine)
print("\nTotal Revenue:")
print(df_revenue)

total_revenue = df_revenue.loc[0, "total_revenue"]

with open("../reports/total_revenue.txt", "w") as f:
    f.write(f"Total Revenue: {total_revenue}")

print("Total revenue saved to reports/total_revenue.txt")

query_monthly = """
SELECT
    TO_CHAR(date_key, 'YYYY-MM') AS month,
    SUM(final_amount) AS revenue
FROM dw.fact_sales
GROUP BY month
ORDER BY month;
"""

df_monthly = pd.read_sql(query_monthly, engine)

plt.figure(figsize=(8,5))
plt.plot(df_monthly["month"], df_monthly["revenue"])
plt.title("Monthly Revenue Trend")
plt.xlabel("Month")
plt.ylabel("Revenue")
plt.xticks(rotation=45)
plt.tight_layout()
plt.savefig("../reports/monthly_revenue_trend.png")
plt.close()

print("monthly_revenue_trend.png saved")

query_products = """
SELECT
    p.product_name,
    SUM(f.final_amount) AS revenue
FROM dw.fact_sales f
JOIN dw.dim_product p ON f.product_id = p.product_id
GROUP BY p.product_name
ORDER BY revenue DESC
LIMIT 5;
"""

df_products = pd.read_sql(query_products, engine)

plt.figure(figsize=(8,5))
plt.bar(df_products["product_name"], df_products["revenue"])
plt.title("Top 5 Products by Revenue")
plt.xlabel("Product")
plt.ylabel("Revenue")
plt.xticks(rotation=45)
plt.tight_layout()
plt.savefig("../reports/top_5_products.png")
plt.close()

print("top_5_products.png saved")

query_region = """
SELECT
    c.customer_region,
    SUM(f.final_amount) AS revenue
FROM dw.fact_sales f
JOIN dw.dim_customer c ON f.customer_id = c.customer_id
GROUP BY c.customer_region
ORDER BY revenue DESC;
"""

df_region = pd.read_sql(query_region, engine)

plt.figure(figsize=(8,5))
plt.bar(df_region["customer_region"], df_region["revenue"])
plt.title("Revenue by Region")
plt.xlabel("Region")
plt.ylabel("Revenue")
plt.tight_layout()
plt.savefig("../reports/revenue_by_region.png")
plt.close()

print("revenue_by_region.png saved")


