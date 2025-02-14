-- 1. **INSTR(string, substring)** – Ek string ke andar kisi substring ka position (location) find karne ke liye use hota hai.  
--    📌 *Example:* `INSTR('hello world', 'world')` → 7 (kyunki 'world' 7th position se start ho raha hai)

-- 2. **LOCATE(substring, string, start_position)** – INSTR jaisa hi hota hai, lekin yeh MySQL me use hota hai aur ek extra parameter (start position) le sakta hai.  
--    📌 *Example:* `LOCATE('o', 'hello world')` → 5

-- 3. **STRCMP(string1, string2)** – Do strings ka comparison karta hai:  
--    - `0` return karega agar dono same hain  
--    - `1` return karega agar pehli string badi hai  
--    - `-1` return karega agar dusri string badi hai  
--    📌 *Example:* `STRCMP('apple', 'banana')` → -1

-- 4. **SUBSTR(string, start, length)** – Ek string ka specific part (substring) extract karne ke liye.  
--    📌 *Example:* `SUBSTR('hello world', 1, 5)` → 'hello'

-- 5. **TRIM(string)** – String ke aage aur peeche ke extra spaces hata deta hai.  
--    📌 *Example:* `TRIM('   hello   ')` → 'hello'

-- 6. **RPAD(string, length, pad_string)** – Ek string ke right side me extra characters add karta hai jab tak specified length na mil jaye.  
--    📌 *Example:* `RPAD('hello', 10, '*')` → 'hello*****'

-- 7. **LPAD(string, length, pad_string)** – RPAD jaisa hi hota hai, bas left side me padding karta hai.  
--    📌 *Example:* `LPAD('hello', 10, '*')` → '*****hello'

-- 8. **LENGTH(string)** – String ka total length (character count) return karta hai.  
--    📌 *Example:* `LENGTH('hello')` → 5

-- 9. **CONCAT(string1, string2, ...)** – Multiple strings ko jodta hai.  
--    📌 *Example:* `CONCAT('hello', ' ', 'world')` → 'hello world'

-- 10. **CONCAT_WS(separator, string1, string2, ...)** – Yeh bhi CONCAT jaisa hai, bas yeh separator bhi add karta hai.  
--    📌 *Example:* `CONCAT_WS('-', '2025', '02', '14')` → '2025-02-14'

-- 11. **LOWER(string)** – String ke saare characters ko lowercase (chhoti letters) me convert karta hai.  
--    📌 *Example:* `LOWER('HELLO WORLD')` → 'hello world'  
use sakila;
select * from actor;

-- and and or

select * from actor where actor_id>2 or first_name='JOHNNY';

select * from actor where
(first_name = 'NICK' or first_name='ED')
and actor_id>2;

-- functions 
-- block of code => code reusable
-- code readable

-- pre-defined 
-- string function

select first_name, lower(first_name) , upper(lower(first_name))
from actor;

select first_name , last_name,
concat(first_name,'-', last_name,'xyz'),
concat_ws('-',first_name, last_name,'xyz')
from actor;

select * from actor
where concat(first_name,last_name) = 'EDCHASE';

-- substr 
select first_name,
substr(first_name,-3),
substr(first_name ,1,3) from actor;

-- instr

select first_name,
instr(first_name,'E'),
locate('E' , first_name,1),
char_length(first_name)
from actor;


-- dual
select length('字'), char_length('字')
from dual;

select amount from payment;

select first_name , 
lpad(first_name ,5,'$') from actor;

select first_name , 
rpad(first_name ,5,'$') from actor;

select ' hey    ',
trim(leading 'z' from 'zzzhezzzzzzzz'),
trim(trailing'z' from 'zzzhezzzzzzzz') from dual;

select first_name , replace(first_name , 'E','X')
from actor;


