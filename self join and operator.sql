-- self join
-- when a table is match with it's own table
use sakila;
create table staffs(eid int, ename varchar(20), manager_id int);

insert into staffs values
(10,'tushar',null),
(11,'aman',13),
(12,'sakshi',10),
(13,'shubham',11),
(14,'ujjawal',12);

select * from staffs;
select emp.eid, emp.ename, emp.manager_id, mng.ename
from staffs as emp join staffs as mng
where emp.manager_id=mng.eid;

use sakila;
select * from actor where actor_id =2
union
select * from actor where actor_id in (3,5);

select * from actor where actor_id in (2,3)
union
select first_name, actor_id, last_name, last_update from actor where actor_id in (3,5);

select * from actor where actor_id in (2,3,4)
except
select * from actor where actor_id in (3,5);

select * from actor;
desc actor;
select * from film_actor;
desc film_actor;

select * from actor as a join film_actor as f
where a.actor_id = f.actor_id;

select a.actor_id, count(f.film_id) as movies
from actor as a join film_actor as f
where a.actor_id=f.actor_id
group by a.actor_id order by movies desc;

