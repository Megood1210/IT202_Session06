create database session6;
use session6;

create table orders (
    order_id int primary key,
    customer_id int,
    order_date date,
    status enum('pending','completed','cancelled'),
    total_amount decimal(10,2),
    foreign key (customer_id) references customers(customer_id)
);

update orders set total_amount = 2500000 where order_id = 101;
update orders set total_amount = 1800000 where order_id = 102;
update orders set total_amount = 3200000 where order_id = 103;
update orders set total_amount = 900000 where order_id = 104;
update orders set total_amount = 4500000 where order_id = 105;

select c.customer_id, c.full_name, sum(o.total_amount) as total_spent from customers c
join orders o on c.customer_id = o.customer_id
group by c.customer_id, c.full_name;

select c.customer_id, c.full_name, max(o.total_amount) as max_order_value from customers c
join orders o on c.customer_id = o.customer_id
group by c.customer_id, c.full_name;

select c.customer_id, c.full_name, sum(o.total_amount) as total_spent from customers c
join orders o on c.customer_id = o.customer_id
group by c.customer_id, c.full_name
order by total_spent desc;