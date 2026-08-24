select *from data_practice;

-- Arithmetic operator(*,+,/,%)

-- 1) Retrive the first_name,salary and calculate 10% on  the salary
select first_name ,salary,(salary*0.1) AS bonus from  data_practice;

--2) Calculate the annual salary and salary increment by 5%- and show monthlynew salary
SELECT first_name,last_name,department,salary,
(salary*12)  Annual_salary,
 (salary*0.05) AS Increment_Salary,
 (salary *1.05) AS new_monthly_salary,
 (salary*1.05) AS new_salary
 from data_practice;

--3): Tax DeductioN
SELECT first_name ,
	department,
	CAST(salary*0.12 as numeric(10,2)) AS tax,
	ROUND(salary -(salary*0.12),2) AS after_tax_salary 
FROM data_practice;

--4) Daily salary
SELECT first_name,
 	   last_name,
		department,
		CAST((salary/30) AS NUMERIC(10,2)) AS daily_salary
		from data_practice;

--5) hourly salary
SELECT first_name,salary,
		CAST((salary/30) as NUMERIC(10,2)) AS monthly_salaly,
		ROUND((salary/240),2)  AS hourly_salary
		FROM data_practice;
--6) Bonus Challenge
SELECT first_name,
	   salary,
	   ROUND((salary*12),2) as anual_salary,
	   ROUND((salary*0.1),2) as bonus,
	   ROUND(((salary*12)*0.05),2) as anual_tax,
	   ROUND(salary*12 -((salary*12)*0.5)) as final_salary
	   from data_practice;