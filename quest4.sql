-- identify the most common pizza size ordered

SELECT 
    pizzas.size, COUNT(orders_details.order_details_id) as total_orders
FROM
    pizzas
        JOIN
    orders_details ON pizzas.pizza_id = orders_details.pizza_id
GROUP BY pizzas.size order by total_orders desc limit 1 ;