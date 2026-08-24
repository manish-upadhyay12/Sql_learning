CREATE TABLE data_practice(		
	employee_id	SERIAL	PRIMARY KEY,
	first_name	VARCHAR(30)	NOT NULL,
	last_name	VARCHAR(30)	NOT NULL,
	email	VARCHAR(50)	UNIQUE,
	department	VARCHAR(30),	
	salary	NUMERIC(10,2),	
	joining_date	DATE,	
	age	INTEGER	
);
SELECT *FROM data_practice;

truncate table data_practice;
-- kabhi error ata hai kabhi nahi 