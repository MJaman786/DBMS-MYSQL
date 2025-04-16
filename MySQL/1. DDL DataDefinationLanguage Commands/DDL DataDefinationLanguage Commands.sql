/*
📌 Data Definition Language (DDL) in SQL
DDL (Data Definition Language) is used to define, modify, and manage the structure of database objects like tables, indexes, and schemas.
These commands deal with the schema definition rather than modifying actual data.

*/
DROP DATABASE company_db;

-------------------------------------------------------------- 1️. CREATE Command --------------------------------------------------------
-- Used to create databases, tables, indexes, views, and stored procedures. 

-- * Creating a Database  
CREATE DATABASE company_db;

use company_db;
-- * Creating a Table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,                      -- PRIMARY KEY Constraint
    emp_name VARCHAR(50) NOT NULL,               -- NOT NULL Constraint
    email VARCHAR(100) UNIQUE,                   -- UNIQUE Constraint
    salary DECIMAL(10,2),-- CHECK Constraint
    department_id INT,
    CONSTRAINT fk_dept FOREIGN KEY (department_id) REFERENCES departments(dept_id) -- FOREIGN KEY Constraint
);


-- * Creating an Index
CREATE INDEX idx_emp_name ON employees(emp_name);

-- * Creating a View
CREATE VIEW high_salary AS 
SELECT emp_name, salary FROM employees WHERE salary > 50000;

-------------------------------------------------------------- 2️. ALTER Command ------------------------------------------------
-- Used to modify the structure of an existing table, such as adding/removing columns, changing data types, and renaming columns. 

-- # Adding a Column
ALTER TABLE employees 
	ADD email VARCHAR(100);

-- # Modify a Column (Change Data Type)
ALTER TABLE employees 
	MODIFY salary FLOAT;

-- # Rename a Column
ALTER TABLE employees 
	CHANGE emp_name full_name VARCHAR(100);
-- or
-- ALTER TABLE employees 
-- 	RENAME COLUMN emp_name TO full_name;

-- # Drop a Column
ALTER TABLE employees 
	DROP COLUMN email;

-- # Rename a Table
ALTER TABLE employees 
	RENAME TO staff;
    
-- # Adding Constraints
ALTER TABLE employees ADD CONSTRAINT chk_salary CHECK (salary >= 10000);
ALTER TABLE employees ADD CONSTRAINT emp_email_unique UNIQUE (email);

-- # Dropping Constraints
ALTER TABLE employees DROP PRIMARY KEY;  -- Drops PRIMARY KEY  
ALTER TABLE employees DROP FOREIGN KEY fk_dept;  -- Drops FOREIGN KEY  
ALTER TABLE employees DROP CHECK chk_salary;  -- Drops CHECK Constraint  
ALTER TABLE employees DROP INDEX emp_email_unique;  -- Drops UNIQUE Constraint  



----------------------------------------------------------------- 3. DROP Command -------------------------------------------------------
-- Used to permanently delete a database, table, or index. Caution: 
-- This command removes data and structure permanently.

-- Dropping a Table
-- DROP TABLE staff;

-- Dropping a Database
-- DROP DATABASE company_db;

-- Dropping an Index
DROP INDEX idx_emp_name ON staff;

-- Dropping a View
DROP VIEW high_salary;
----------------------------------------------------------- CHANGE Command ------------------------------------------------------------
-- Used to rename a column and/or change its data type.
-- syntax

ALTER TABLE table_name 
CHANGE old_column_name new_column_name new_data_type [constraints];

-- example
ALTER TABLE students 
CHANGE name student_name VARCHAR(50) NOT NULL;
----------------------------------------------------------- MODIFY Command ------------------------------------------------------------
-- Used to change the data type or constraints of an existing column without renaming it.
-- syntax
ALTER TABLE table_name 
MODIFY column_name new_data_type [constraints];

-- example
ALTER TABLE students 
MODIFY enroll_fees BIGINT NOT NULL;
----------------------------------------------------------- TRUNCATE Command ------------------------------------------------------------
-- Used to remove all records from a table while keeping its structure intact. 
-- It is faster than DELETE as it does not log individual row deletions.

-- Truncating a Table
TRUNCATE TABLE staff;

----------------------------------------------------------- RENAME Command -------------------------------------------------------------
-- Used to change the name of a table or database.

-- Renaming a Table
RENAME TABLE staff TO workers;

-- Renaming a Database
-- ALTER DATABASE old_db_name MODIFY NAME = new_db_name;
