# foreign key constraint
# relationship define krna --> entity
# parent and child

use regex1;

create table product123(pid int primary key,
amount int);
insert into product123 values(101,876),(102,745);
select * from product123;

create table order123(oid int , city varchar(20),
product_id int,
foreign key (product_id) references product123(pid) );

insert into order123 values(9632,'jaipur',101);
insert into order123 values(9633,'sikar',102);
insert into order123 values(9634,'jodhpur',107); # show error because foreign key establish
select * from order123;

-- update or delete caseade
create table product2(pid int primary key, amount int);
insert into product2 values(101,3450),(102,3560),(103, 6587);
select * from product2;

create table order2(oid int, city varchar(20),product_id int,
foreign key (product_id) references product2(pid) on update cascade on delete cascade);
insert into order2 values
(7346, "kota", 101),
(2543, "jaipur", 102),
(3464, "delhi", 103);
select * from order2;

delete from product2 where pid=101;
UPDATE product2 SET pid = 101 WHERE pid = 102;