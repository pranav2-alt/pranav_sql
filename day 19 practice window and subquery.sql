use sakila;
-- window function  --> aggregate function ko har ek
              -- row ke sath
use sakila;
select * from payment;
select payment_id , amount,
avg(amount) over(order by amount desc) from payment;

select payment_id , amount,
sum(amount) over(partition by amount)
 from payment;
 
-- sum() over(partition by __ order by__)-cumulative sum

select payment_id , amount,
sum(amount) over(partition by amount
order by amount )
 from payment;
 
select payment_id , staff_id , amount , sum(amount)
over(order by amount) 
from payment where payment_id < 10;

select payment_id , staff_id , amount , sum(amount)
over(order by payment_id) 
from payment where payment_id < 10;
 

select payment_id , staff_id , amount , sum(amount)
over(partition by payment_id) 
from payment where payment_id < 10;

select payment_id , staff_id , amount , sum(amount)
over(partition by staff_id) 
from payment where payment_id < 10;

select payment_id , staff_id , amount , sum(amount)
over(partition by amount) 
from payment where payment_id < 10;
use regex;
create table customer(id int , name varchar(20));
insert into customer values(10,'Raj'),(11,'Jai'),
(12,'Ram');


create table order1(oid int , price int , 
customer_id int);
insert into order1
 values(1,200,10),(2,300,10),(3,400,11);

-- qu2 - find out the customer id , total number of
--  order placed 
select c.id , count(o.customer_id) from customer as c
left join order1 as o on c.id = o.customer_id
group by c.id;

-- que1-we need to identify the customer name 
-- customer_id, all those customer who have
-- customer_id, than one order
select * from customer 
where (select count(customer_id) from order1 
    where customer.id=order1.customer_id )>1;
    
   


