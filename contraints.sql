-- constraint
-- set of rules & regulations => invalid data
-- declaration of table
use regex1;
create table employee01(id int);

insert into employee01 values(10);

insert into employee01 values(10),(20),(30),(null),(40);

select * from employee01;

create table employee01(id int);
insert into employee01 values(10),(20),(30),(null),(40);
select id,id+5 from employee01;

drop table employee02;
create table employee02(id int, salary int default 0);
insert into employee02 values(10,99),(20,100);
insert into employee02(id,salary) values(20,null);
select * from employee02;

drop table employee02;
create table employee02(id int, salary int unique);
insert into employee02 values(10,99),(20,100);
insert into employee02 (id,salary) values(20,1002);
insert into employee02 (id,salary) values(22,null);
select * from employee02;

drop table employee02;
create table employee02(id int primary key, salary int unique);
insert into employee02 values(10,99),(20,100);
insert into employee02 (id,salary) values(null,1002);
insert into employee02 (id,salary) values(10,null);
select * from employee02;

create table employee02(id int primary key, fname varchar(20), salary int,
constraint regex_emp_salary_uk unique(salary) );
insert into employee02 values(10,'a',99),(20,'b',99);
select * from employee02;

-- you have to careate table studentid student name will be a primary key, fees cannot be not null  and college name defaul value will be regex
-- and phone no. will be a unique constraint and you will constaint name will each 

create table students(id int ,s_name varchar(20) ,fees int not null ,
clg_name varchar(20)default 'regex', phone_no int,
constraint regex_stu_id_fname_pk primary key(id,s_name),
constraint regex_stu_phone_no  unique(phone_no));
select * from students;
desc students;

