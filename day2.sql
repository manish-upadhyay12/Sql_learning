

INSERT INTO employee(Employee_name ,position,join_Date,salary,phone_number)
	VALUES('Manish upadhyay','Data analyst','2026-02-22',50000,7896587458),
		  ('Hardik Upadhyay','Manager','2026-04-1',40000,7485967845),
		  ('Abhishek Agrawal','Backend Developer','2028-02-4',70000,8596653621);

SELECT * FROM employee;
ALTER TABLE employee
RENAME COLUMN join_to to join_Date;
TRUNCATE TABLE EMPLOYEE RESTART IDENTITY;