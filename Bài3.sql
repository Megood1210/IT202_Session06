create database session6;
use session6;

select order_date, sum(total_amount) as total_revenue, count(order_id) as total_orders from orders
where status = 'completed'
group by order_date
having sum(total_amount) > 10000000;