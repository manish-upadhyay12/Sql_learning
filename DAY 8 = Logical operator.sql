SELECT *FROM data_practice  ORDER BY employee_id ;
--LOGICAL OPERATOR 
-- 1. AND
-- 2. OR
-- 3. NOT

------------------------ Practice question --------------------------
-- Q1 (AND)
--Retrieve employees whose salary is greater than ₹60,000 and whose department is Finance.
SELECT first_name,
	   last_name,
	   department,
	   salary
from data_practice
WHERE salary>60000 AND department ='Finance';

-------------------------------completed ---------------------------------------------

--Q2 (AND)
--Display employees whose age is greater than or equal to 30 and whose experience
-- is more than 5 years.

SELECT first_name,
	   age,
	   salary 
FROM data_practice
WHERE age>=30 AND salary>75000;

------------------------------- completed ---------------------------------------------------
-- Q3 (OR)
-- Retrieve employees who belong to HR or Marketing..
SELECT *from data_practice
 WHERE department = 'HR' OR department ='Marketing';

------------------------------- completed ---------------------------------------------------

-- Q4 (OR)
-- Display employees whose salary is less than ₹35,000 or whose age is greater than 45.
SELECT *FROM data_practice
	WHERE salary <35000 OR age>45;

------------------------------- completed ---------------------------------------------------

-- Q5 (NOT)
-- Display employees who are not from the IT department.
SELECT  first_name,department FROM data_practice
	WHERE NOT department ='HR';

------------------------------- completed ---------------------------------------------------

-- Q6 (NOT)
-- Retrieve employees whose salary is not greater than ₹70,000.
SELECT first_name,
	   last_name,
	   salary
FROM data_practice
WHERE NOT salary>40000;
------------------------------- completed ---------------------------------------------------

-- Q7 (NOT)
-- Display employees who did not join after 2023-01-01.
SELECT first_name,
	   department,
	   salary,
	   joining_date
FROM data_practice
WHERE NOT joining_date >'2023-01-01';

------------------------------- completed ---------------------------------------------------

-- Q8 (NOT)
-- Retrieve employees whose department  is not Finance
SELECT first_name,
	   last_name,
	   department,
	   salary
FROM data_practice
WHERE NOT department ='Finance';

------------------------------- completed ---------------------------------------------------

------------------------⭐ Mixed Logical Operator Questions-----------------------
-- Q9 (AND + OR)
-- Display employees who satisfy either of these conditions:
-- Department is IT and salary is greater than ₹60,000 OR Age is less than 25
SELECT *FROM data_practice
WHERE (department ='IT' AND salary >60000 ) OR age<25;

------------------------------- completed ---------------------------------------------------

-- 🏆 Bonus Interview Question (AND + OR + NOT)
-- Retrieve employees who:
-- Department is HR or Finance
-- Salary is greater than ₹50,000
-- Age is not less than 30

SELECT *FROM  data_practice
 WHERE  (NOT age<30 )AND
 	    (department ='HR' OR department= 'Finance')
 	    AND salary>50000;

------------------------------- completed ---------------------------------------------------





























