--🟢 Question 1 — Employees Data Cleanup
CREATE TABLE employees(
	emp_id INT PRIMARY KEY,
	name VARCHAR(150) NOT NULL,
	age INTEGER CHECK(age>18),
	department VARCHAR(100),
	salary NUMERIC(10,2),
	email VARCHAR(100) UNIQUE,
	joining_date DATE
);
select*from employees;
INSERT INTO employees(emp_id,name,age,department,salary,email)
    	VALUES(101,'Rahul',22,'IT',35000,'rahul@gmail.com'),
	    	(102,'Sunil',19,'HR',25000,'sunil@gmail.com'),
	    	(103,'Mohan',25,'IT',50000,'mohan@gmail.com'),
	    	(104,'Aman',30,'Sales',45000,'aman@gmail.com'),
	    	(105,'Priya',24,'HR',28000,'priya@gmail.com');
alter table employees
add column joining_date DATE DEFAULT CURRENT_DATE;
--add CONSTRAINT Joining_date  default;

--condition 1 = Update the salary of the employee named Rahul to ₹45,000.
UPDATE employees
SET salary = 45000
WHERE name = 'Rahul';

--condition 2 = Increase the salary of every employee by ₹ 2000
UPDATE employees
SET salary = salary+2000;

--condition 3 = Change the department from IT to Software Development.
UPDATE employees
SET  department= 'Software Development'
WHERE department = 'IT';

--Update the names of all employees whose email ends with @gmail.com to Google User.
UPDATE employees
SET name = 'Google user'
WHERE email  like '%@gmail.com';
select*from employees ORDER BY emp_id;

--Employees whose age is between 18 and 24 should have their salary changed
--to ₹50,000. Everyone else should keep their current salary.
UPDATE employees
set salary = 
		case 
			when age BETWEEN 18 AND 24 then 50000
			else salary
		end;
