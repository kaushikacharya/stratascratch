WITH CTE1 AS (
    SELECT
        TO_CHAR(created_at, 'YYYY-MM') AS year_month,
        SUM(value) AS revenue
    FROM
        sf_transactions
    GROUP BY year_month
), CTE2 AS (
    SELECT 
        year_month,
        revenue,
        LAG(revenue) OVER 
        (ORDER BY year_month) revenue_prev
    FROM CTE1
)
SELECT 
    year_month,
    ROUND(((revenue - revenue_prev)/revenue_prev)*100, 2) AS revenue_diff_pct
FROM CTE2;
