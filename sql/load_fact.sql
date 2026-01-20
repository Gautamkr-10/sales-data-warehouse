-- ===============================
-- LOAD FACT TABLE
-- ===============================

-- Clear existing data (optional, safe for re-run)
TRUNCATE TABLE dw.fact_sales;

INSERT INTO dw.fact_sales (
    transaction_id,
    date_key,
    customer_id,
    product_id,
    store_id,
    salesperson_id,
    quantity,
    price_per_unit,
    discount_percentage,
    total_amount,
    final_amount,
    payment_method,
    order_status,
    delivery_type
)
SELECT
    transaction_id,
    transaction_date,
    customer_id,
    product_id,
    store_id,
    salesperson_id,
    quantity,
    price_per_unit,
    discount_percentage,
    total_amount,
    final_amount,
    payment_method,
    order_status,
    delivery_type
FROM dw.stg_sales_raw
WHERE
    transaction_id IS NOT NULL
    AND customer_id IS NOT NULL
    AND product_id IS NOT NULL
    AND store_id IS NOT NULL
    AND salesperson_id IS NOT NULL
    AND transaction_date IS NOT NULL
    AND final_amount IS NOT NULL;
