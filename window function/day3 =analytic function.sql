   -----Analytic function-----

--LAG()
SELECT *,
		LAG(new_id) OVER(PARTITION BY new_cat ORDER BY new_id) as previous
FROM company_data;

--LEAD()

SELECT*,
		LEAD(new_id) OVER(PARTITION BY new_cat ORDER BY new_id) AS next_value
FROM company_data;

--FIRST_VALUE
SELECT *,
		FIRST_VALUE(new_id) OVER(ORDER BY new_id) AS First_value
FROM  company_data;

--LAST_VALUE
SELECT *,
		LAST_VALUE(new_id) OVER (ORDER BY new_id) AS last_value
FROM company_data;


