-- SQL Script for Employee Table and Correlated Subqueries

-- 1. Create the `employee` Table
CREATE TABLE employee (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10, 2),
    manager_id INT,
    hire_date DATE
);

-- 2. Insert Sample Data
INSERT INTO employee (employee_id, first_name, last_name, department_id, salary, manager_id, hire_date)
VALUES
    (1, 'Alice', 'Smith', 10, 70000.00, NULL, '2015-03-01'),
    (2, 'Bob', 'Johnson', 10, 50000.00, 1, '2016-07-15'),
    (3, 'Carol', 'Williams', 20, 80000.00, NULL, '2017-02-10'),
    (4, 'David', 'Brown', 20, 75000.00, 3, '2018-05-20'),
    (5, 'Emma', 'Jones', 20, 60000.00, 3, '2019-11-01'),
    (6, 'Frank', 'Garcia', 30, 90000.00, NULL, '2014-06-30'),
    (7, 'Grace', 'Martinez', 30, 85000.00, 6, '2015-09-12'),
    (8, 'Hannah', 'Davis', 30, 75000.00, 6, '2016-04-25'),
    (9, 'Ian', 'Lopez', 40, 65000.00, NULL, '2018-01-10'),
    (10, 'Jack', 'Gonzalez', 40, 55000.00, 9, '2019-08-15');

-- 3. Solve 10 Questions Using Correlated Subqueries

-- Question 1: Employees earning more than the average salary of their department
SELECT employee_id, first_name, last_name, department_id, salary
FROM employee e1
WHERE salary > (SELECT AVG(salary)
                FROM employee e2
                WHERE e2.department_id = e1.department_id);

-- Question 2: Employees whose salaries are higher than their managers
SELECT employee_id, first_name, last_name, salary
FROM employee e1
WHERE salary > (SELECT salary
                FROM employee e2
                WHERE e2.employee_id = e1.manager_id);

-- Question 3: Employees hired after the most recent hire date in their department
SELECT employee_id, first_name, last_name, hire_date
FROM employee e1
WHERE hire_date > (SELECT MAX(hire_date)
                   FROM employee e2
                   WHERE e2.department_id = e1.department_id);

-- Question 4: Employees whose salaries are above the average salary of all employees
SELECT employee_id, first_name, last_name, salary
FROM employee e
WHERE salary > (SELECT AVG(salary) FROM employee);

-- Question 5: Departments with employees earning below the department's average salary
SELECT employee_id, first_name, last_name, department_id, salary
FROM employee e1
WHERE salary < (SELECT AVG(salary)
                FROM employee e2
                WHERE e2.department_id = e1.department_id);

-- Question 6: Employees working in the smallest department (by employee count)
SELECT employee_id, first_name, last_name, department_id
FROM employee e1
WHERE department_id = (SELECT department_id
                       FROM (SELECT department_id, COUNT(*) AS emp_count
                             FROM employee
                             GROUP BY department_id
                             ORDER BY emp_count ASC
                             LIMIT 1) AS smallest_dept);

-- Question 7: Employees earning more than the average salary across all departments
SELECT employee_id, first_name, last_name, salary
FROM employee e
WHERE salary > (SELECT AVG(dept_avg_salary)
                FROM (SELECT AVG(salary) AS dept_avg_salary
                      FROM employee
                      GROUP BY department_id) AS dept_averages);

-- Question 8: Employees earning less than the minimum salary of their manager’s department
SELECT employee_id, first_name, last_name, salary
FROM employee e1
WHERE salary < (SELECT MIN(salary)
                FROM employee e2
                WHERE e2.department_id = (SELECT department_id
                                          FROM employee e3
                                          WHERE e3.employee_id = e1.manager_id));

-- Question 9: Managers who manage employees earning more than themselves
SELECT DISTINCT e1.manager_id
FROM employee e1
WHERE (SELECT MAX(salary)
       FROM employee e2
       WHERE e2.manager_id = e1.manager_id) > (SELECT salary
                                               FROM employee e3
                                               WHERE e3.employee_id = e1.manager_id);

-- Question 10: Employees hired earlier than all their department colleagues
SELECT employee_id, first_name, last_name, hire_date
FROM employee e1
WHERE hire_date = (SELECT MIN(hire_date)
                   FROM employee e2
                   WHERE e2.department_id = e1.department_id);
