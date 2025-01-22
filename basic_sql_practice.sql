-- 1. Retrieve All Data
SELECT * FROM employees;

-- 2. Filter Records
SELECT name, salary 
FROM employees 
WHERE salary > 50000;

-- 3. Sorting Data
SELECT * 
FROM employees 
ORDER BY joining_date ASC;

-- 4. Count Rows
SELECT COUNT(*) AS total_employees 
FROM employees;

-- 5. Aggregate Function
SELECT AVG(salary) AS average_salary 
FROM employees;

-- 6. Group By and Having
SELECT department_id, SUM(salary) AS total_salary 
FROM employees 
GROUP BY department_id 
HAVING SUM(salary) > 100000;

-- 7. Inner Join
SELECT e.name, d.department_name 
FROM employees e 
INNER JOIN departments d 
ON e.department_id = d.department_id;

-- 8. Update Query
UPDATE employees 
SET salary = salary + 5000;

-- 9. Delete Records
DELETE FROM employees 
WHERE salary < 30000;

-- 10. Add a New Column
ALTER TABLE employees 
ADD COLUMN phone_number VARCHAR(15);
