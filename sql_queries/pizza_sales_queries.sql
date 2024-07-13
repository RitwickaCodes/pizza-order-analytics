-- Top 5 most ordered pizza types along with their quantities.
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

-- Sales trend over time
SELECT 
    DATE(o.order_date) AS order_date,
    COUNT(od.order_id) AS total_orders
FROM
    orders o
        JOIN
    order_details od ON o.order_id = od.order_id
GROUP BY order_date
ORDER BY order_date;

-- Top categories by revenue
SELECT 
    pt.category, SUM(od.quantity) AS total_quantity
FROM
    order_details od
        JOIN
    pizzas p ON od.pizza_id = p.pizza_id
        JOIN
    pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.category
ORDER BY total_quantity DESC;

-- Average order value
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
    
-- Order time analysis
SELECT 
    EXTRACT(HOUR FROM order_time) AS order_hour,
    COUNT(order_id) AS total_orders
FROM
    orders
GROUP BY order_hour
ORDER BY order_hour;

-- Revenue contribution by size
SELECT 
    p.size, SUM(od.quantity * p.price) AS total_revenue
FROM
    order_details od
        JOIN
    pizzas p ON od.pizza_id = p.pizza_id
GROUP BY p.size
ORDER BY total_revenue DESC;

-- Pizza type diversity in orders
SELECT 
    order_id, COUNT(DISTINCT pizza_type_id) AS pizza_type_count
FROM
    order_details od
        JOIN
    pizzas p ON od.pizza_id = p.pizza_id
GROUP BY order_id;
