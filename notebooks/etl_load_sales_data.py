import pandas as pd
from sqlalchemy import create_engine

# 1. Database connection
engine = create_engine(
    "postgresql://postgres:root@localhost:5432/sales_dw"
)

# 2. Load CSV
df = pd.read_csv("../data/truestate_assignment_dataset.csv")

# 3. Basic cleaning
df.columns = df.columns.str.lower().str.replace(" ", "_")

# 4. Load into staging table
df.to_sql(
    "stg_sales_raw",
    engine,
    schema="dw",
    if_exists="replace",
    index=False
)

print("Data loaded into staging table successfully")
