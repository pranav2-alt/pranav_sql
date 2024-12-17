DROP DATABASE companies;
CREATE DATABASE companies;

-- Use the companies database
USE companies;

-- Create a table inside the companies database
CREATE TABLE companies_table (
    id INT
);

-- Insert a record into the companies_table
INSERT INTO companies_table (id) VALUES (10);

-- Select all records from companies_table
SELECT * FROM companies_table;

-- Add a new column 'phone' to the companies_table
ALTER TABLE companies_table
ADD COLUMN phone VARCHAR(15);

-- Select all records from companies_table after adding the new column
SELECT * FROM companies_table;

-- Add another new column 'employee_count3' to the companies_table
-- Also set it as NOT NULL
ALTER TABLE companies_table
ADD COLUMN employee_count3 INT NOT NULL;

-- Select all records from companies_table after adding the new column
SELECT * FROM companies_table;

-- Rename table 'companies' to 'newcompany1'
-- You cannot rename 'companies' to 'newcompany1' directly if it's already created.
-- To follow the operations as per the context, we'll rename the 'companies_table'
RENAME TABLE companies_table TO newcompany1;

-- Select data from the renamed table 'newcompany1'
SELECT * FROM newcompany1;

-- Rename the table back to 'companies_table'
RENAME TABLE newcompany1 TO companies_table;

-- Select data from the renamed table 'companies_table'
SELECT * FROM companies_table;

-- Drop, delete, truncate difference:
-- DELETE: DML operation, can be rolled back if no COMMIT is done. You can delete specific rows using a WHERE condition.
-- DROP: DDL operation, deletes both the data and the structure of the table. Cannot be rolled back.
-- TRUNCATE: DDL operation, deletes the data but keeps the structure. Cannot be rolled back. It is faster than DELETE.
