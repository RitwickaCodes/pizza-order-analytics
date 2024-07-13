-- Average Order Value
SELECT 
    ROUND(AVG(total_order_value), 2) AS average_order_value
FROM
    (SELECT 
        o.order_id, SUM(p.price * od.quantity) AS total_order_value
    FROM
        orders o
    JOIN order_details od ON o.order_id = od.order_id
    JOIN pizzas p ON od.pizza_id = p.pizza_id
    GROUP BY o.order_id) AS a;