-- 1. Get Employees by Department
delimiter //
create procedure get_employees_by_dept(in dept_id int)
begin
    select * from employees where department_id = dept_id;
end //

-- 2. Insert New Employee
delimiter //
create procedure insert_employee(in emp_name varchar(50), in emp_salary decimal(10, 2), in dept_id int)
begin
    insert into employees (name, salary, department_id)
    values (emp_name, emp_salary, dept_id);
end //

-- 3. Update Employee Salary
delimiter //
create procedure update_salary(in emp_id int, in new_salary decimal(10, 2))
begin
    update employees set salary = new_salary where id = emp_id;
end //

-- 4. Delete Employee
delimiter //
create procedure delete_employee(in emp_id int)
begin
    delete from employees where id = emp_id;
end //

-- 5. Get Top Paid Employees
delimiter //
create procedure top_paid_employees()
begin
    select * from employees order by salary desc limit 5;
end //

-- 6. Total Salary by Department
delimiter //
create procedure total_salary_by_dept(in dept_id int)
begin
    select sum(salary) as total_salary from employees where department_id = dept_id;
end //

-- 7. Get Recent Hires
delimiter //
create procedure recent_hires(in days int)
begin
    select * from employees where hire_date >= date_sub(curdate(), interval days day);
end //

-- 8. Department-wise Employee Count
delimiter //
create procedure dept_employee_count()
begin
    select department_id, count(*) as employee_count 
    from employees 
    group by department_id;
end //

-- 9. Transfer Employee to Another Department
delimiter //
create procedure transfer_employee(in emp_id int, in new_dept_id int)
begin
    update employees set department_id = new_dept_id where id = emp_id;
end //

-- 10. Get Employees with Salary Above Average
delimiter //
create procedure above_average_salaries()
begin
    select * from employees where salary > (select avg(salary) from employees);
end //
