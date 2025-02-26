create database regex2;
use regex2;

-- ddl statement (Data defination language)
create table employee1(eid int);
insert into employee1 values(2147483647);
select * from employee1;

create table employee3(eid int(4) zerofill);
insert into employee3 values(7);
select * from employee3;

create table employee4(eid int unsigned);
insert into employee4 values(4294967295);
select * from employee4;

-- int => 4
-- big int => 8
-- small it => 2 bytes
-- tiny int => 1 byte
-- medium int => 3 bytes

create table employee20(id tinyint);
insert into employee4 values(56);
select * from employee20;

-- float and double
create table emp2(salary float);
insert into emp1 values(15.36578);
select * from emp1;

create table emp3(salary float(4,2) );
insert into emp3 values(99);		-- 
select * from emp3;

create table ep3(name1 char(4) );
insert into ep3 values ("zzqw");
select name1, length(name1) from ep3;

-- date
create table test( dob date);
-- YYYY-MM-DD n
insert into test values("2022-05-12");
select * from test;