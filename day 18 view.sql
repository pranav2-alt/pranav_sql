-- cte ->
-- common table expression
-- readable bna ske query ko
-- expression , again use kr skta hu

-- views -> virtual table that stored the query in my database
-- helps in user to interact with quaries
-- don`t store data on disk 
-- refernce to your original table 
-- views comple quaries to simple quaries 
-- enhance the security --> row and column

use regex1;
show tables;

create table payment as select * from sakila.payment;

select * from payment;

create view pay_view as 
select payment_id , customer_id from payment;

select * from pay_view;

create table payment2 as 
		select payment_id , customer_id from sakila.payment where
        payment_id < 5;

create view payment_v2 as select *  from payment2;

select * from payment_v2;
insert into payment_v2 values(5,10);

select * from payment2;

select database();

select * from sakila.actor;
select * from sakila.film_actor;

select * from sakila.actor as a
 join sakila.film_actor as f
on a.actor_id = f.actor_id;

create view aview as 
select a.actor_id ,f.film_id, a.first_name , a.last_name from sakila.actor as a
 join sakila.film_actor as f
on a.actor_id = f.actor_id;

select * from aview;

-- views are of 2 types 
-- simple view 

-- complex view
create view aview1 as 
select a.actor_id ,f.film_id, a.first_name  from sakila.actor as a
 join sakila.film_actor as f
on a.actor_id = f.actor_id;
select * from aview1;

show tables;

use regex1;
drop table student;
create table student(id int , ename varchar(20),
age int);
insert into student values(101,"Ram",22),
(102,"Jai",23),(103,"Abhi",25);
create view tview as 
select * from student where id>102
 with check option;
 
 select * from tview;

        
