/*
📌 Data Manipulation Language (DML) in SQL
DML (Data Manipulation Language) is used to modify and retrieve data stored in a database.
It includes commands like INSERT, UPDATE, DELETE, and SELECT. 
These commands do not change the structure of a table but manipulate the records inside it.
*/
DROP DATABASE employee;

CREATE DATABASE employee;

USE employee;

CREATE TABLE departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(30) NOT NULL UNIQUE
);

INSERT INTO departments 
(department_name) VALUES 
	('HR'),
	('Finance'),
	('IT'),
	('Marketing');

SELECT * FROM departments;


CREATE TABLE employees(
	emp_id INT PRIMARY KEY,
    emp_name VARCHAR(30) NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    department_id INT,
    CONSTRAINT fk_department_id 
		FOREIGN KEY (department_id) REFERENCES departments(department_id)
        ON DELETE CASCADE
);



-------------------------------------------------- 1. INSERT Command (Adding Data) ----------------------------------------------------------
-- The INSERT command is used to add new records to a table.
-- 🔹 Syntax: INSERT INTO table_name (column1, column2, ...) VALUES (value1, value2, ...);

INSERT INTO employees (emp_id, emp_name, salary, department_id) 
VALUES (101, 'John Doe', 50000, 1);

INSERT INTO employees (emp_id, emp_name, salary, department_id) 
VALUES 
(102, 'Alice Smith', 60000, 2), 
(103, 'Bob Johnson', 55000, 3),
(104, 'Jacks Luv', 60000, 4);

SELECT * FROM employees;

--  Inserting data from another table (employees table TO retired_employees table)

CREATE TABLE retired_employees (
	emp_id INT PRIMARY KEY, 
    emp_name VARCHAR(30) NOT NULL, 
    salary DECIMAL(10,2) NOT NULL
);

INSERT INTO retired_employees (emp_id, emp_name, salary)
SELECT emp_id, emp_name, salary FROM employees WHERE department_id = 4;

SELECT * FROM retired_employees;

----------------------------------------------------- 2. UPDATE Command (Modifying Existing Data) -------------------------------------
-- The UPDATE command modifies existing records in a table.
-- 🔹 Syntax: 
-- UPDATE table_name SET column1 = value1, column2 = value2 WHERE condition;

SELECT * FROM employees;

--  Updating an employee’s salary
UPDATE employees 
	SET salary = 65000 WHERE emp_id = 104;
    
--  Increases salary by 10% for employees in department 2.
UPDATE employees 
	SET salary = salary * 1.10 WHERE department_id = 2;
    
-- for multiple where conditions
UPDATE employees
	SET salary = salary * 1.10 WHERE department_id IN (3, 1);

-- Updating multiple columns at once
UPDATE employees 
	SET salary = 70000, department_id = 3 WHERE emp_id = 102;

--  Updating all records (use with caution!)
UPDATE employees SET salary = salary * 1.05;

-------------------------------------------------- DELETE Command (Removing Data) ---------------------------------------------------------
-- Syntax:
-- DELETE FROM table_name WHERE condition;

-- Deleting a specific employee
DELETE FROM employees WHERE emp_id = 103;

-- Deleting all employees from a specific department
DELETE FROM employees WHERE department_id = 4;


SELECT * FROM employees;


