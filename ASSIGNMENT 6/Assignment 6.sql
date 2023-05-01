DROP database employee_management;
CREATE DATABASE EMPLOYEE_MANAGEMENT;
USE EMPLOYEE_MANAGEMENT;
CREATE TABLE MANAGER (
    MANAGER_ID VARCHAR(10),
    MANAGER_NAME VARCHAR(50),
    MANAGER_EMAIL VARCHAR(50),
    MANAGER_PHONE VARCHAR(50),
    PRIMARY KEY(MANAGER_ID,MANAGER_EMAIL)
);
DESC MANAGER;

INSERT INTO MANAGER(MANAGER_ID,MANAGER_NAME,MANAGER_EMAIL,MANAGER_PHONE)
VALUES
('M-12','JHON WICK','jhon@email.com',1112221234),
('M-10','MOHAN LAL','mohan@email.com',4445556661);


CREATE TABLE DEPARTMENT (
	
    DEPARTMENT_ID BIGINT NOT NULL,
    DEPARTMENT_NAME VARCHAR(30) NOT NULL,
    PRIMARY KEY(DEPARTMENT_ID)
    
);

DESC DEPARTMENT;

INSERT INTO DEPARTMENT (DEPARTMENT_ID,DEPARTMENT_NAME)
VALUES
(1,'DEVELOPER'),
(2,'DATA MANAGEMENT'),
(3,'DATA ANALYTICS');


CREATE TABLE EMPLOYEE_INFO (
	
    E_ID INT NOT NULL,
    E_NAME VARCHAR(30) NOT NULL,
    E_PHONE BIGINT NOT NULL,
    E_CITY VARCHAR(30) NOT NULL,
    E_DEPARTMENT BIGINT NOT NULL,
    MANAGER_ID VARCHAR(10),
	PRIMARY KEY(E_ID,E_PHONE),
    FOREIGN KEY(E_DEPARTMENT) REFERENCES DEPARTMENT(DEPARTMENT_ID),
    FOREIGN KEY(MANAGER_ID) REFERENCES MANAGER(MANAGER_ID)
);
DESC EMPLOYEE_INFO;

INSERT INTO EMPLOYEE_INFO (E_ID,E_NAME,E_PHONE,E_CITY,E_DEPARTMENT,MANAGER_ID) 
VALUES
(100,'JHON WICK',1009123452,'PUNE',1,'M-12'),
(100,'JHON WICK',1231234321,'PUNE',3,'M-12'),
(101,'SALMAN KHAN',1786549873,'MUMBAI',2,NULL),
(101,'SALMAN KHAN',1236541246,'MUMBAI',1,NULL),
(102,'MOHAN LAL',1236548761,'DELHI',3,'M-10'),
(103,'SUMAN VARMA',176456432,'DELHI',2,NULL);

SELECT * FROM EMPLOYEE_MANAGEMENT.DEPARTMENT;
SELECT * FROM EMPLOYEE_MANAGEMENT.MANAGER;
SELECT * FROM EMPLOYEE_MANAGEMENT.EMPLOYEE_INFO;

SELECT * FROM EMPLOYEE_MANAGEMENT.EMPLOYEE_INFO
WHERE E_ID = 100;

SELECT * FROM EMPLOYEE_MANAGEMENT.EMPLOYEE_INFO
WHERE E_ID = 101;

SELECT * FROM EMPLOYEE_MANAGEMENT.EMPLOYEE_INFO
WHERE E_ID = 102;

SELECT * FROM EMPLOYEE_MANAGEMENT.EMPLOYEE_INFO
WHERE E_ID = 103;

# ============================ UPDATING VALUES IN COLUMN SALARY ============================

ALTER TABLE EMPLOYEE_INFO
ADD COLUMN SALARY BIGINT NOT NULL;

ALTER TABLE EMPLOYEE_INFO
ADD BONUS BIGINT NOT NULL;

ALTER TABLE EMPLOYEE_INFO
ADD COLUMN T_SALARY BIGINT;

ALTER TABLE EMPLOYEE_INFO
ADD JOIN_DATE VARCHAR(200);

SELECT * FROM EMPLOYEE_INFO;

UPDATE EMPLOYEE_INFO				
SET SALARY = 300000,BONUS = 3000,T_SALARY = 303000,JOIN_DATE = '(2003-09-09)(09:25:02)'
WHERE E_ID = 101 AND E_DEPARTMENT = 1;

UPDATE EMPLOYEE_INFO
SET SALARY = 400000,BONUS = 4000,T_SALARY = 404000,JOIN_DATE = '(2003-09-09)(10:25:12)'
WHERE E_ID = 101 AND E_DEPARTMENT = 2;

##
UPDATE EMPLOYEE_INFO
SET SALARY = 530000 ,BONUS = 5000,T_SALARY = 535000,JOIN_DATE = '(2003-09-09)(12:25:22)'
WHERE E_ID = 102 AND E_DEPARTMENT = 3;

UPDATE EMPLOYEE_INFO
SET SALARY = 430000 ,BONUS = 4000,T_SALARY = 434000,JOIN_DATE = '(2003-09-09)(04:25:34)'
WHERE E_ID = 103 AND E_DEPARTMENT = 2;

UPDATE EMPLOYEE_INFO
SET SALARY = 600000,BONUS = 5500,T_SALARY = 605500,JOIN_DATE = '(2003-09-10)(11:25:024)'
WHERE E_ID = 100 AND E_DEPARTMENT = 1;

UPDATE EMPLOYEE_INFO
SET SALARY = 600000,BONUS = 5000,T_SALARY = 605000,JOIN_DATE = '(2003-09-11)(09:25:02)'
WHERE E_ID = 100 AND E_DEPARTMENT = 3;

INSERT INTO EMPLOYEE_INFO (E_ID,E_NAME,E_PHONE,E_CITY,E_DEPARTMENT,MANAGER_ID,SALARY,BONUS,T_SALARY,JOIN_DATE) 
VALUES
(104,'SWAPNIL GAIKWAD',1233214563,'PUNE',3,NULL,300000,3000,303000,'(2003-09-09)(09:25:02)'),
(105,'ANISH JAKTAP',4562346541,'DELHI',3,NULL,320000,3000,323000,'(2003-09-09)(09:25:02)'),
(106,'ADITYA SALUNKE',5642341237,'PUNE',1,'M-10',400000,4000,404000,'(2003-09-09)(09:25:02)'),
(107,'SONAL PAIL',7653459875,'MUMBAI',1,NULL,320000,3000,323000,'(2003-09-09)(09:25:02)'),
(108,'RAGHAV THAREJA',1235674563,'DELHI',2,NULL,300000,3000,303000,'(2003-09-09)(09:25:02)');

SELECT * FROM EMPLOYEE_INFO;
# ==================== 1.Implementation of relational operators in SQL ===========================
# OPERATORS LIKE { =, <, >, <=, >= } 

SELECT * FROM EMPLOYEE_INFO 
WHERE SALARY = 600000;

SELECT * FROM EMPLOYEE_INFO
WHERE SALARY >= 400000;

SELECT * FROM EMPLOYEE_INFO 
WHERE SALARY <=400000;

SELECT * FROM EMPLOYEE_INFO 
WHERE SALARY >500000; 

# ================================= 2. Boolean operators and pattern matching =========================================
# BOOLEN OPERATORS MEANS AND OR NOT

SELECT * FROM EMPLOYEE_INFO 
WHERE E_CITY = 'PUNE' AND E_DEPARTMENT = 1; 

SELECT * FROM EMPLOYEE_INFO
WHERE E_ID = 106 AND MANAGER_ID = 'M-10';

SELECT * FROM EMPLOYEE_INFO
WHERE SALARY = 400000 OR SALARY = 400000;

SELECT * FROM EMPLOYEE_INFO
WHERE NOT SALARY>400000;

# ========================================== 3. Arithmetic operations and built in functions  =============================

SELECT SALARY + BONUS ,E_NAME AS T_SALARY FROM EMPLOYEE_INFO;

SELECT SALARY - BONUS ,E_NAME AS T_SALARY FROM EMPLOYEE_INFO;

# ============================================ 4. Group By, Order By ,Having, Limit ================================

SELECT * FROM EMPLOYEE_INFO
WHERE SALARY<=400000
ORDER BY E_NAME;

SELECT COUNT(E_ID), E_CITY
FROM EMPLOYEE_INFO
GROUP BY E_CITY;

SELECT E_ID,E_CITY
FROM EMPLOYEE_INFO
GROUP BY E_ID,E_CITY;

# ============================================ 5. Processing Date and Time functions =================================

# DATETIME	YYYY-MM-DD HH:MM:SS	1000-01-01 00:00:00 to 9999-12-31 23:59:59

INSERT INTO EMPLOYEE_INFO(E_ID,E_NAME,E_PHONE,E_CITY,E_DEPARTMENT,MANAGER_ID,SALARY,BONUS,T_SALARY,JOIN_DATE) 
VALUES
(109,'SWAPNIL PATIL',1233214663,'PUNE',3,NULL,300000,3000,303000,now()),
(110,'AMIT WAGMARE',1222214563,'MUMBAI',2,NULL,300000,3000,303000,now());
