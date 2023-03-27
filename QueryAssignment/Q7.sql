create table pizza_toppings
(
	topping_name varchar(20),
	ingredient_cost float
)

insert pizza_toppings values('Pepperoni', 0.50),('Sausage', 0.70),('Chicken', 0.55),('Extra Cheese', 0.40)

select * from pizza_toppings

select 
	p1.topping_name + ',' + p2.topping_name + ',' + p3.topping_name as three_topping_pizza, 
	p1.ingredient_cost + p2.ingredient_cost + p3.ingredient_cost as total_cost
from pizza_toppings as p1 
	inner join pizza_toppings as p2 on p1.topping_name < p2.topping_name 
	inner join pizza_toppings as p3 on p2.topping_name < p3.topping_name
	order by total_cost desc
