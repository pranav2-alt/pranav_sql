use sakila;

select * from actor;

select first_name from actor
where actor_id=3;

select * from actor where first_name='ED';
select * from actor where 
first_name=(select first_name from actor
where actor_id=1);

select * from payment
where amount>(select amount from 
payment where rental_id=1185);

select * from payment;

-- get those amount where the total number of payments for the amount should be 
-- greater than the total payment of 0.99

select amount from payment 
group by amount 
having count(*) > (select count(*) 
from payment where amount = 0.99);

select amount,count(amount) from payment
group by amount having count(amount)>2977;

select amount,count(amount) from payment
group by amount 
having count(amount)>(select count(amount) from payment
where amount = 0.99);

-- get each customer id and the total amount spend where the total amount should greater 
-- than the total payment spended customer_id

-- multi-row subquery
select amount from payment where 
payment_id in (1,3);

select * from payment
where amount in (select amount from payment 
where payment_id in (1,3));

select * from payment
where amount <any (select amount from payment 
where payment_id in (1,3));

select * from payment
where amount >all (select amount from payment 
where payment_id in (1,3));

