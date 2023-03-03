# CREATE DATABASE aman; //commenting once database is otherwise it will gie error. 
USE  aman;

#create table to store some data.
CREATE TABLE STUDENT(
	Rollno int,
    Student_Name varchar(30),
    Marks float
);

DESC STUDENT;
INSERT INTO STUDENT (Rollno,Student_Name,Marks)
VALUES('1','Aman','90');
INSERT INTO STUDENT (Rollno,Student_Name,Marks)
VALUES('2','Ayan','70');
INSERT INTO STUDENT (Rollno,Student_Name,Marks)
VALUES('3','Ali','60');
INSERT INTO STUDENT (Rollno,Student_Name,Marks)
VALUES('4','Aryan','45');
INSERT INTO STUDENT (Rollno,Student_Name,Marks)
VALUES('5','Swapnil','50');

ALTER TABLE STUDENT
ADD City varchar(30);	

UPDATE STUDENT
SET City='Pune'
WHERE Rollno=1;

UPDATE STUDENT
SET City='Pune'
WHERE Rollno=2;

UPDATE STUDENT
SET City='Satara'
WHERE Rollno=3;

UPDATE STUDENT
SET City='kolhapur'
WHERE Rollno=4;

UPDATE STUDENT
SET City='Mumbai'
WHERE Rollno=5;