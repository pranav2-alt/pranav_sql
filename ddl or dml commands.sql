use sakila;

select * from payment;

select distinct(amount)
from payment order by amount desc limit 1,1;

select max(amount) from payment
where amount < (select max(amount) from payment);

-- DDl statement
-- data definition language
-- with data, create, drop, alter

-- DML => inserting, update, delete

create database march3;
use march3;

create table regex(id int, name varchar(20));
insert into regex values(1,'pranav');
insert into regex(name) values('pranav'),('jai');
select * from regex;

-- ctas
create table y3 as select actor_id,first_name
from sakila.actor;
select * from y3;
desc y3;

-- delete 
select * from y3;
delete from y3 where actor_id in (2,4);

-- update 
update y3 set first_name = "regex";
select * from y3;

-- ddl => drop, truncate 
drop table y3;  

use march3;
create table companies(id int);
insert into companies values(10);
select * from companies;

desc companies; 
-- add table columnns
alter table companies
add column phone varchar(15);

alter table companies
add column employee_count3 int not null;

select * from companies;
desc companies;

-- rename tables
rename table companies to newcompany1;
select * from companies;
select * from newcompany1;

alter table newcompany1 rename to companies;
select * from companies;
desc companies;
ALTER TABLE companies ADD COLUMN company_name VARCHAR(255);

UPDATE companies SET company_name = 'pranav' WHERE id = 10;
desc companies;
alter table companies add primary key (id);
select * from companies;
desc companies;

alter table companies
add constraint regex_compay_uk unique(company_name);

alter table companies drop constraint regex_compay_uk;
select * from companies;

update companies set company_name=0;

alter table companies modify company_name int;

desc companies;