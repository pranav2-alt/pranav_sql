-- TCL Statement
-- transaction control language
-- transaction : set of logical statement
-- DDL , DML , DCL
-- start or stop
-- start => DML task
-- DDL, DCL => transaction are stopped
-- TCL: commit , savepoint, rollback


select @@autocommit;
set autocommit = 0;

use regex1;
create table yash(id int, fname varchar(20));
insert into yash values(10,"shubham");
select * from yash;
commit;

insert into yash values(11,"pranav");
select * from yash;
commit;
rollback;
select * from yash;

insert into yash values(12,"shubham");
update yash set fname="regex";
create table dd(id int);
select * from yash;

insert into yash values(13,"isha");
select * from yash;
update yash set fname="uu";
select * from yash;
savepoint yash_raj_sv;
insert into yash values(14,"pp");
select * from yash;



