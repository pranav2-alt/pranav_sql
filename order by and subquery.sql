use sakila;
select * from address;

select city_id, count(dstrict) 
 from address group by city_id having count(district)>=2;

select * from address order by district;
select * from address order by district, city_id;

select * from address order by district, city_id desc;
select customer_id , sum(amount)  from payment
group by customer_id order by sum(amount) ;
select customer_id , sum(amount) as "totalAmount" from payment
group by customer_id order by "totalAmount" desc;

select customer_id , sum(amount) as "totalAmount" from payment
group by customer_id order by "totalAmount" ;

# subquery --> 
select * from payment;
select amount from payment where payment_id=3;
select * from payment where amount=5.99;

select * from payment 
where amount=(select amount from payment where payment_id=5);

# get the payment_id staff_id rental_id and amount only for that payment where the rental_id > the rental
-- id of  payment_id = 4 ?
select * from payment;
select payment_id , staff_id , rental_id, amount from payment
 where  rental_id > (select rental_id from payment where payment_id=4); 
 
 # get the payment_id amount , the 10% increment in amount for those payment where the month of payment_date
 # = the month of payment_id = 5
select * from payment;

select month(payment_date) from payment where payment_id = 5 ;
select payment_id ,amount,amount*1.1
from payment
where 
month(payment_date)=(select month(payment_date) from payment where payment_id = 5 );

# get  the customer_id and the total_number of payment done by each customer only for those who's total number 
#  of payment > total_number of payment id =2 ?  
select * from payment;
select sum(amount) from payment where payment_id =2;
select customer_id, sum(amount) from payment group by customer_id 
having sum(payment_id)> (select sum(amount) from payment where payment_id =2);

SELECT customer_id, sum(payment_id) AS total_payments
FROM payment
GROUP BY customer_id
HAVING sum(payment_id) > (
    SELECT sum(payment_id)
    FROM payment
    WHERE payment_id = 2
);
