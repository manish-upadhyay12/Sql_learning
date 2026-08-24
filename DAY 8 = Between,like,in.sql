

-- -- BETWEEN  OPERATOR
--    LIKE OPERATOR
--    IN OPERATOR

-- BETWEEN
-- Q1. Display all employees whose age is between 20 and 30.
SELECT first_name,
	   age
from data_practice
WHERE age BETWEEN 20  AND 30;

---------------------------COMPLETED ------------------------------
--Q2. Show employees whose salary is between 30000 and 50000.
SELECT first_name,
	   department,
	   salary
FROM data_practice
WHERE  salary BETWEEN 30000 AND 50000;

---------------------------COMPLETED ------------------------------

-- Q3. Display employees who joined between '2023-01-01' and '2023-12-31'.
SELECT first_name,
	   joining_date
from data_practice
WHERE joining_date BETWEEN  '2023-01-01' and '2023-12-31';

---------------------------COMPLETED ------------------------------

--Q4. Show employees whose age is NOT BETWEEN 25 AND 35.
SELECT first_name,
       age
from data_practice
WHERE NOT age BETWEEN 25 AND 35;

---------------------------COMPLETED ------------------------------

--Q5. Find employees whose salary is between 40000 and 60000 and department is 'IT'.
SELECT first_name,
	   salary,
	   department
from data_practice
WHERE salary BETWEEN 40000 AND 50000 AND (department = 'IT');

---------------------------COMPLETED ------------------------------

--Q6. Display employees whose joining_date is between '2022-01-01' and CURRENT_DATE
SELECT first_name,
	   joining_date
from data_practice 
WHERE joining_date  between '2022-01-01' and CURRENT_DATE;

---------------------------COMPLETED ------------------------------
-- Q7. Write a query to display employees whose age is between 18 and 25,
-- but salary is NOT BETWEEN 25000 AND 40000.
SELECT first_name,
	   age,
	   salary
from data_practice 
WHERE (age BETWEEN 18 AND 25) and (salary BETWEEN 25000 AND 40000);

---------------------------BETWEEN COMPLETED ------------------------------

--------------------------LIKE OPERATOR START ----------------------------
--Q1. Display employees whose name starts with 'A'
SELECT * FROM data_practice
WHERE first_name like 'A%' ;

---------------------------COMPLETED ------------------------------

--Q2. Display employees whose name starts with 'S' and ends with 'h'.
SELECT first_name from data_practice
WHERE first_name like 'S%%h';

---------------------------COMPLETED ------------------------------

--Q3. Find employees whose second letter is 'a'.
SELECT first_name from data_practice
WHERE first_name like '_a%';


--Q4. Find employees whose third letter is 'r'.
SELECT first_name FROM data_practice
	WHERE first_name like '__r%';

---------------------------COMPLETED ------------------------------

--Q5. Display employees whose names contain at least two 'a' characters.
SELECT *FROM data_practice 
	WHERE first_name  like '%a%a%%a%';

---------------------------COMPLETED ------------------------------


-- Q6. Display employees whose name has exactly 5 characters.
select first_name from data_practice
	WHERE length(first_name) = 5

---------------------------COMPLETED ------------------------------

-------------------------- IN OPERATOR ---------------------------------------

--Q1. Display employees from departments IT, HR, and Sales.
SELECT * from data_practice
	WHERE department IN('IT','HR','Sales');

--------------------------COMPLETED ------------------------------

--Q2. Find employees whose salary is 30000, 50000, or 70000.

SELECT first_name,
	   salary
from data_practice
WHERE salary IN(30000,50000,70000);
SELECT *FROM data_practice;

--------------------------COMPLETED ------------------------------

--Q4. Display employees NOT IN ('HR', 'Finance').
SELECT first_name,
	   department,
	   salary
from data_practice
WHERE  NOT department IN('HR','Finance');

--------------------------COMPLETED ------------------------------

--Q5. Find employees whose department is in ('IT', 'Finance') and salary is greater than 50000.

SELECT first_name,
 	   department,
		salary
from data_practice
WHERE department IN('IT','Finance') AND salary>50000;

--------------------------COMPLETED ------------------------------
-- Q6. Write a query to display employees whose department is NOT IN ('HR','Sales') and age is between 20 and 30.

SELECT first_name,
 	   department,
		age
from data_practice
WHERE  (not department IN('HR','Finance') )and( age between 20 and 30);


-- Q10. Combine all three operators:

-- Find employees who:
-- Department is IN ('IT','Sales')
-- Salary is BETWEEN 40000 AND 70000
-- Name starts with 'A'
SELECT * FROM data_practice
	WHERE (department IN('IT','Finance')) 
		   AND( Salary BETWEEN 56431.43 AND 88476.72)
		   AND (first_name like 'A%');

SELECT SALARY FROM data_practice
where salary >70000;

------------------------MIX QUESTION (BETWEEN , IN , LIKE) -----------------------------------------------------------

-- Q1 =Employees whose age is NOT BETWEEN 25 AND 35, department IN ('FINANCE','Marketing'), and name contains 'an'.
SELECT *FROM data_practice
	WHERE  NOT age between 25 and 35              -- condition -1
		   AND department in('Finance','Marketing')   -- condition -2
		   AND first_name like '%an%';            -- condition -3

--------------------------COMPLETED ------------------------------

--Q2 =Employees who joined in 2024, name starts with 'S', and department is NOT IN ('HR','Finance').
SELECT *FROM data_practice
	where joining_date BETWEEN  '2024-01-01' AND '2024-12-31'
		  AND first_name like 'S%'
		  AND NOT department IN('HR','Finance');

------------------------MIX QUESTION (BETWEEN , IN , LIKE) -----------------------------------------------------------
-- Q3 =Employees whose name has exactly 6 characters,
-- salary between 50000 and 80000, and department is IN ('IT','FINANCE','Admin').

SELECT first_name,
		salary,
		department
from data_practice
WHERE LENGTH(first_name)=6
	  AND salary BETWEEN 50000 AND 80000
	  AND department IN ('IT','Finance','HR');

--------------------------COMPLETED ------------------------------



-------------------------- IMPORTANT DETAIL --------------------------------------------------------
1. __  =used to find letter matching name inside the name
2. like = it means i want like this type of detail
3. % = help to find characher in starting or ending
4. note: how many character we want write inside % side and place this in both side
5. length(column_name) = it is used to find the length of word and it wants column name
6. note : we can use multiple between ,and ,or,in,not  but in a structure way 













