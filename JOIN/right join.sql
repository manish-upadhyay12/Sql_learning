--================== right join====================
-- Employees table


--Question 1: Display all departments and employee names

SELECT d.dept_name,
	   e.emp_name
FROM employee_data e
RIGHT JOIN departments d
ON e.dept_id  = d.dept_id;

--Question 2 :  Display all departments and their employees, but show only the department IT

SELECT e.emp_name,
	   d.dept_name
FROM employee_data e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id
WHERE dept_name = 'IT';

--Question 3 : Display all departments and employees whose salary is greater than 50000.

SELECT e.emp_name,
	   d.dept_name
FROM employee_data e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id
WHERE salary >50000;

--Question 4 : Display all departments, but show employees whose name is Neha.

SELECT d.dept_name,
	    e.emp_name
FROM employee_data e
RIGHT JOIN departments d
ON e.dept_id  = d.dept_id
WHERE e.emp_name = 'Neha';

--Question 5 :  Display all departments and employee names, but only show departments whose dept_id is greater than 20.
SELECT d.dept_name,
       e.emp_name
FROM employee_data e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id
WHERE d.dept_id >20;

--===================== using group by where and write joion ========================

/*
-- q1 : Find the number of employees in each department.

Expected columns: dept_name | employee_count
*/

SELECT  d.dept_name,
	   count(e.emp_name)
FROM employee_data e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id
GROUP  BY dept_name;

/*
Q2 —  find the total salary paid in each department.

Expected:

dept_name | total_salary*/

SELECT  d.dept_name,
	    SUM(e.salary)
FROM employee_data e
RIGHT JOIN  departments d
ON d.dept_id = e.dept_id
GROUP BY d.dept_name;

/*
Q3 —  Find the average salary of employees in each department.

Expected:  dept_id | average_salary
*/
SELECT d.dept_id,
	   AVG(e.salary)
FROM employee_data e
RIGHT JOIN departments d
ON d.dept_id = e.dept_id
GROUP BY d.dept_name;

/*
Q4 — Medium

Display every department and the number of employees in each department. Departments having no employees should also appear.

Expected: dept_name | employee_count */
 SELECT d.dept_name, 	  
 	    count(e.emp_id)
FROM employee_data e
RIGHT JOIN departments d 
ON d.dept_id = e.dept_id
GROUP BY d.dept_name;


/*
Q5 —  Display departments that have more than 1 employee.
 
Expected:  dept_name | employee_count
*/
SELECT d.dept_name,
	    count(emp_id)
FROM employee_data e
RIGHT JOIN departments d
ON d.dept_id = e.dept_id
GROUP BY d.dept_name
HAVING count(emp_id)>1;






















