/* 
Qs: Create a database for your company named XYZ.
Stepl : create a table inside this DB to store employee info (id, name and salary).
Step2 : Add following information in the DB
1, "adam", 25000
2, "bob", 30000
3, "casey" , 40000
tep3 : Select & view all your table data.
*/
DROP DATABASE mydb;

CREATE DATABASE mydb;
USE mydb;

CREATE TABLE STUDENTS (
	Id INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(30) NOT NULL,
	Email VARCHAR(30) UNIQUE,
    Enroll_Time TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE City (
	CityId INT PRIMARY KEY AUTO_INCREMENT,
    CityName Varchar(30) UNIQUE NOT NULL
);

INSERT INTO City (CityName)
VALUES
('Pune'),
('Mumbai'),
('Nanded');

-- DESC STUDENTS;

-- ✅ No need to specify `Id`, it will be auto-incremented!
INSERT INTO STUDENTS (Name, Email) 
VALUES 
('AMAN', 'aman@gmail.com'),
('SOHAM', 'soham@gmail.com');

SELECT *, date_format(Enroll_Time, '%d-%m-%Y %r') AS DateTime_Enroll FROM STUDENTS;
SELECT 
    Id, Name, Email, 
    DATE_FORMAT(Enroll_Time, '%d-%m-%Y %r') AS Formatted_Time
FROM STUDENTS;

-- 1. adding foreign key in table students
ALTER TABLE STUDENTS
	ADD COLUMN CityId INT,
    ADD CONSTRAINT fk_city FOREIGN KEY(CityId) REFERENCES City(CityId) ON DELETE CASCADE;

-- 2. updating the CityId column in Student table
UPDATE STUDENTS
	SET CityId = 1 where name = 'AMAN';
    
UPDATE STUDENTS
	SET CityId = 1 where name = 'SOHAM';
    
SELECT * FROM STUDENTS; 

-- desc students;

-- ALTER table STUDENTS
-- 	RENAME COLUMN Name TO Stu_Name;
--     
-- DELETE FROM STUDENTS
-- 	WHERE Id = 2;

-- DELETE FROM City
-- 	WHERE CityName = 'Pune';

    

    

    
    
    
    
    
    