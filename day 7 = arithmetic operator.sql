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
	   select *from data_practice;

-- Arithmetic operator(*,+,/,%)

-- 1) Salary Increase
-- Calculate 8% increment on salary and show the new salary
SELECT first_name,
       salary,
       ROUND(salary * 0.08, 2) AS increment_amount,
       ROUND(salary * 1.08, 2) AS new_salary
FROM data_practice;


-- 2) Yearly Bonus
-- Calculate annual salary and 15% yearly bonus
SELECT first_name,
       salary,
       ROUND(salary * 12, 2) AS annual_salary,
       ROUND((salary * 12) * 0.15, 2) AS annual_bonus
FROM data_practice;


-- 3) Salary After Deduction
-- Deduct 10% tax and 5% insurance from salary
SELECT first_name,
       salary,
       ROUND(salary * 0.10, 2) AS tax,
       ROUND(salary * 0.05, 2) AS insurance,
       ROUND(salary - (salary * 0.10) - (salary * 0.05), 2) AS final_salary
FROM data_practice;


-- 4) Remainder Challenge
-- Find the remainder when salary is divided by 1000
SELECT first_name,
       salary,
       MOD(salary, 1000) AS remainder
FROM data_practice;