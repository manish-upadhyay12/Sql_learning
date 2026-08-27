	
	
CREATE TABLE USER_DATA(  --CREATE NEW TABLE
	USER_ID SERIAL PRIMARY KEY,  --COLUMN1
	NAME VARCHAR(100) NOT NULL,
	AGE INTEGER CHECK(AGE>=18),
	EMAIL VARCHAR(100) UNIQUE,
	REGISTRATION_DATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  --AUTOMATIC DEFAULT VALUE COME
	DATES DATE DEFAULT CURRENT_DATE,
	TIMES TIME DEFAULT CURRENT_TIME,
	TIMEZONE TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);	


INSERT INTO
		USER_DATA (NAME, AGE, EMAIL)
VALUES
	('rahul', 20, 'rahul.upadhyaypal89775@gmail.com'),
	('sunil', 18, 'sunil.gameroypal89775@gmail.com'),
	('mohan', 19, 'mohan.upadhyaypal89455@gmail.com');
INSERT INTO
	USER_DATA (NAME, AGE, EMAIL) -- insert another data
VALUES
	('sunita', 18, 'sunita.pal7@gmail.com');

select *FROM user_data;
TRUNCATE  TABLE user_data RESTART IDENTITY;
--q1 
UPDATE USER_DATA
SET
	AGE = 25,
	NAME = 'rahul'
WHERE
	NAME = 'ram';
select *from user_data order by user_id asc;

--Q2J
update user_data
set name ='mohit',age  = 20
where user_id =2;
select *from user_data order by user_id asc

--q
update user_data
set  email= 'rahul.singpal8768412@gmail.com'
where name ='radhka';
select *from user_data order by user_id asc;

--q 
UPDATE USER_DATA
SET
	AGE = 30
WHERE
	USER_ID = 2;

SELECT
	*
FROM
	USER_DATA
ORDER BY
	USER_ID ASC;
--q
UPDATE  user_data
SET age = 40,email ='rahul.upadhyaypal89775@gmail.com'
where name = 'STAFs';
--Q = update name radkha to radhika
update user_data
set name = 'radhika'
where name = 'radhka';
select *from user_data order by user_id asc;

--q = change name of all student student whose age is greater than 30
update user_data
set name = 'student'
where  age>30;  -- no need to store this condtion in any variable
c

-- q = whose age is 18 change his name tO STUDENT
update user_data
set name  = 'student'
where age=18;
SELECT *FROM user_data ORDER BY user_id ASC;
///
--q = whose age is less than 20 chage them to 201
UPDATE user_data
SET age =19
where age<40;
sELECT *FROM user_data ORDER BY user_id ASC;

--  q=whose student age is less than 20 set name  = adult
UPDATE user_data
set name = 'Adult'
where age<=20;
sELECT *FROM user_data ORDER BY user_id ASC;

-- q = gmail user ka name googlbaba kar do
update user_data
set name ='Google baba'  -- dout tha google baba nahi ho raha
where email like '%@gmail.com';
sELECT *FROM user_data ORDER BY user_id ASC;
--q = use of between
update user_data
set name = 'STAFs'
where age BETWEEN 18 AND 40;  -- or not allowed with between
sELECT *FROM user_data ORDER BY user_id ASC;

--q=USE OF IN
update user_data
set name = 'ram'
where user_id IN (2,4);

sELECT *FROM user_data ORDER BY user_id ASC

--q: update user age according to condition 
UPDATE user_data
SET age = 
	CASE
		WHEN age BETWEEN 18 AND 30 then 50
		else age
	end;
	sELECT *FROM user_data ORDER BY user_id ASC;


--q update name 
update user_data
set name = 
case 
	when name ='sunita' then 'manish'
	else name
end
where user_id = 3;