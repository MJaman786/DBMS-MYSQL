DROP DATABASE mydb; 

CREATE DATABASE mydb;

use mydb;

CREATE TABLE branchtable(
	bid varchar(10) PRIMARY KEY,
    branchname varchar(50) not null
);

INSERT INTO branchtable (bid, branchname) VALUES
    ('IT', 'Information Technology'),
    ('CS', 'Computer Science'),
    ('ENTC', 'Electronics');

CREATE TABLE student (
	sid INT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    
/*
-- 1. syntax to add foreign key column
	branchid VARCHAR(10) NOT NULL,
	CONSTRAINT fk_branch 
		FOREIGN key(branch) REFERENCES branchtable(branch_id)
        ON DELETE CASCADE,
*/
    enroll_date DATETIME default current_timestamp
); 
 

INSERT INTO student 
	(sid, name, enroll_date) VALUES 
		(100, 'Aman', '2025-03-21 08:00');
        
INSERT INTO student 
	(sid, name) VALUES 
		(101, 'Aman'),
        (102, 'Omkar'),
        (103, 'Rohan');

-- 2. By using alter command add the foreign key column 
ALTER TABLE student
	ADD COLUMN branchid varchar(10),
    ADD CONSTRAINT fk_branchid 
		FOREIGN KEY(branchid) REFERENCES branchtable(bid)
        ON DELETE CASCADE;

-- updating subject column
UPDATE student SET branchid = 'IT' WHERE sid = 100;
UPDATE student SET branchid = 'CS' WHERE sid = 101;
UPDATE student SET branchid = 'ENTC' WHERE sid = 102;
UPDATE student SET branchid = 'CS' WHERE sid = 103;
        
SELECT sid, name, branchid, date_format(enroll_date, '%d-%m-%Y %r') AS enroll_date FROM student;

DELETE FROM branchtable
	WHERE bid = 'IT';
    
SELECT sid, name, branchid, date_format(enroll_date, '%d-%m-%Y %r') AS enroll_date FROM student;
