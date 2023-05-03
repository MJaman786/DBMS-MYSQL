DROP DATABASE ADMIN;
CREATE DATABASE ADMIN;
USE ADMIN;

CREATE TABLE CITY(
	CITY_ID INT auto_increment,
    CITY_NAME VARCHAR(30) NOT NULL,
    PRIMARY KEY(CITY_ID)
);

INSERT INTO CITY (CITY_NAME) VALUES ('PUNE');
INSERT INTO CITY (CITY_NAME) VALUES ('DELHI');
INSERT INTO CITY (CITY_NAME) VALUES ('MUMBAI');

INSERT INTO CITY (CITY_NAME)
VALUES
('JAIPUR'),
('KOLKATA'),
('SURAT'),
('CHENNAI'),
('BHOPAL'),
('NAGPUR');

CREATE TABLE STUDENT(
	STUDENT_ID BIGINT NOT NULL,
    STUDENT_NAME VARCHAR(130) NOT NULL,
    STUDENT_PHONE BIGINT NOT NULL,
    STUDENT_CITY INT
);

ALTER TABLE STUDENT
ADD FOREIGN KEY(STUDENT_CITY) REFERENCES CITY(CITY_ID);

INSERT INTO STUDENT (STUDENT_ID,STUDENT_NAME,STUDENT_PHONE,STUDENT_CITY) VALUES (100,'RAKESH SHARMA',1230985674,1);
INSERT INTO STUDENT (STUDENT_ID,STUDENT_NAME,STUDENT_PHONE,STUDENT_CITY) VALUES (101,'SUNIL YADAV',4566542347,2);
INSERT INTO STUDENT (STUDENT_ID,STUDENT_NAME,STUDENT_PHONE,STUDENT_CITY) VALUES (102,'JASPRIT BUMRA',4562347786,3);
INSERT INTO STUDENT (STUDENT_ID,STUDENT_NAME,STUDENT_PHONE,STUDENT_CITY) VALUES (103,'VIRAT KOHLI',1233214560,5);
INSERT INTO STUDENT (STUDENT_ID,STUDENT_NAME,STUDENT_PHONE,STUDENT_CITY) VALUES (104,'MAHENDRASINGH DHONI',9876780986,4);

INSERT INTO STUDENT (STUDENT_ID,STUDENT_NAME,STUDENT_PHONE,STUDENT_CITY)
VALUES 
(105,'MOHAMAD SIRAJ',4562435649,2),
(106,'MOHAMAD SHAMI',2349875679,3),
(107,'HARDIK PANDYA',1233243234,3),
(108,'KUNAL PANDYA',12332234325,4);

-- ===================================================== 1. INNER JOINS ============================================================
-- Syntax for all types of join

-- SELECT * FROM TABLE_1 JOIN_TYPE TABLE_2
-- ON TABLE_1.COLUMN_NAME = TABLE_2.COLUMN_NAME
-- 		|			|
-- 	FOREIGN KEY		PRIMARY KEY

-- 1.INNER JOIN

-- SELECT * FROM TABLE_1 INNER JOIN TABLE_2
-- ON TABLE_1.COLUMN_NAME = TABLE_2.COLUMN_NAME
-- 		|			|
-- 	FOREIGN KEY		PRIMARY KEY

SELECT * FROM STUDENT INNER JOIN CITY
ON STUDENT.STUDENT_CITY = CITY.CITY_ID;


-- ====================================================== 2.RIGHT JOIN ================================================================

-- 2.OUTER JOIN

-- SELECT * FROM TABLE_1 RIGHT JOIN TABLE_2
-- ON TABLE_1.COLUMN_NAME = TABLE_2.COLUMN_NAME
-- 		|			|
-- 	FOREIGN KEY		PRIMARY KEY

SELECT S.STUDENT_ID,S.STUDENT_NAME,C.CITY_ID FROM STUDENT S RIGHT JOIN CITY C
ON S.STUDENT_CITY = C.CITY_ID;

-- ============================================= 3.LEFT JOIN ==========================================================================

-- 3.LEFT JOIN

-- SELECT * FROM TABLE_1 LEFT JOIN TABLE_2
-- ON TABLE_1.COLUMN_NAME = TABLE_2.COLUMN_NAME
-- 		|			|
-- 	FOREIGN KEY		PRIMARY KEY

SELECT S.STUDENT_ID,S.STUDENT_NAME,C.CITY_ID FROM STUDENT S LEFT JOIN CITY C
ON S.STUDENT_CITY = C.CITY_ID;

-- ============================================ 4. FULL JOIN ==========================================================================

-- 4.FULL JOIN

-- SELECT * FROM TABLE_1 FULL JOIN TABLE_2
-- ON TABLE_1.COLUMN_NAME = TABLE_2.COLUMN_NAME
-- 		|			|
-- 	FOREIGN KEY		PRIMARY KEY

SELECT * FROM STUDENT FULL JOIN CITY 
ON STUDENT.STUDENT_CITY = CITY.CITY_ID;