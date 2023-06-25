/*

								ASSIGNMENT 7 : VIEW
	Execute DDL/DML statements which demonstrate the use of views. Update the base 
	table using its corresponding view.

*/
DROP DATABASE STUDENT_DATA;
CREATE DATABASE STUDENT_DATA;
USE STUDENT_DATA;

CREATE TABLE CITY(
	CITY_ID INT NOT NULL,
    CITY_NAME VARCHAR(30) NOT NULL DEFAULT 'PUNE', 
    PRIMARY KEY(CITY_ID)
); 

INSERT INTO CITY(CITY_ID,CITY_NAME)
VALUES
(1,DEFAULT),
(2,'DELHI'),
(3,'MUMBAI'),
(4,'CHENNI');

CREATE TABLE COURSES(
	COURSE_ID INT NOT NULL,
    COURSE_NAME VARCHAR(130) NOT NULL,
	PRIMARY KEY(COURSE_ID)
);

INSERT INTO COURSES(COURSE_ID,COURSE_NAME)
VALUES
(1001,'INFORMATION TECHNOLOGY'),
(1002,'COMPUTER SCIENCE'),
(1003,'ELECTRONIC AND TELECOMMUNICATION'),
(1004,'MECHANICAL');

CREATE TABLE STUDENT(
	STUDENT_ID BIGINT NOT NULL,
	STUDENT_NAME VARCHAR(120) NOT NULL,
    STUDENT_CITY INT NOT NULL,
    STUDENT_COURSES INT NOT NULL,
    PRIMARY KEY(STUDENT_ID,STUDENT_COURSES),
    FOREIGN KEY(STUDENT_CITY) REFERENCES CITY(CITY_ID),
    FOREIGN KEY(STUDENT_COURSES) REFERENCES COURSES(COURSE_ID)
);
INSERT INTO STUDENT(STUDENT_ID,STUDENT_NAME,STUDENT_CITY,STUDENT_COURSES)
VALUES
(1122,'ROHAN KUMAR',1,1001),
(1123,'ALLU ARJUN',4,1002),
(2244,'NOBITA NOBI',3,1004),
(2245,'PRATHAMESH PATIL',1,1002),
(2246,'SIDDESH KUMBAR',2,1001);

SELECT * FROM STUDENT_DATA.CITY;

SELECT * FROM STUDENT_DATA.COURSES;

#1 ALTER COMMAND

SELECT * FROM STUDENT_DATA.STUDENT;

ALTER TABLE STUDENT
RENAME COLUMN STUDENT_ID TO STUDENT_NO;

SELECT * FROM STUDENT_DATA.STUDENT;

ALTER TABLE STUDENT
ADD COLUMN EMAIL VARCHAR(20);

SELECT * FROM STUDENT_DATA.STUDENT;

# TO DROP CONSTRAINT
# ALTER TABLE table_name
# ALTER COLUMN column_name SET NULL;

DESC STUDENT;

# 2.DROP COMMAND
ALTER TABLE STUDENT
DROP COLUMN EMAIL;

DESC STUDENT;

SELECT * FROM STUDENT; 

# 3.MODIFY
# ALTER TABLE table_name
# MODIFY COLUMN column_name datatype;

ALTER TABLE STUDENT
MODIFY STUDENT_NO VARCHAR(20);

DESC STUDENT;

-- ========================== VIEWS ====================================

-- SYNTAX:
/*	CREATE VIEW VIEW_NAME
    AS
    WRITE YOUR QUERY
*/

-- VIEW 1 TO DISPLAY INNER JOIN 
CREATE VIEW INNER_JOIN 
AS
SELECT STUDENT_NAME,STUDENT_CITY,CITY_NAME FROM STUDENT INNER JOIN CITY
ON STUDENT.STUDENT_CITY = CITY.CITY_ID;

SELECT * FROM INNER_JOIN;

-- VIEW 2 TO DISPLAY RIGHT JOIN

INSERT INTO CITY (CITY_ID,CITY_NAME)
VALUES
(5,'LATUR'),
(6,'NAGPUR');

CREATE VIEW RIGHT_JOIN
AS
SELECT STUDENT_NAME,STUDENT_CITY,CITY_NAME FROM STUDENT RIGHT JOIN CITY
ON STUDENT.STUDENT_CITY = CITY.CITY_ID;
SELECT * FROM RIGHT_JOIN;

-- ====================== VIEW FOR DISPLAYING STUDENT NAME AND THERE CITY ====================

DROP VIEW STUDENT_CITY;
CREATE VIEW STUDENT_CITY
AS
SELECT S.STUDENT_NAME,C.CITY_NAME FROM STUDENT S ,CITY C
WHERE STUDENT_CITY = CITY_ID 
ORDER BY (CITY_NAME);
SELECT * FROM STUDENT_CITY;

-- ====================== VIEW FOR DISPLAYING STUDENT_NAME AND COURSES ENROLLED ==============

DROP VIEW STUDENT_C;
CREATE VIEW STUDENT_C
AS
SELECT * FROM STUDENT , COURSES 
WHERE STUDENT_COURSES = COURSE_ID;
-- ORDER BY (STUDENT_NAME);

SELECT * FROM STUDENT_C;

UPDATE STUDENT_C
SET STUDENT_NAME = 'ROHAN MASNE'
WHERE STUDENT_COURSES = 1001;

SELECT * FROM STUDENT;

-- ============================================================
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50)
);


INSERT INTO Employees (EmployeeID, FirstName, LastName, Department)
VALUES (1, 'John', 'Doe', 'HR'),
       (2, 'Jane', 'Smith', 'IT'),
       (3, 'David', 'Johnson', 'Finance');

CREATE VIEW EmployeeView AS
SELECT EmployeeID, FirstName, LastName, Department
FROM Employees;

SELECT * FROM EmployeeView;

UPDATE EmployeeView
SET Department = 'Sales'
WHERE EmployeeID = 2;

-- ======================= + ==================================
