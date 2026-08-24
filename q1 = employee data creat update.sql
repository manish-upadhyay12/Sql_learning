select*from employee;
CREATE TABLE  employee(
	employee_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	dep_name VARCHAR(100),
	salary NUMERIC(10,2) ,
	joining_date DATE ,
	age INTEGER CHECK(age>18)
);

-- INSERT DATA
INSERT INTO employee(first_name,last_name,dep_name,salary,joining_date,age)
	values('Amit','Sharma','IT',60000,'2022-02-02',29),
		   ('Neha','Patel','HR',55000,'2021-08-15',32),
		   ('Ravi','Kumar','Finance',70000,'2020-03-17',39),
		   ('Anjali','Varma','IT',65000,'2020-03-17',25),
		   ('Shuresh','Readdy','Operation',50000,'2023-01-10',26);

--Q1 = Retrieve all employee first_name and their department
SELECT first_name,department FROM employee;

--Q2 = Update all employee salary in 'IT' deparment increasing by 10%
UPDATE employee
SET salary = salary +(salary*0.1)
WHERE department = 'IT';
SELECT * FROM employee ORDER BY employee_id ASC;

--Q3 =Delete all employee data who are older than 34
DELETE from employee
WHERE age >34;
SELECT * FROM employee ORDER BY employee_id ASC;

--Q4 = add a new column 'email ' to employee table
ALTER TABLE employee
ADD COLUMN email VARCHAR(100) UNIQUE;
SELECT * FROM employee ORDER BY employee_id ASC;

--Q5  =Rename the department column to dep_name
ALTER TABLE employee
RENAME COLUMN department TO dep_name;
SELECT * FROM employee ORDER BY employee_id ASC;

--Q6 = Retrive the name of employee who joined after january 01-2021
SELECT first_name  FROM employee
WHERE joining_date >'2021-01-01';

--Q7 = Change the datatype of salary to integer
ALTER TABLE employee
ALTER COLUMN salary type INTEGER;
SELECT * FROM employee ORDER BY employee_id ASC;

--Q8 = lIST employee name ,age and salary
SELECT first_name ,last_name,age,salary FROM employee 
ORDER BY salary ASC;

--Q9 =Add new employee column with his detail
INSERT INTO employee(first_name,last_name,dep_name,salary,joining_date,age)
			values('Raj','Sharma','IT',50000,'2026-02-01',30);

--Q10 =Update age of employee to +1
UPDATE employee
set age = age +1;
SELECT * FROM employee ORDER BY employee_id ASC;





















-





