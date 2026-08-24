
CREATE TABLE user_details(
	user_id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	age INTEGER CHECK(age>=18),
	email VARCHAR(100) UNIQUE,
	registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	Dates DATE DEFAULT CURRENT_DATE,
	TIMES TIME DEFAULT CURRENT_TIME,
	timezone TIMESTAMPtz DEFAULT CURRENT_TIMESTAMP
);
SELECT * FROM user_details;
INSERT INTO user_details(name,age,email)
values('sita',20,'gkjdjdjdjd');

