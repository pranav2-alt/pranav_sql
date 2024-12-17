-- Create the database
CREATE DATABASE companies;

-- Use the database
USE companies;

-- Create a table inside the companies database
CREATE TABLE companies_table (
    id INT
);

-- Insert a record into the companies_table
INSERT INTO companies_table VALUES (10);

-- Select all records from companies_table
SELECT * FROM companies_table;

ALTER TABLE companies_table
ADD COLUMN phone VARCHAR(15);

select * from companies_table;

ALTER TABLE companies_table
ADD COLUMN employee_count3 INT NOT NULL;

SELECT * FROM companies_table;

-- Rename table companies to newcompany1
RENAME TABLE companies TO newcompany1;

-- Select data from the renamed table newcompany1
SELECT * FROM newcompany1;

-- Rename the table back to companies
RENAME TABLE newcompany1 TO companies;

-- Select data from the renamed table companies
SELECT * FROM companies;
-- drop, delete , truncate difference
-- delete in dml operation with where condition delete can be roll back you can get back undo 
-- drop in ddl operation data and structure both can be delete you can not get back undo.
-- truncate in ddl statement data and table both can be drop and then structure 
-- update you can not get back undo
-- to find the second highest salary 

use employees;
select * from sakila.payemnt;

-- 




