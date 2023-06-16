WITH cte AS
  (SELECT first_name,
          cust_id,
          sum(total_order_cost) AS total_order_cost,
          order_date
   FROM orders o
   LEFT JOIN customers c ON o.cust_id = c.id
   WHERE order_date BETWEEN '2019-02-1' AND '2019-05-1'
   GROUP BY first_name,
            cust_id,
            order_date)
SELECT first_name,
       total_order_cost,
       order_date
FROM cte
WHERE total_order_cost =
    (SELECT max(total_order_cost)
     FROM cte)
