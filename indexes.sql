-- index
-- index => sequential searching
-- index => reference of your data
-- help in query optimize (fast)

-- primary key, foreign key (column)
-- identifier
-- select * from where col=value
-- index => BST tree
-- clustered index

-- index ()
use regex1;
drop table users;
create table users (id int primary key, fname varchar(20));
insert into users values(10,"tushar"),(11,"pranav"),(12,"naina"),
(13,"gaurav"),(14,"shubham"),(15,"rajat"),(16,"tushar");

create index user_f on users(fname);
explain select * from users where fname = 'rajat';
drop index `PRIMARY` on users;
show indexes from users;

create table kk(id int, fname varchar(20),lname varchar(20));

insert into kk values(1,"rohan","khare"),(2,"ajay","jain"),(3,"rohit","sharma"),
(4,"Pranav","jangid");

select * from kk;

explain select * from kk
where fname="Pranav" and lname="jangid";

create index user_f on kk(fname,lname);

explain select * from kk
where fname="Pranav" and lname="jangid";

explain select * from kk
where lname="jangid";

explain select * from kk
where fname="Pranav";
