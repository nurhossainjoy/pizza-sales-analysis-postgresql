/*
===============================================================================
                               PIZZA SALES PROJECT
===============================================================================
Author      : MD Nur Hossain Joy
Database    : PostgreSQL
Tool        : pgAdmin 4
Project     : Pizza Sales Project
*/


/*=============================================================================
BASIC BUSINESS ANALYSIS
=============================================================================*/

/*QUESTION 1: 
retrieve total number of orders placed*/
select
COUNT ("order_id") AS total_number_of_orders
from pizza_sales_project.orders;

/*QUESTION 2: 
Calculate total number of revenue generated from Pizza Sales*/
select
	ROUND (SUM (od."quantity"*p."price")) AS total_sales_revenue
	FROM pizza_sales_project.order_details AS od
LEFT JOIN pizza_sales_project.pizzas AS p
on od."pizza_id"=p."pizza_id"

/*QUESTION 3: 
Identify the highest prized pizza*/
SELECT
	pizza_id,
	pizza_type_id,
	size,
	price
FROM pizza_sales_project.pizzas
	GROUP BY 1,2,3,4
	ORDER BY 4 DESC
	LIMIT 1;
	
/* QUESTION 4: 
Identify the most common pizza-size ordered*/
SELECT 
p."size" AS pizza_size,
COUNT(od."order_details_id") AS NUMBER_OF_ORDERS 
FROM pizza_sales_project.pizzas AS p
JOIN pizza_sales_project.order_details AS od
ON p. "pizza_id"=od."pizza_id"
GROUP BY 1 
ORDER BY 2 DESC;

/* QUESTION 5:
List top 5 ordered pizza types along with their quantity*/
SELECT 
	pt."name",
	SUM (od."quantity") Total_No_of_Pizza
FROM pizza_sales_project.pizza_types AS pt
JOIN pizza_sales_project.pizzas AS p
	ON pt."pizza_type_id"=p."pizza_type_id"
JOIN pizza_sales_project.order_details AS od
	on p."pizza_id"=od."pizza_id"
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;


/*=============================================================================
INTERMEDIATE BUSINESS ANALYSIS
=============================================================================*/

/* QUESTION 5:
Join the necessary tables to find the total quantity of each pizza 
category ordered*/
SELECT
	pt."category",
	SUM (od. "quantity") sum_of_pizza_ordered
FROM pizza_sales_project.pizza_types AS pt
JOIN pizza_sales_project.pizzas AS p 
	ON pt."pizza_type_id"=p."pizza_type_id"
JOIN pizza_sales_project.order_details AS od 
	ON od."pizza_id"=p."pizza_id"
GROUP BY 1
ORDER BY 2 DESC;

/* QUESTION 6:
Determine the distribution of orders by hour of the day*/
SELECT
    EXTRACT(HOUR FROM "time"::time) AS hour,
    COUNT(order_id) AS total_orders
FROM pizza_sales_project.orders
GROUP BY EXTRACT(HOUR FROM "time"::time)
ORDER BY total_orders DESC ;

/* QUESTION 7:
Join relevant tables to find the category-wise distribution of pizzas*/
SELECT
"category",
count("name")
FROM pizza_sales_project.pizza_types
GROUP BY 1;

/* QUESTION 8:
--Group the orders by date and calculate the average number of pizzas ordered per day*/

WITH daily_orders AS
(
SELECT
	o."date",
	SUM (od."quantity") AS daily_orders
FROM pizza_sales_project.orders AS o
JOIN pizza_sales_project.order_details AS od
ON o."order_id"=od."order_id"
GROUP BY 1
ORDER BY 1 ASC
)
SELECT
ROUND (AVG(daily_orders)) AS average_daily_orders
FROM daily_orders;

/* QUESTION 9:
Determine the top 3 most ordered pizza types based on revenue.*/

SELECT
	pt."name" AS pizza_types,
	ROUND(SUM(p."price"*od."quantity")) AS total_revenue
FROM pizza_sales_project.pizza_types AS pt
JOIN pizza_sales_project.pizzas AS p
	ON pt."pizza_type_id"=p."pizza_type_id"
JOIN pizza_sales_project.order_details AS od 
	ON od."pizza_id"=p."pizza_id"
GROUP BY 1
ORDER BY 2 DESC
LIMIT 3;

/*=============================================================================
ADVANCED ANALYSIS
=============================================================================*/

/* QUESTION 10:
Calculate the percentage contribution of each pizza type 
to total revenue*/

WITH revenue_summary AS (
    SELECT
        pt."category" AS pizza_type,
        ROUND(SUM(p."price" * od."quantity")::numeric) AS total_revenue
    FROM pizza_sales_project.pizza_types AS pt
    JOIN pizza_sales_project.pizzas AS p
        ON pt."pizza_type_id" = p."pizza_type_id"
    JOIN pizza_sales_project.order_details AS od
        ON od."pizza_id" = p."pizza_id"
    GROUP BY 1
)

SELECT
    pizza_type,
    total_revenue,
    ROUND(
        total_revenue * 100.0
        / SUM(total_revenue) OVER (),
        2
    ) AS contribution_percent
FROM revenue_summary
ORDER BY total_revenue DESC;

/* QUESTION 11:
Analyze the cumulative revenue generated over time*/

WITH ranked_pizzas AS
 (
 	SELECT
        o."date" AS order_date,
        ROUND(SUM(p."price" * od."quantity")::numeric) AS total_revenue
    FROM pizza_sales_project.order_details AS od
    JOIN pizza_sales_project.pizzas AS p
        ON od."pizza_id" = p."pizza_id"
    JOIN pizza_sales_project.orders AS o
        ON o."order_id" = od."order_id"
    GROUP BY 1
)
SELECT 
	order_date,
	total_revenue,
SUM(total_revenue) OVER(ORDER BY order_date) AS cumulative_revenue
FROM ranked_pizzas;
/* QUESTION 12:
Determine the top 3 most ordered pizza types based on revenue for each pizza category*/
SELECT * FROM
(
WITH Pizza_Category AS (
    SELECT
		pt."category" AS pizza_types,
        pt."name" AS pizzas,
        ROUND(SUM(p."price" * od."quantity")::numeric) AS total_revenue
    FROM pizza_sales_project.pizza_types AS pt
    JOIN pizza_sales_project.pizzas AS p
        ON pt."pizza_type_id" = p."pizza_type_id"
    JOIN pizza_sales_project.order_details AS od
        ON od."pizza_id" = p."pizza_id"
    GROUP BY 1,2
)

SELECT
RANK () OVER (PARTITION BY pizza_types ORDER BY total_revenue),
    pizza_types,
	pizzas,
    total_revenue
FROM Pizza_Category) AS Pizza_Category
WHERE rank <=3;
/*
===============================================================================
                              END OF PROJECT
===============================================================================
*/