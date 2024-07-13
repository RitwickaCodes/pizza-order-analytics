-- Top 5 most popular pizzas
SELECT 
    p.name, SUM(od.quantity) AS quant
FROM
    pizza_types p
        JOIN
    pizzas ON p.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details od ON od.pizza_id = pizzas.pizza_id
GROUP BY p.name
ORDER BY quant DESC
LIMIT 5;