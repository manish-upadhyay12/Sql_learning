 --------------ALL PRACTICE QUESTIONOF SQL 

/*
🟢 Level 1 (Basic SQL) (Q1-Q10)
Question 1 :

The HR department wants to see all employee details.

👉 Write a query to display every employee.
*/
SELECT *FROM data_practice 
		ORDER BY first_name asc;

/*
Question 2 : The finance manager only needs employee names and salaries.

Expected Columns

first_name
last_name
salary
*/

SELECT first_name,
	   last_name,
	   salary
FROM data_practice
ORDER BY first_name asc;

/*
Question 3

Find all employees working in the IT department.
*/
SELECT * FROM data_practice
	 WHERE department = 'IT'
	 ORDER BY first_name;


--Question 4: Show employees whose salary is greater than 70000.

SELECT first_name,
	   last_name,
	   email,
	   department,
	   salary
FROM data_practice
WHERE salary>70000;


--Question 5: Find employees aged less than 30
SELECT *FROM data_practice
	WHERE age <30;


--	Question 6 : Display all employees sorted by salary from highest to lowest.
SELECT first_name,
	    department,
		salary
FROM data_practice 
ORDER BY salary DESC;

--Question 7 : Display employees sorted alphabetically by first name.
SELECT first_name,
	    department,
		salary
FROM data_practice
ORDER BY first_name ASC;

/*
Question 8
Find employees whose department is either
HR
Finance
*/
SELECT  first_name,
	    last_name,
		department,
		salary
FROM data_practice
WHERE department IN('HR' ,'Finance');

--Question 9 : Show employees whose salary is between 50,000 and 80,000.
SELECT first_name,
       salary
from data_practice
WHERE salary BETWEEN 50000 AND 80000;

--Question 10 : Display employees hired after 1 January 2023. 

SELECT * from data_practice
WHERE joining_date >'2023-01-01';


/*
🟡 Level 2 (Filtering Practice) (Q11-Q20)
Question 11

The HR manager wants employees whose first name starts with J.
*/
SELECT first_name,
 	   last_name,
	   department,
	   salary
FROM data_practice
WHERE first_name LIKE 'J%';


/*
Question 12
	Find employees whose email ends with
		@gmail.com1
		*/
SELECT *FROM data_practice
	WHERE  email  LIKE '%@gmail.com';


-- Question 13 : Find employees whose last name contains son

SELECT* FROM data_practice
	 WHERE last_name LIKE '%son%';


--Question 14 : Display employees who are not from the Marketing department.

SELECT * FROM data_practice
	 WHERE  not department = 'Marketing';

-- Question 15 : Find employees aged between 25 and 40.

SELECT first_name,
	   last_name,
	   department,
	   age,
	   salary
FROM data_practice
WHERE age between 25 and 40;


-- Question 16 : Show employees whose salary is greater than 60000 AND belong to the IT department.

SELECT first_name,
	   last_name,
	   department,
	   salary,
	   age
FROM data_practice
WHERE salary >60000 AND department = 'IT';



/*
Question 1 : Find employees who belong to

HR
Marketing
Finance

using a single condition.
*/

SELECT *FROM data_practice
	WHERE department  IN('HR','Marketing','Finance');

-- Question 2 : Find employees whose salary is greater than 90000 OR age is less than 25.
SELECT  *FROM data_practice
	WHERE salary >90000 OR  age <25;

-- Question 3: Display employees hired during 2024.

SELECT *FROM data_practice
	 WHERE joining_date BETWEEN '2024-01-01' AND '2024-12-31';

--  Question 4 : Find employees whose first name starts with A and ends with n.
SELECT *FROM data_practice
	WHERE first_name LIKE 'A%a';  -- there is no need to use multiple time %
	

-- Question 5: The company is giving everyone a ₹5000 salary hike.
/*
Update the salaries.
*/ 
UPDATE data_practice
	SET  salary = salary +5000;
SELECT * FROM data_practice  order by employee_id asc ;


 -- Question 6 : Employees in the HR department receive an extra bonus of ₹1000.Update only HR employees.


UPDATE data_practice
SET salary = (salary +1000)
WHERE department = 'HR';
SELECT employee_id,
	  first_name,
	   last_name,
	   department,
	   salarY
FROM data_practice order by employee_id;


-- Question 7 : The employee whose ID is 15 changed their email. Update the email.

UPDATE data_practice
SET email= 'newemailid78@gmail.com'
WHERE employee_id = 15;
SELECT first_name,
	   email
FROM data_practice
ORDER BY employee_id ASC;


/*Question 8

Employees older than 55 receive a salary increase of 10%.

Update only those employees.
*/
UPDATE data_practice
SET salary = salary +(salary*0.1)
WHERE  age>55;
select * from data_practice;


-- Question 9 : The Marketing department has been renamed to  Digital Marketing
--              Update the department name.

UPDATE data_practice
SET department = 'Digital Marketing'
WHERE department = 'Marketing';
SELECT first_name,
	   department
FROM data_practice
where department = 'Digital Marketing';

--Question 10 :  Increase the age of every employee by 1 year

UPDATE data_practice
SET age = age +1;
SELECT first_name ,age From data_practice;



--=====================================🔴 Level 4 (DELETE & ALTER Practice) (Q27-Q30)========================
--=====================================   ==========================================  =======================================

-- Question 27 : Delete employees whose salary is less than 35000.


DELETE FROM data_practice 
WHERE salary <35000;

SELECT * FROM data_practice
WHERE SALARY >35000
ORDER BY salary ASC;

--Question 28 : Delete employees who joined before 2020.
DELETE FROM data_practice
WHERE joining_date <'2020-12-31';

SELECT *FROM DATA_PRACTICE
WHERE joining_date >'2020-12-31'
ORDER BY joining_date ASC;









--==================================================================================================
--==================================================================================================

--Question 30 : Question 7
/*
Display all employees ordered by

department (A-Z)
salary (Highest First)
*/

SELECT *FROM data_practice ORDER BY EMPLOYEE_ID ASC;
ORDER BY department ASC,salary desc;


/*
Question 31

Display employees whose employee_id is one of
1
8
15
21
*/
SELECT *FROM data_practice
WHERE employee_id IN(1,8,15,21)
order by employee_id asc;


-- Question 32 : Find employees whose first name contains exactly 5 letters.
SELECT  first_name from data_practice
where length(first_name) = 5;

--Question 33 : Find employees whose department starts with  D

SELECT first_name,department from data_practice
WHERE department LIKE 'D%';



--================================ Operators & Conditions ===============
-- Question 19 : Find employees earning more than ₹75,000 and older than 30.
SELECT first_name,
	   salary,
	   age
FROM data_practice
WHERE salary >75000 and age  >30;


--Question 23 :Find employees whose salary is between ₹45,000 and ₹70,000 AND belong to Finance.

SELECT *FROM data_practice
WHERE salary BETWEEN 45000  AND 70000 and department = 'Finance';

--Question 25 :  Find employees whose email is NULL.
SELECT first_name FROM data_practice
WHERE email is NULL;



---==================================CASE WHEN ==========================================
--===================================  ======  ==========================================
/*
Question 27 : Create a column named

	Salary_Status
	
	Rules
	
	salary > 90000      High
	salary > 70000      Medium
	Otherwise           Low
*/
ALTER TABLE data_practice 
ADD COLUMN Salary_status VARCHAR(10);  -- add new column


UPDATE data_practice
set Salary_status = 
		CASE 
			WHEN salary >90000 then 'High'
			WHEN salary >70000 then 'Medium'
			else 'LOW'
		END;
SELECT  first_name, salary,salary_status FROM data_practice;  -- see whole data
	
/*
Question 28 : Create a column

Age_Group

Rules

18-25      Young

26-40      Adult

41+        Senior
*/
ALTER TABLE data_practice
ADD COLUMN age_group VARCHAR(10);

UPDATE data_practice
set age_group = 	
	 CASE 
	 	WHEN age BETWEEN 18  AND 25 THEN 'young'
		 WHEN age BETWEEN 26 AND 40 THEN 'Adult'
		 WHEN age >41 THEN 'Senior'
	END;
SELECT first_name,
	   age_group
FROM data_practice;

/*
--Question 29

Create a column

Experience

Rules

Joined before 2020      Experienced
Otherwise               New Employee
*/
	












