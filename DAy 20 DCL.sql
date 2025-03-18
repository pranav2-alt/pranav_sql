create user test identified by 'test123';

select user from mysql.user;

select * from mysql.user;

GRANT ALL privileges on sakila.* to test;

select * from mysql.user where user='test';

show grants for test;

# username@192.168.1.*

revoke all privileges on sakila.* from test;

grant select on sakila.* to test;
use sakila;
grant select(staff_id , first_name) on
sakila.staff to test;
show grants for test;

alter user 'test' identified by 'regex';
-- to lock
alter user 'test' account lock;
-- to unlock
alter user 'test' account unlock;