
-- 1. Retrieve all records from the employees table
SELECT * FROM employees;

-- 2. Update the salary of employees in the 'Sales' department by 10%
UPDATE employees SET salary = salary * 1.1 WHERE department = 'Sales';

-- 3. Find the highest salary in the company
SELECT MAX(salary) AS highest_salary FROM employees;

-- 4. Count the number of employees in each department
SELECT department, COUNT(*) AS employee_count FROM employees GROUP BY department;

-- 5. Delete employees with a salary less than 30000
DELETE FROM employees WHERE salary < 30000;

-- 6. Add a new column 'bonus' to the employees table
ALTER TABLE employees ADD COLUMN bonus DECIMAL(10, 2);

-- 7. Insert a new employee record
INSERT INTO employees (name, department, salary, bonus) VALUES ('John Doe', 'HR', 50000, 5000);

-- 8. Find the names of employees who have 'Manager' in their job title
SELECT name FROM employees WHERE job_title LIKE '%Manager%';

-- 9. Calculate the average salary in each department
SELECT department, AVG(salary) AS avg_salary FROM employees GROUP BY department;

-- 10. Create a backup table for employees
CREATE TABLE employees_backup AS SELECT * FROM employees;
