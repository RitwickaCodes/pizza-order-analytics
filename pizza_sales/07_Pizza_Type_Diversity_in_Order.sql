-- Pizza Type Diversity in Order
SELECT 
    order_id, COUNT(DISTINCT pizza_type_id) AS pizza_type_count
FROM
    order_details od
        JOIN
    pizzas p ON od.pizza_id = p.pizza_id
GROUP BY order_id;