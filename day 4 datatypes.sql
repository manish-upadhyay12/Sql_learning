
CREATE TABLE users(
	user_id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	age INTEGER CHECK(age>=18),
	email VARCHAR(100) UNIQUE,
	registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	Dates DATE DEFAULT CURRENT_DATE
	
);
SELECT *FROM users;

INSERT INTO users(name,age,email)
	values('Sita Rawat',20,'sita.rawat7945@gamil.com'),
	('Mohan Rawat',20,'mohan.rawat5845@gamil.com');


INSERT INTO users(name,age,email)
	values('Rohan Rawat',20,'rohan.rawat7945@gamil.com');
	

TRUNCATE TABLE users RESTART IDENTITY;

ALTER TABLE USERS
RENAME COLUMN registrarion_date TO registration_date;