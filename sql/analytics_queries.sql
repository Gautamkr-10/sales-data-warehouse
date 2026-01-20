-- ===============================
-- ANALYTICS QUERIES
-- ===============================

-- 1. Total Revenue
SELECT
    SUM(final_amount) AS total_revenue
FROM dw.fact_sales;

-- 2. Monthly Revenue Trend
SELECT
    d.year,
    d.month_name,
    SUM(f.final_amount) AS monthly_revenue
FROM dw.fact_sales f
JOIN dw.dim_date d
    ON f.date_key = d.date_key
GROUP BY d.year, d.month_name
ORDER BY d.year;

-- 3. Top 5 Best-Selling Products
SELECT
    p.product_name,
    SUM(f.quantity) AS total_units_sold
FROM dw.fact_sales f
JOIN dw.dim_product p
    ON f.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_units_sold DESC
LIMIT 5;

-- 4. Revenue by Product Category
SELECT
    p.product_category,
    SUM(f.final_amount) AS category_revenue
FROM dw.fact_sales f
JOIN dw.dim_product p
    ON f.product_id = p.product_id
GROUP BY p.product_category
ORDER BY category_revenue DESC;

-- 5. Customer Lifetime Value (CLV)
SELECT
    c.customer_name,
    SUM(f.final_amount) AS lifetime_value
FROM dw.fact_sales f
JOIN dw.dim_customer c
    ON f.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY lifetime_value DESC;

-- 6. Order Status Analysis
SELECT
    order_status,
    COUNT(*) AS total_orders
FROM dw.fact_sales
GROUP BY order_status;

-- 7. Store-wise Revenue
SELECT
    s.store_location,
    SUM(f.final_amount) AS store_revenue
FROM dw.fact_sales f
JOIN dw.dim_store s
    ON f.store_id = s.store_id
GROUP BY s.store_location
ORDER BY store_revenue DESC;

-- 8. Salesperson Performance
SELECT
    e.employee_name,
    SUM(f.final_amount) AS total_sales
FROM dw.fact_sales f
JOIN dw.dim_employee e
    ON f.salesperson_id = e.salesperson_id
GROUP BY e.employee_name
ORDER BY total_sales DESC;
