CREATE TABLE employee2(
	employee_id INT PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	post VARCHAR(100),
	salary NUMERIC(10,2)
	
);

INSERT INTO employee2(employee_id,name2,post,salary)
	VALUES(101,'Rohan sing','Manager',50000),
	      (102,'Sita rawat','Sales',10000),
		  (103,'Mohan Yadav','Finance',20000);

SELECT *FROM employee2;

ALTER TABLE employee2
RENAME COLUMN name to name2;
TRUNCATE TABLE employee2 RESTART IDENTITY;

DELETE from employee2
WHERE name2 = 'Mohan Yadav'

ALTER TABLE employee2
Drop  COLUMN salary;
DROP TABLE IF EXISTS student;
ALTER TABLE employee2
DROP COLUMN IF EXISTS post;
'