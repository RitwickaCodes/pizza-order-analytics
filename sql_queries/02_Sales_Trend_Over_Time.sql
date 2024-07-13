-- Sales Trend over time
SELECT 
    DATE(o.order_date) AS order_date,
    COUNT(od.order_id) AS total_orders
FROM
    orders o
        JOIN
    order_details od ON o.order_id = od.order_id
GROUP BY order_date
ORDER BY order_date;