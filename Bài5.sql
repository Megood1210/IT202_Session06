create database session6;
use session6;

select c.customer_id, c.full_name, count(o.order_id) as total_orders, sum(o.total_amount) as total_spent, avg(o.total_amount) as avg_order_value
from customers c
join orders o on c.customer_id = o.customer_id
group by c.customer_id, c.full_name
having count(o.order_id) >= 3;

select c.customer_id, c.full_name, count(o.order_id) as total_orders, sum(o.total_amount) as total_spent, avg(o.total_amount) as avg_order_value
from customers c
join orders o on c.customer_id = o.customer_id
group by c.customer_id, c.full_name
having count(o.order_id) >= 3 and sum(o.total_amount) > 10000000;

select c.customer_id, c.full_name, count(o.order_id) as total_orders, sum(o.total_amount) as total_spent, avg(o.total_amount) as avg_order_value
from customers c
join orders o on c.customer_id = o.customer_id
group by c.customer_id, c.full_name
having count(o.order_id) >= 3
   and sum(o.total_amount) > 10000000
order by total_spent desc;