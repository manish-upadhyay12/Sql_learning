---------------------- TODAY LEARNING : SET OPERATORS ----------------------

-- 1. UNION      = Combines results and removes duplicate rows
-- 2. UNION ALL  = Combines results and keeps duplicate rows
-- 3. INTERSECT  = Returns rows that are common in both queries
-- 4. EXCEPT     = Returns rows from the first query that are not present in the second query


CREATE TABLE students_2023 (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    course VARCHAR(50)
);

INSERT INTO students_2023 VALUES
(1,'Aarav Sharma','Computer Science'),
(2,'Ishita Verma','Mechanical Engineering'),
(3,'Kabir Patel','Electronics'),
(4,'Ananya Desai','Civil Engineering'),
(5,'Rahul Gupta','Computer Science');


CREATE TABLE students_2024 (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    course VARCHAR(50)
);

INSERT INTO students_2024 VALUES
(3,'Kabir Patel','Electronics'),
(4,'Ananya Desai','Civil Engineering'),
(5,'Rahul Gupta','Computer Science'),
(6,'Ayush Singh','Artificial Intelligence'),
(7,'Rohan Singh','Computer Science');


-------------------------------------------------
-- UNION
-- Combines both tables and removes duplicate rows
-------------------------------------------------

SELECT student_name, course
FROM students_2023

UNION

SELECT student_name, course
FROM students_2024
ORDER BY student_name;


-------------------------------------------------
-- UNION ALL
-- Combines both tables and keeps duplicate rows
-------------------------------------------------

SELECT student_name, course
FROM students_2023

UNION ALL

SELECT student_name, course
FROM students_2024;


-------------------------------------------------
-- INTERSECT
-- Returns only common rows from both tables
-------------------------------------------------

SELECT student_name, course
FROM students_2023

INTERSECT

SELECT student_name, course
FROM students_2024;


-------------------------------------------------
-- EXCEPT
-- Returns rows that exist in students_2023
-- but not in students_2024
-------------------------------------------------

SELECT student_id
FROM students_2023

EXCEPT

SELECT student_id
FROM students_2024;