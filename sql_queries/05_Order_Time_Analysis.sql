-- Order Time Analysis
SELECT 
    EXTRACT(HOUR FROM order_time) AS order_hour,
    COUNT(order_id) AS total_orders
FROM
    orders
GROUP BY order_hour
ORDER BY order_hour;