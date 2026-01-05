create database session6;
use session6;

create table customers (
    customer_id int primary key,
    full_name varchar(255),
    city varchar(255)
);

create table orders (
    order_id int primary key,
    customer_id int,
    order_date date,
    status enum('pending','completed','cancelled'),
    foreign key (customer_id) references customers(customer_id)
);

insert into customers values
(1, 'Nguyễn Văn A', 'Hà Nội'),
(2, 'Trần Thị B', 'TP.HCM'),
(3, 'Lê Văn C', 'Đà Nẵng'),
(4, 'Phạm Thị D', 'Hà Nội'),
(5, 'Hoàng Văn E', 'Cần Thơ');

insert into orders values
(101, 1, '2025-01-05', 'completed'),
(102, 1, '2025-01-10', 'pending'),
(103, 2, '2025-01-12', 'completed'),
(104, 3, '2025-01-15', 'cancelled'),
(105, 3, '2025-01-18', 'completed');

select o.order_id, o.order_date, o.status, c.full_name from orders o
join customers c on o.customer_id = c.customer_id;

select c.customer_id, c.full_name, count(o.order_id) as total_orders from customers c
join orders o on c.customer_id = o.customer_id
group by c.customer_id, c.full_name;