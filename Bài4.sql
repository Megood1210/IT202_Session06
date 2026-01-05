create database session6;
use session6;

create table products (
    product_id int primary key,
    product_name varchar(255),
    price decimal(10,2)
);

create table order_items (
    order_id int,
    product_id int,
    quantity int,
    primary key (order_id, product_id),
    foreign key (product_id) references products(product_id)
);

insert into products values
(1, 'Laptop', 15000000),
(2, 'Điện thoại', 8000000),
(3, 'Tai nghe', 1500000),
(4, 'Bàn phím', 1200000),
(5, 'Chuột', 700000);

insert into order_items values
(101, 1, 2),
(102, 2, 3),
(103, 1, 1),
(104, 3, 5),
(105, 4, 4);

select p.product_id, p.product_name, sum(oi.quantity) as total_sold from products p
join order_items oi on p.product_id = oi.product_id
group by p.product_id, p.product_name;

select p.product_id, p.product_name, sum(oi.quantity * p.price) as revenue from products p
join order_items oi on p.product_id = oi.product_id
group by p.product_id, p.product_name;

select p.product_id, p.product_name, sum(oi.quantity * p.price) as revenue from products p
join order_items oi on p.product_id = oi.product_id
group by p.product_id, p.product_name
having sum(oi.quantity * p.price) > 5000000;