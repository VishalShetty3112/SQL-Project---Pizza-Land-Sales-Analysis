use pizza;
 
-- 1) Calculate the total number of orders placed


Select Count(order_id) as Total_Orders From orders;


-- 2) Calculate the total revenue generated from pizza sales

SELECT  floor(Sum(order_details.quantity * pizzas.price)) as Total_Sales
From order_details INNER JOIN pizzas
ON pizzas.pizza_id=order_details.pizza_id;


-- 3) Identify Total Pizzas Sold

Select Sum(order_details.quantity) as Total_Pizzas_Sold 
FROM order_details;


-- 4) Identify pizzas ordered by size.

Select pizzas.size, count(order_details.order_details_id) AS Total_quantity
From pizzas Inner join order_details
ON order_details.pizza_id= pizzas.pizza_id
Group by pizzas.size
ORDER BY Total_quantity DESC;


-- 5) Calculate average order value

SELECT 
    ROUND(SUM(p.price * od.quantity) / COUNT(DISTINCT o.order_id), 2) AS avg_order_value
FROM 
    order_details od
JOIN 
    pizzas p ON od.pizza_id = p.pizza_id
JOIN 
    orders o ON od.order_id = o.order_id;


-- 6) Find the total quantity of each pizza category ordered.

Select pizza_types.category, Count(order_details.quantity) as Total_Quantity
FROM pizza_types INNER JOIN pizzas
ON pizzas.pizza_type_id=pizza_types.pizza_type_id
Inner Join order_details
ON order_details.pizza_id=pizzas.pizza_id
Group by pizza_types.category;


-- 7) Determine the distribution of orders by hour of the day.

SELECT HOUR(time) AS Hour, COUNT(order_id) AS Total_orders
FROM orders GROUP BY HOUR(time) ORDER BY Hour ASC;


-- 8) Determine the top 3 most ordered pizza types based on revenue.

Select pizza_types.name, SUM(order_details.quantity *pizzas.price) as revenue
from pizza_types INNER JOIN pizzas
ON pizzas.pizza_type_id=pizza_types.pizza_type_id INNER JOIN order_details
ON order_details.pizza_id=pizzas.pizza_id
Group by pizza_types.name ORDER BY revenue DESC LIMIT 3;


-- 9) Calculate the percentage contribution of each pizza type to total revenue.

Select pizza_types.category, CONCAT(ROUND(SUM(order_details.quantity  * pizzas.price)*100 / (Select 
SUM(order_details.quantity * pizzas.price) AS Total_Sales
FROM order_details INNER JOIN pizzas
ON pizzas.pizza_id=order_details.pizza_id),2),'%')  AS revenue_percentage
from pizza_types INNER JOIN pizzas
ON pizzas.pizza_type_id=pizza_types.pizza_type_id INNER JOIN order_details
ON order_details.pizza_id=pizzas.pizza_id
Group by pizza_types.category order by revenue_percentage desc;


-- 10) Analyze the cumulative revenue generated over time.

SELECT month,
       Round(SUM(revenue) OVER (ORDER BY month),2) AS cum_revenue
FROM (
    SELECT date_format(orders.date,'%Y-%m') as month,
           SUM(order_details.quantity * pizzas.price) AS revenue
    FROM order_details
   INNER JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id
    INNER JOIN orders ON orders.order_id = order_details.order_id
    GROUP BY date_format(orders.date,'%Y-%m')
) AS sales;


-- 11) Find pizza size revenue contribution by each category

WITH size_revenue AS (
    SELECT pt.category, p.size,
        SUM(od.quantity * p.price) AS revenue
    FROM 
        order_details od
    JOIN pizzas p ON od.pizza_id = p.pizza_id
    JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
    GROUP BY 
        pt.category, p.size
),
total_category_revenue AS (
    SELECT category, SUM(revenue) AS total_revenue
    FROM 
        size_revenue
    GROUP BY 
        category
)
SELECT 
    sr.category,
    sr.size,
    ROUND(sr.revenue, 2) AS revenue,
    CONCAT(ROUND((sr.revenue / tcr.total_revenue) * 100, 2),'%') AS category_percetage
FROM 
    size_revenue sr
JOIN 
    total_category_revenue tcr ON sr.category = tcr.category
ORDER BY 
    sr.category, category_percetage DESC;
