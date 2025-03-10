-- using window function to find the n highest salary

use sakila;
select * from payment;

select * from 
(select amount,
dense_rank() over(order by amount desc) as rating
from payment) as tab where rating = 2;

-- cte  -- Common Table Expression
with raj as 
(select amount,
dense_rank() over(order by amount desc) as rating
from payment)

select * from raj;

-- with cte as 
--  select statement
-- select * from cte; 

create temporary table temp_actor as select * from sakila.actor;
select * from temp_actor;

-- temporary table ussi sesion me rhti h agar sesion khatam temporary table khatam
-- does not exist permanent
use sakila;
show tables;
select * from temp_actor; 

use sakila;
with
cte1 as (select * from actor where actor_id > 2) ,
cte2 as (select * from film_actor where film_id = 30)
select  cte1.actor_id , cte2.film_id from 
cte1 join cte2 where cte1.actor_id = cte2.actor_id;

-- with
-- cte1 as (select * from actor where actor_id > 2) ,
-- cte2 as (select * from film_actor where film_id = 30)
-- select  cte1.actor_id , cte2.film_id from 
-- cte1 join cte2 on cte1.actor_id = cte2.actor_id;

-- parameterised cte 





-- recursive cte  -- untill some condition is satisfy
with num_table 
as (select 1 from dual)
select * from num_table;

with num_table 
as (select 1 from dual
	union
    select 1+1 from dual)
select * from num_table;

with recursive num_table
as (select 10 as num
    union 
    select num+1 from num_table where num < 13)
select * from num_table;


-- actor id , first name full name from the table where either the actor_id
-- > 5 or the name is nick

with recursive cte
as (select actor_id , first_name , concat(first_name,' ',last_name)
	as full_Name from actor where actor_id > 5 
	union
	select actor_id , first_name , concat(first_name, ' ',last_name) 
    as full_name from actor where first_name = 'Nick')
select * from cte;


