SELECT * FROM data_practice order BY  employee_id;

--comparision operator(=,!=,<,>,<=,>=)

--Q1 = Retrive all employees who work in HR Department
SELECT first_name,
	   last_name ,
	   department from data_practice
WHERE department ='HR';

--Q2  = Display all employees except those who belong to the Marketing department.
SELECT first_name,
	   department,
	   salary from data_practice
WHERE department != 'Marketing';

--Q3 = Find employees whose salary is greater than 50,000
SELECT first_name,
	   last_name,
	   Salary FROM data_practice
WHERE salary>50000;


--Q4 = Show employees who are younger than 25 years.
SELECT *FROM data_practice
WHERE age<25;


-- Q5 = Retrive all employee whose age is ''greater then equal'' 42
SELECt *FROM data_practice
WHERE age>=42

--Q6 = Retrive all employee email whose joining date is less than  equal'2023-02-25'
SELECT email,salary ,joining_date FROM data_practice
WHERE joining_date<='2023-02-25';

--Q7 =Display employees whose salary is greater than ₹40,000 and whose age  is more 
		--than 50 years.
SELECT *FROM data_practice
WHERE salary>40000 AND age>50;
 
--Q8 = Retrieve employees who do not belong to the IT department 
		--and have a salary greater than ₹60,000.
SELECT *FROM data_practice
where  department!='IT' AND salary>60000;

--Q9 = Find employees whose age is exactly 30 but whose salary is not ₹50,000
SELECT *FROM data_practice
WHERE age=30 AND salary!=50000;

--Q10 = Display employees who satisfy any one of these conditions:
		-- Salary is greater than ₹70,000
		-- Age is less than 23
		--Department is equal to 'IT'

SELECT *FROM data_practice
WHERE salary>70000 OR age<23 OR department='IT';




