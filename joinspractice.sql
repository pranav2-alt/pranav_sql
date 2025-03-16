-- 1. Retrieve all customers and their orders (including customers with no orders).
SELECT customers.customer_id, customers.name, orders.order_id, orders.total_amount
FROM customers, orders
WHERE customers.customer_id = orders.customer_id(+);

-- 2. Retrieve all orders and the customers who placed them (including orders with no customers).
SELECT orders.order_id, orders.total_amount, customers.customer_id, customers.name
FROM orders, customers
WHERE orders.customer_id = customers.customer_id(+);

-- 3. List employees and the departments they belong to.
SELECT employees.employee_id, employees.name, departments.department_name
FROM employees, departments
WHERE employees.department_id = departments.department_id;

-- 4. Find products and their categories (including products without categories).
SELECT products.product_id, products.product_name, categories.category_name
FROM products, categories
WHERE products.category_id = categories.category_id(+);

-- 5. Retrieve all invoices and the customers associated with them.
SELECT invoices.invoice_id, invoices.amount, customers.customer_id, customers.name
FROM invoices, customers
WHERE invoices.customer_id = customers.customer_id;

-- 6. Get the list of all students and their courses (including students not enrolled in any courses).
SELECT students.student_id, students.name, courses.course_name
FROM students, enrollments, courses
WHERE students.student_id = enrollments.student_id(+)
AND enrollments.course_id = courses.course_id(+);

-- 7. Retrieve all employees and their managers.
SELECT e1.employee_id AS EmployeeID, e1.name AS EmployeeName, e2.name AS ManagerName
FROM employees e1, employees e2
WHERE e1.manager_id = e2.employee_id(+);

-- 8. Find all authors and their books (including authors without books).
SELECT authors.author_id, authors.name, books.title
FROM authors, books
WHERE authors.author_id = books.author_id(+);

-- 9. Get the list of all orders and the products in them.
SELECT orders.order_id, products.product_name, order_details.quantity
FROM orders, order_details, products
WHERE orders.order_id = order_details.order_id
AND order_details.product_id = products.product_id;

-- 10. Retrieve all teachers and the classes they teach (including teachers without classes).
SELECT teachers.teacher_id, teachers.name, classes.class_name
FROM teachers, classes
WHERE teachers.teacher_id = classes.teacher_id(+);
