-- ===============================
-- LOAD DIMENSION TABLES
-- ===============================

-- Customer Dimension
INSERT INTO dw.dim_customer
SELECT DISTINCT
    customer_id,
    customer_name,
    phone_number,
    gender,
    age,
    customer_region,
    customer_type
FROM dw.stg_sales_raw
WHERE customer_id IS NOT NULL;

-- Product Dimension
INSERT INTO dw.dim_product
SELECT DISTINCT
    product_id,
    product_name,
    brand,
    product_category,
    tags
FROM dw.stg_sales_raw
WHERE product_id IS NOT NULL;

-- Store Dimension
INSERT INTO dw.dim_store
SELECT DISTINCT
    store_id,
    store_location
FROM dw.stg_sales_raw
WHERE store_id IS NOT NULL;

-- Employee Dimension
INSERT INTO dw.dim_employee
SELECT DISTINCT
    salesperson_id,
    employee_name
FROM dw.stg_sales_raw
WHERE salesperson_id IS NOT NULL;

-- Date Dimension
INSERT INTO dw.dim_date
SELECT DISTINCT
    transaction_date AS date_key,
    EXTRACT(DAY FROM transaction_date) AS day,
    EXTRACT(MONTH FROM transaction_date) AS month,
    TO_CHAR(transaction_date, 'Month') AS month_name,
    EXTRACT(QUARTER FROM transaction_date) AS quarter,
    EXTRACT(YEAR FROM transaction_date) AS year
FROM dw.stg_sales_raw
WHERE transaction_date IS NOT NULL;
