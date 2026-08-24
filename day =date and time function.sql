--------------------------------------
     Date And Time Function
--------------------------------------\


--  1.NOW()= return date and time 
SELECT NOW() AS date_time;

--  2. CURRENT_DATE
SELECT  CURRENT_DATE AS todar_date;

--  3. CURRENT_TIME
SELECT CURRENT_TIME AS today_time;

--  4. AGE()
SELECT Product_name,
	   AGE(CURRENT_DATE,added_date) AS Difference_of_date
FROM products;

--  5. EXTRACT()
SELECT product_name,
	   added_date,
	   EXTRACT(YEAR FROM added_date) AS year,
	   EXTRACT(MONTH FROM added_date) AS -- MONTH,
	   EXTRACT(DAY FROM added_date) AS Day
FROM products;

--6 TO_CHAR = Date formate as string / it is used to change date format
			  Format added_date in custom format (DD--MM/MON-YYY)  MON =JAN,FEB...ETC, MM = 01,02,03....ETC.
 
SELECT product_name,
	   TO_CHAR(added_date,'DD-MON-YYY') AS FORMATED_DATE
FROM products;

--7 DATE-PART = Get specific date part
--	 	          extract the day of the week from added_date
--dow = day of week
SELECT  product_name,added_date,
		DATE_PART('DAY'   ,added_date)      as DAY,
		DATE_PART('year'   ,added_date)     as year,
		DATE_PART('month'  ,added_date)     as month,
		DATE_PART('isodow' ,added_date)     as isodow,
		DATE_PART('week'   ,added_date)     as week,
		DATE_PART('quarter' ,added_date)    as quater,
		DATE_PART('hour'   ,added_date)     as hour,
		DATE_PART('minute' ,added_date)     as minute,
		DATE_PART('second',added_date)      as second,
		DATE_PART('millisecond',added_date) as millisecond,
		DATE_PART('microsecond',added_date) as microsecond,
		DATE_PART('epoch'      ,added_date) as epoch
FROM products;


-- 8. TO_DATE = CONVERT STRING TO DATE
-- CONVERT A string to a date format
SELECT TO_DATE('2025-02-20','YYYY-MM-DD') 
FROM products;

--9. INTERVAL
SELECT added_date,
	  added_date+ INTERVAL '10 day' AS add_day,

	 added_date+ INTERVAL '10 MONTH' AS add_month,
	 added_date+ INTERVAL '10 year' AS add_year
FROM products;

	