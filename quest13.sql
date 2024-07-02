-- Determine the top 3 most ordered pizza types based on revenue for each pizza category.

select name , revenue from
(select category,name, revenue,
rank() over(partition by category order by revenue desc) as rn
from
(SELECT pizza_types.category,
pizza_types.NAME,
SUM((orders_details.quantity)*pizzas.PRICE) AS REVENUE
FROM pizza_types join pizzas
on pizza_types.pizza_type_id=pizzas.pizza_type_id
join orders_details
on orders_details.pizza_id=pizzas.pizza_id
group by pizza_types.category,pizza_types.name) as A) as B
where rn<=3;