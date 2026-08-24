 ----- JOIN FUNCTION
 CREATE table  Employees4 (
		employee_id SERIAL PRIMARY KEY,
		first_name VARCHAR(50),
		last_name VARCHAR(50),
		department_id INT
		
 );
 select*from department;

 	
 CREATE  TABLE department (
	department_id INT PRIMARY KEY,
	department_name VARCHAR(50)
 );

 ---------------------Natural join---------------
 SELECT first_name from Employees4 Natural join department;


--writing manually
 selecT  concat(first_name ,' ',  last_name) as department_allocated  from employees4 ,department 
 where employees4.department_id = department.department_id;

 UPDATE employees4
 set first_name = 'Rahul'
 where employee_id = 2;

------- self join practice question
/*🟢 Question 1 (Easy)

Find employees whose first_name appears more than once.

💡 Socho:
*/
SELECT   e1.first_name   FROM employees4 as e1, employees4 as e2
	WHERE e1.first_name = e2.first_name 
		  AND e1.employee_id <> e2.employee_id;

/*
🟢 Question 2 (Easy)

Find employees who work in the same department.

Expected Output:

Rahul (101)
Aman (101)
*/
SELECT first_name FROM employees4 AS e1 , department as d1
	 WHERE e1.department_id = d1.department_id  
	 	   AND d1.department_name = 'HR'






















