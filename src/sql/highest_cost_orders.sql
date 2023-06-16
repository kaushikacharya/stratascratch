WITH CTE AS 
(
    SELECT cust_id, order_date, SUM(total_order_cost) AS total_order_cost
    FROM
    orders
    WHERE order_date BETWEEN '2019-02-01' AND '2019-05-01'
    GROUP BY cust_id, order_date
)

SELECT first_name, total_order_cost, order_date
FROM customers
INNER JOIN 
    (SELECT cust_id, total_order_cost, order_date
    FROM
    CTE
    WHERE total_order_cost = (
        SELECT MAX(total_order_cost)
        FROM CTE
        )
    ) AS A
ON customers.id=A.cust_id;
