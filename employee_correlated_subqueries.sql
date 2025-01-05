
-- 1. Find employees earning more than the average salary of their department.
SELECT emp_id, name, salary
FROM Employee e
WHERE salary > (
    SELECT AVG(salary)
    FROM Employee
    WHERE dept_id = e.dept_id
);

-- 2. List employees whose salaries are less than their manager's salary.
SELECT emp_id, name, salary
FROM Employee e
WHERE salary < (
    SELECT salary
    FROM Employee
    WHERE emp_id = e.manager_id
);

-- 3. Find the highest-paid employee in each department.
SELECT emp_id, name, salary, dept_id
FROM Employee e
WHERE salary = (
    SELECT MAX(salary)
    FROM Employee
    WHERE dept_id = e.dept_id
);


-- 4. Find departments with more than 5 employees.
SELECT dept_id
FROM Department d
WHERE (
    SELECT COUNT(*)
    FROM Employee
    WHERE dept_id = d.dept_id
) > 5;

-- 5. List employees who work in the same department as 'John'.
SELECT emp_id, name
FROM Employee e
WHERE dept_id = (
    SELECT dept_id
    FROM Employee
    WHERE name = 'John'
);

-- 6. Find employees earning less than the average salary of the company.
SELECT emp_id, name, salary
FROM Employee e
WHERE salary < (
    SELECT AVG(salary)
    FROM Employee
);

-- 7. List employees whose salary is greater than the average salary of their manager's department.
SELECT emp_id, name, salary
FROM Employee e
WHERE salary > (
    SELECT AVG(salary)
    FROM Employee
    WHERE dept_id = (
        SELECT dept_id
        FROM Employee
        WHERE emp_id = e.manager_id
    )
);
