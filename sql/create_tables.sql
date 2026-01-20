-- ===============================
-- SALES DATA WAREHOUSE
-- SCHEMA & TABLE CREATION
-- ===============================

-- 1. Create schema
CREATE SCHEMA IF NOT EXISTS dw;

-- ===============================
-- 2. Dimension Tables
-- ===============================

-- Customer Dimension
CREATE TABLE IF NOT EXISTS dw.dim_customer (
    customer_id VARCHAR(20) PRIMARY KEY,
    customer_name VARCHAR(50),
    phone_number VARCHAR(15),
    gender VARCHAR(10),
    age INT,
    customer_region VARCHAR(20),
    customer_type VARCHAR(20)
);

-- Product Dimension
CREATE TABLE IF NOT EXISTS dw.dim_product (
    product_id VARCHAR(20) PRIMARY KEY,
    product_name VARCHAR(100),
    brand VARCHAR(50),
    product_category VARCHAR(50),
    tags TEXT
);

-- Store Dimension
CREATE TABLE IF NOT EXISTS dw.dim_store (
    store_id VARCHAR(20) PRIMARY KEY,
    store_location VARCHAR(50)
);

-- Employee Dimension
CREATE TABLE IF NOT EXISTS dw.dim_employee (
    salesperson_id VARCHAR(20) PRIMARY KEY,
    employee_name VARCHAR(50)
);

-- Date Dimension
CREATE TABLE IF NOT EXISTS dw.dim_date (
    date_key DATE PRIMARY KEY,
    day INT,
    month INT,
    month_name VARCHAR(20),
    quarter INT,
    year INT
);

-- ===============================
-- 3. Fact Table
-- ===============================

CREATE TABLE IF NOT EXISTS dw.fact_sales (
    transaction_id INT PRIMARY KEY,
    date_key DATE,
    customer_id VARCHAR(20),
    product_id VARCHAR(20),
    store_id VARCHAR(20),
    salesperson_id VARCHAR(20),
    quantity INT,
    price_per_unit NUMERIC,
    discount_percentage INT,
    total_amount NUMERIC,
    final_amount NUMERIC,
    payment_method VARCHAR(20),
    order_status VARCHAR(20),
    delivery_type VARCHAR(20),

    CONSTRAINT fk_date FOREIGN KEY (date_key)
        REFERENCES dw.dim_date(date_key),
    CONSTRAINT fk_customer FOREIGN KEY (customer_id)
        REFERENCES dw.dim_customer(customer_id),
    CONSTRAINT fk_product FOREIGN KEY (product_id)
        REFERENCES dw.dim_product(product_id),
    CONSTRAINT fk_store FOREIGN KEY (store_id)
        REFERENCES dw.dim_store(store_id),
    CONSTRAINT fk_employee FOREIGN KEY (salesperson_id)
        REFERENCES dw.dim_employee(salesperson_id)
);
