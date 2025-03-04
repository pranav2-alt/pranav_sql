use regex1;

show tables;
create table emp(eid int primary key, name varchar(20));
insert into emp values(1,'aman'),(2,'shubham'),(3,'abc');

create table emp_family(eid int , name varchar(20),
father varchar(20));
insert into emp_family values (1,"aman","raj"),(2,"shubham","kamal"),(3,"abc","aman"),(4,"ujjwal","kaluram");
insert into emp_family values (3,'abc','abc');
select * from emp_family;

select * from emp;

-- id, name , salry and department id 
-- inserrting the data 

create table emp123(eid int primary key,
fname varchar(20), salary int, department_id int);
insert into emp123 values(1,'tushar',900,10),
(2,'shubham',100,10),(3,'aman',50,10),
(4,'sakshi',200,11),(5,'naina',300,11);
insert into emp123 values(6,'isha',350,12);

select * from emp123;

-- import table from need to get employee id the first name department id  only for thata employee salary of thr table 
-- employee greater than the average salary pof thsi department

select department_id, avg(salary)
from emp123
group by department_id;

select * from emp123 where
salary> (select avg(salary) from emp123 as e
where emp123.department_id=e.department_id
group by e.department_id);

create table product1(pid int primary key, pname varchar(20));
insert into product1 values (10,'pen'),(20,'facewash'),(30,'cream');

create table order1 ( oid int, cname varchar(20),pid int);
insert into order1 values(11,'rohan',56),(22,'pranav',67),(33,'gaurav',76);

select * from product1
where exists( select oid from order1 where product1.pid=order1.pid);

select * from product1
where not exists( select oid from order1 where product1.pid=order1.pid);
