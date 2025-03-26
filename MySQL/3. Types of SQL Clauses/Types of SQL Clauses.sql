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

INSERT INTO employees (emp_id, emp_name, salary, department_id) 
VALUES (101, 'John Doe', 50000, 1);

INSERT INTO employees (emp_id, emp_name, salary, department_id) 
VALUES 
(102, 'Alice Smith', 60000, 2), 
(103, 'Bob Johnson', 55000, 3),
(104, 'Jacks Luv', 60000, 4);

SELECT * FROM employees;

-------------------------------------------------------- 1. WHERE Clause (Filter Rows) ------------------------------------------------------
--  Used to filter records based on a condition.
-- Syntax
-- SELECT column1, column2 FROM table_name 
-- WHERE condition;

-- Retrieve employees with a salary greater than 50,000
SELECT emp_name, salary FROM employees 
	WHERE salary > 50000;
    
-- Get employees from department 3
SELECT * FROM employees
	WHERE department_id = 3;
    
----------------------------------------------------- 2. ORDER BY Clause (Sort Results) ---------------------------------------------------
/*
Sorts query results in ascending (ASC) or descending (DESC) order.

🔹 Syntax:
SELECT column1, column2 FROM table_name 
	ORDER BY column_name [ASC | DESC];
	
by default it is ascending
*/

-- Sort employees by salary (highest first)
SELECT * FROM employees;

SELECT * FROM employees
	ORDER BY salary DESC;
    
-- Sort names alphabetically
SELECT emp_id, emp_name FROM employees 
	ORDER BY emp_name;

-------------------------------------------------------- 3. GROUP BY Clause (Group Data) --------------------------------------------------
/*

✔ Groups records that have the same values in specified columns.
✔ Used with aggregate functions (SUM, COUNT, AVG, etc.).

🔹 Syntax:

SELECT column1, aggregate_function(column2) 
FROM table_name 
GROUP BY column1;

*/

--  Find total salary per department
SELECT department_id, SUM(salary) FROM employees 
GROUP BY department_id;

--  Count employees per department
SELECT department_id, COUNT(emp_id) FROM employees 
GROUP BY department_id;

----------------------------------------------------- 4. HAVING Clause (Filter Groups) ---------------------------------------------------
/*
✔ Filters records after grouping (like WHERE but used with GROUP BY).

🔹 Syntax:

SELECT column1, aggregate_function(column2) 
FROM table_name 
GROUP BY column1 
HAVING condition;

*/

--  Find departments where total salary exceeds 100,000
SELECT department_id, SUM(salary) FROM employees 
GROUP BY department_id 
HAVING SUM(salary) > 100000;

-- Show departments with more than 5 employees
SELECT department_id, count(emp_id) FROM employees
GROUP BY department_id
HAVING COUNT(emp_id) > 1;

-------------------------------------------------- 5. LIMIT Clause (Restrict Rows) ------------------------------------------------------
/*
✔ Restricts the number of rows returned in the result set.

🔹 Syntax:

SELECT column1, column2 FROM table_name 
LIMIT number;

*/

-- Get top 5 highest-paid employees
SELECT emp_name, salary FROM employees 
ORDER BY salary DESC 
LIMIT 5;

-- Fetch first 3 employees from a department
SELECT * FROM employees 
WHERE department_id = 2 
LIMIT 3;

----------------------------------------------------- 6.  DISTINCT Clause (Remove Duplicates) ---------------------------------------------
/*
Returns unique values from a column.

🔹 Syntax:
SELECT DISTINCT column_name FROM table_name;

*/

--  Get a list of unique departments
SELECT DISTINCT department_id FROM employees;

-- Retrieve unique job titles
SELECT DISTINCT salary FROM employees;






