select c.first_name, o.id as orderid  from customers c
inner join orders o 
on o.customer_id = c.id
order by c.first_name;

select  p.id,p.product_name, od.id from products p left join order_details od
on p.id =od.product_id
where od.id is null;

select o.id,e.first_name from orders o right join employees e
on e.id=o.employee_id
where o.id is null
order by o.id;
