
-- 1. Create a View
CREATE VIEW EmployeeDetails AS
SELECT employee_id, name, department
FROM Employees;

-- 2. View with Calculated Column
CREATE VIEW EmployeeSalary AS
SELECT employee_id, name, monthly_salary * 12 AS annual_salary
FROM Employees;

-- 3. Update Data through a View
CREATE VIEW HighSalaryEmployees AS
SELECT employee_id, name, department, monthly_salary
FROM Employees
WHERE monthly_salary > 50000;

UPDATE HighSalaryEmployees
SET department = 'Management'
WHERE employee_id = 101;

-- 4. View with Multiple Tables
CREATE VIEW EmployeeDepartment AS
SELECT e.name AS employee_name, d.name AS department_name
FROM Employees e
JOIN Departments d ON e.department_id = d.department_id;

-- 5. Insert Data through a View
CREATE VIEW NewEmployee AS
SELECT name, age, department
FROM Employees;

INSERT INTO NewEmployee (name, age, department)
VALUES ('John Doe', 30, 'IT');

-- 6. Dropping a View
CREATE VIEW TemporaryView AS
SELECT product_name, price
FROM Products;

DROP VIEW TemporaryView;

-- 7. View with Aggregated Data
CREATE VIEW AverageSalary AS
SELECT department, AVG(monthly_salary) AS avg_salary
FROM Employees
GROUP BY department;

-- 8. View with Filtering and Sorting
CREATE VIEW TopPerformers AS
SELECT employee_id, name, performance_score
FROM Employees
WHERE performance_score > 90
ORDER BY performance_score DESC;

-- 9. Check Definition of a View
CREATE VIEW EmployeeSummary AS
SELECT department, COUNT(*) AS total_employees
FROM Employees
GROUP BY department;

SHOW CREATE VIEW EmployeeSummary;

-- 10. Alter a View
CREATE VIEW EmployeeInfo AS
SELECT employee_id, name, department
FROM Employees;

ALTER VIEW EmployeeInfo AS
SELECT employee_id, name, department, email
FROM Employees;
