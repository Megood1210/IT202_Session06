create database session6;
use session6;

select p.product_id, p.product_name, sum(oi.quantity) as total_sold, sum(oi.quantity * p.price) as total_revenue, avg(p.price) as avg_price 
from products p
join order_items oi on p.product_id = oi.product_id
group by p.product_id, p.product_name;

select p.product_id, p.product_name, sum(oi.quantity) as total_sold, sum(oi.quantity * p.price) as total_revenue, avg(p.price) as avg_price 
from products p
join order_items oi on p.product_id = oi.product_id
group by p.product_id, p.product_name
having sum(oi.quantity) >= 10;

select p.product_id, p.product_name, sum(oi.quantity) as total_sold, sum(oi.quantity * p.price) as total_revenue, avg(p.price) as avg_price 
from products p
join order_items oi on p.product_id = oi.product_id
group by p.product_id, p.product_name
having sum(oi.quantity) >= 10
order by total_revenue desc;

select p.product_id, p.product_name, sum(oi.quantity) as total_sold, sum(oi.quantity * p.price) as total_revenue, avg(p.price) as avg_price 
from products p
join order_items oi on p.product_id = oi.product_id
group by p.product_id, p.product_name
having sum(oi.quantity) >= 10
order by total_revenue desc
limit 5;