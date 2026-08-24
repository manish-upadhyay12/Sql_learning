---------------- WINDOW FUNCTIONS (Ranking Functions) ----------------

/*
Window functions perform calculations across a set of rows
without reducing the number of rows.

Ranking Functions:
1. ROW_NUMBER()
2. RANK()
3. DENSE_RANK()
4. PERCENT_RANK()

------------------------------------------------------------

✅ PARTITION BY
   - Data ko groups mein divide karta hai.
   - Har group ki ranking alag se start hoti hai.

✅ ORDER BY (inside OVER)
   - Har group (ya pure dataset) ke andar ranking decide karta hai.
   - Ranking functions ke liye ORDER BY almost hamesha required hota hai.

❌ Agar ROW_NUMBER(), RANK(), DENSE_RANK() ke saath meaningful ORDER BY nahi doge,
   to ranking deterministic nahi hogi (database kisi bhi order mein rows process kar sakta hai).

✅ Query ke end wala ORDER BY
   - Sirf final output ko sort karta hai.
   - Iska window function ki ranking par koi effect nahi hota.
*/
SELECT *FROM company_data;


-- with partition 
SELECT new_id,new_cat,
	ROW_NUMBER() OVER(PARTITION BY new_cat ORDER  BY new_cat) AS  row_num,
	Rank() OVER(PARTITION BY new_cat  ORDER BY new_id ) AS RANK_CHECK,
	DENSE_RANK() OVER(PARTITION BY new_cat ORDER BY new_id) as DENSE_USE ,
	PERCENT_RANK() OVER(ORDER BY new_id) AS precent
	
 FROM company_data;

-- without partition 
SELECT new_id,new_cat,
	ROW_NUMBER() OVER(ORDER BY new_cat) AS row_num,
	RANK() OVER(ORDER BY new_cat) AS RANK_FUN,
	DENSE_RANK() OVER (ORDER BY new_cat) AS DENSE_RANK,
	PERCENT_RANK() OVER(ORDER BY new_cat) AS percent_check
FROM company_data;