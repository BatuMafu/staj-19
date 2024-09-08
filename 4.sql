-- seçilen kayıtların tabloya eklenmesi
insert into employee_performans(employee_id, fullname,email,satis_adeti)
select e.id, concat(e.first_name,' ',e.last_name) as fullname , e.email_address, count(o.id) as adet
 from employees e  left join orders o
 on e.id= o.employee_id
 group by e.id;
 
 
 -- join ile update etmek
 SET SQL_SAFE_UPDATES = 0;
 UPDATE employees e inner join employee_performans ep
 on e.id=ep.employee_id
 SET e.email_address=ep.email;
 SET SQL_SAFE_UPDATES = 1;
 
 
	-- join ile delete
      
  -- siparişi olmayan  müsşterileriri silelim 
  select c.id, c.first_name from customers c
  left join orders o on o.customer_id=c.id 
  where o.customer_id is null;
  delete customers
  from customers left join orders
  on orders.customer_id=customers.id
  where orders.customer_id is null and customers.id=13;
  
  
    -- union ile çalışma 
    select email from employee_performans 
    union all
    select email_address from employees;
    
    select city, country_region from employees
    union all
    select city,country_region from customers;
    
    
    select id,order_date from orders
    where status_id= (select id from orders_status where status_name='Closed');
       select id,order_date from orders
    where status_id= (select id from orders_status where status_name='Shipped');
    
    select concat(c.first_name,' ',c.last_name) as fullname , 
    (select count(o.id) from orders o where o.customer_id =c.id) as ordercount
    from customers c;
    
    
    select  id, product_name from products p
    where id in( select product_id from order_details where quantity>100);
    
    -- **************************************************************************
    select id, first_name from customers c
    where EXISTS 
    (select id from orders o where c.id= o.customer_id and payment_type='Credit Card');
	
    
    select id, first_name,last_name from customers c 
    where EXISTS 
    (select count(*) from orders o
    where c.id= o.customer_id 
    group by o.customer_id
    having count(*)>2);


-- Any & ALL ***************************************************************************

select id, product_name , list_price from products
where id in(2,3,5,10);
select id , product_name , list_price from products
where id >=any(select product_id from order_details where quantity >10);

-- (id=2) or (id=3) or(id=5) or (id=10)
select id , product_name , list_price from products
where id >all(select product_id from order_details where quantity >10);
-- (id=2) and (id=3) and (id=5) and(id=10)
-- select avg(salary) as ortalama from customers2 c2
select* from customers2 
where salary > any (select avg(salary) from customers2);
select*from customers2
where age  > any( select age from customers2 where  salary> 3000)
    
    
    
    