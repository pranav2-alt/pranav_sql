SELECT MAX(amount) AS max_payment 
FROM sakila.payment;
SELECT MAX(amount) AS second_highest_payment 
FROM sakila.payment 
WHERE amount < (SELECT MAX(amount) FROM sakila.payment);


-- 




