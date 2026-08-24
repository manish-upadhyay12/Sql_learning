-- Employees table
CREATE TABLE employee_data (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(30),
    dept_id INT
);

INSERT INTO employee_data (emp_id, emp_name, dept_id)
VALUES
(1, 'Rahul', 10),
(2, 'Aman', 20),
(3, 'Priya', 30),
(4, 'Neha', 40);


-- Departments table
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(30)
);

INSERT INTO departments (dept_id, dept_name)
VALUES
(10, 'IT'),
(20, 'HR'),
(30, 'Sales');


--🟢  Q1 :  Display every employee's name and their department name.

SELECT e.emp_name,
	   d.dept_name
FROM employee_data e
LEFT  JOIn departments d
ON d.dept_id = e.dept_id


--🟢 Q2 : Display only those employees who do NOT have a matching department.

SELECT e.emp_name AS employee_name
FROM employee_data e
LEFT JOIN departments d
ON e.dept_id = d.dept_id
WHERE d.dept_name is null;

--Q3 : Display employee name and department name, but only for employees whose department exists.

SELECT e.emp_name ,
	   d.dept_name
FROM employee_data e
left  JOIN departments d
ON e.dept_id = d.dept_id
WHERE d.dept_id IS NOT NULL;

 -- Q4 : Display all employees and their department names, but show only employees whose emp_id is greater than 1.

 SELECT e.emp_name,
 	    d.dept_name
FROM employee_data e
LEFT JOIN departments d
ON e.dept_id = d.dept_id 
WHERE e.emp_id >1;

--Q5: Display all employees, but only show department information for departments whose dept_id is greater than 10.
SELECT e.emp_name,
       d.dept_name
FROM employee_data e
LEFT JOIN departments d
ON e.dept_id = d.dept_id
AND d.dept_id > 10;

--Q6 — Employees from specific departments
/*
Display emp_name and dept_name for employees whose department is either IT or Sales.

Expected output:

Rahul  | IT
Priya  | Sales*/

SELECT e.emp_name,
	   d.dept_name
FROM employee_data e
left JOIN departments d
ON e.dept_id =d.dept_id  WHERE d.dept_name IN('IT','Sales');


/*
Q7 — Employees with department ID range 
Display emp_name, dept_id, and dept_name for employees whose dept_id is between 10 and 30.

Use:  BETWEEN

Expected:

Rahul  | 10 | IT
Aman   | 20 | HR
Priya  | 30 | Sales
*/

SELECT e.emp_name,
	   d.dept_id,
	   d.dept_name
FROM employee_data e
LEFT JOIN departments d
ON e.dept_id = d.dept_id
WHERE d.dept_id BETWEEN 10 AND 30;


/*
Q8 — Employees whose department is NOT HR
Display emp_name and dept_name for employees whose department is not HR.
*/
SELECT e.emp_name,
	   d.dept_name
FROM employee_data e
LEFT JOIN departments d
ON e.dept_id = d.dept_id 
WHERE  d.dept_name <> 'HR';

/*
Q9 — Department information only for IT

Display all employees, but show department information only when the department is IT.

Expected:    Rahul  | IT
			Aman   | NULL
			Priya  | NULL
			Neha   | NULL
			*/
SELECT e.emp_name,
	   d.dept_name
FROM employee_data e
LEFT join  departments d
ON e.dept_id = d.dept_id
AND d.dept_name = 'IT';


/* 
Q10 — Multiple conditions

Display all employees and their department names, but department information should only be shown when:

department ID is 20 or 30
AND the department actually exists.

Expected:

Rahul  | NULL
Aman   | HR
Priya  | Sales
Neha   | NULL
*/
SELECT e.emp_name,
	   d.dept_name
FROM employee_data e
LEFT JOIN departments d
ON d.dept_id = e.dept_id
AND d.dept_id BETWEEN 20 AND 30;












