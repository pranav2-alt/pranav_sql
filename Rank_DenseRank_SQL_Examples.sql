
-- Rank Students by Marks
SELECT 
    student_id, 
    RANK() OVER (ORDER BY total_marks DESC) AS rank
FROM 
    students;

-- Dense Rank Students by Marks
SELECT 
    student_id, 
    DENSE_RANK() OVER (ORDER BY total_marks DESC) AS dense_rank
FROM 
    students;

-- Rank Employees by Salary
SELECT 
    employee_id, 
    RANK() OVER (ORDER BY salary DESC) AS rank
FROM 
    employees;

-- Dense Rank Employees by Salary
SELECT 
    employee_id, 
    DENSE_RANK() OVER (ORDER BY salary DESC) AS dense_rank
FROM 
    employees;

-- Rank Students by Marks Within a Class
SELECT 
    student_id, 
    RANK() OVER (PARTITION BY class_id ORDER BY total_marks DESC) AS class_rank
FROM 
    students;

-- Dense Rank Students by Marks Within a Class
SELECT 
    student_id, 
    DENSE_RANK() OVER (PARTITION BY class_id ORDER BY total_marks DESC) AS class_dense_rank
FROM 
    students;

-- Rank Employees by Salary Within Departments
SELECT 
    employee_id, 
    RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS department_rank
FROM 
    employees;

-- Dense Rank Employees by Salary Within Departments
SELECT 
    employee_id, 
    DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS department_dense_rank
FROM 
    employees;

-- Find the Top 3 Students in Each Class
SELECT 
    student_id
FROM (
    SELECT 
        student_id, 
        RANK() OVER (PARTITION BY class_id ORDER BY total_marks DESC) AS rank
    FROM 
        students
) ranked
WHERE 
    rank <= 3;

-- Find the Top 5 Salaries Across All Employees
SELECT 
    employee_id
FROM (
    SELECT 
        employee_id, 
        RANK() OVER (ORDER BY salary DESC) AS rank
    FROM 
        employees
) ranked
WHERE 
    rank <= 5;
