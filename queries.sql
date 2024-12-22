
-- 1. Find the Second Highest Salary:
SELECT MAX(salary) 
FROM employees 
WHERE salary < (SELECT MAX(salary) FROM employees);

-- 2. List Departments with Average Salary Above Company Average:
SELECT department_id 
FROM employees 
GROUP BY department_id 
HAVING AVG(salary) > (SELECT AVG(salary) FROM employees);

-- 3. Find Employees with Maximum Salary in Each Department:
SELECT employee_id, department_id, salary 
FROM employees e 
WHERE salary = (SELECT MAX(salary) 
               FROM employees 
               WHERE department_id = e.department_id);

-- 4. List Employees Who Earn More Than Their Manager:
SELECT employee_id, name 
FROM employees e 
WHERE salary > (SELECT salary 
               FROM employees 
               WHERE employee_id = e.manager_id);

-- 5. Find Products Not Ordered:
SELECT product_id 
FROM products 
WHERE product_id NOT IN (SELECT product_id FROM orders);

-- 6. Fetch the Lowest Salary in Each Job Title:
SELECT job_title, MIN(salary) 
FROM employees 
GROUP BY job_title 
HAVING MIN(salary) = (SELECT MIN(salary) 
                     FROM employees 
                     WHERE job_title = employees.job_title);

-- 7. Find Customers Who Placed Orders in the Last Month:
SELECT customer_id 
FROM orders 
WHERE order_date > (SELECT DATE_SUB(CURDATE(), INTERVAL 1 MONTH));

-- 8. Fetch Employee Details from Departments with More Than 5 Employees:
SELECT * 
FROM employees 
WHERE department_id IN (SELECT department_id 
                       FROM employees 
                       GROUP BY department_id 
                       HAVING COUNT(*) > 5);

-- 9. Grant and Apply Privileges:
GRANT ALL PRIVILEGES ON database_name.* TO 'user'@'host';
FLUSH PRIVILEGES;

-- 10. Revoke Privileges and Refresh:
REVOKE SELECT ON database_name.* FROM 'user'@'host';
FLUSH PRIVILEGES;
