-- Hangi üründen kaç tane satılmış?
select p.id, p.product_name, count(*) adet from products p
inner join order_details od 
on p.id=od.product_id
group by p.id
order by adet;

-- En çok kazandıran ilk 3 ürün hangisidir?
select p.id, p.product_name, sum(od.quantity*od.unit_price) as kazanc from products p
 inner join order_details od
 on p.id =od.product_id
 group by p.id
 order by kazanc desc
 limit 3;
 
 -- Hangi kargo şirketlerine ne kadar ödeme yapılmış?
 
 select s.company , sum(o.shipping_fee) as total  from orders o inner join shippers s
 on s.id= o.shipper_id
 group by s.id
 order by total;
 
 
 -- En uygun kargo ücreti hangisidir?
 select s.company, avg(o.shipping_fee) as ortalama from orders o inner join shippers s
 on s.id=o.shipper_id
 where  o.shipping_fee>0
 group by s.id
 
 