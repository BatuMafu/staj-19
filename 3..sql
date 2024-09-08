select orders.id, CONCAT(customers.first_name, customers.last_name) customername, orders.order_date from orders inner join customers
on orders.customer_id = customers.id
inner join customers
 on orders.customer_id= customer_id
where customers.city='New York';

select  o.id order_id, p.product_name,CONCAT(c.first_name, c.last_name) customername, o.order_date from o 
inner join customers c on o.customer_id = c.id
inner join order_details od on od.order_id= order_id
inner join products p on p.id=od.product_id
order by customername;