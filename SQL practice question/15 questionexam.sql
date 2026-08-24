/*===============================🎯 Practical Questions ==========================================

Question 1 — Executive Customer Report

The CEO wants a report of customers who:
	
	Purchased Electronics, Furniture, or Fashion.
	Delivery_Status = Delivered.
	Total_Price > 7000.
	Rating ≥ 4.
	Email ends with gmail.com.
	Phone number has exactly 10 digits.

Display: 	Transaction_ID
			Customer_Name
			Product_Name (UPPERCASE)
			Brand (TRIMMED)
			Email (LOWERCASE)
			Month Name
			Total_Price
			Customer_Level

Customer_Level : 	Elite
					Premium
					Regular

Sort by: Rating DESC
		Total_Price DESC*/

--SOLUTION -1
SELECT 	Transaction_ID,
		Customer_Name,
		UPPER(Product_Name),
		TRIM(Brand) ,
		LOWER(EmaiL),
		TO_CHAR(transaction_date,'FMMonth') AS Month_name,
		Total_Price,
		CASE
			WHEN total_price >5000 then 'Elite'
			WHEN total_price BETWEEN 1000 AND 4999 then 'Premium'
			ELSE 'Regular'
		END AS Customer_Level
FROM shop_data
WHERE product_category IN('Electronics','Fashion','Furniture')
	  AND Delivery_status = 'Delivered'
	  AND Total_price >7000
	  AND Rating >=4
	  AND Email LIKE '%@gmail.com'
	  AND LENGTH(phone_number)  = 10
ORDER BY rating DESC ,total_price DESC;

/*
Question 2 — Data Quality Audit

The Data Engineering team wants to detect bad records.

Display :   Customer_Name
			Email
			Phone_Number
			Brand
			Data_Status
A record is considered dirty if any of the following is true:
	Email is NULL
	Phone is NULL
	Phone length ≠ 10
	Email contains uppercase letters
	Brand contains extra spaces
Use CASE WHEN.
*/
SELECT  Customer_Name,
		Email,
		Phone_Number,
		Brand,
		CASE 
			WHEN Email is null then 'null_email'
			WHEN phone_number is null then 'null_phone_no'
			WHEN  NOT LENGTH(Phone_number)  = 10 Then 'Invalid_number'
			WHEN  email = upper(email) then 'invalid_email'
			WHEN  length(brand) <> length(TRIM(brand)) then 'extra_space'
		end AS Data_Status
FROM shop_data;		

/*
Question 3 — Premium Product Campaign

Marketing wants customers who:	Bought Electronics.
								Paid using UPI or Credit Card.
								Order delivered.
								Rating ≥ 4.5.
								Purchase made in July–December.
								Total_Price > 9000.
Display: Customer_Name
		Product_Name
		Brand
		Month_Name
		Campaign

Campaign:   Mega Festival
			Gold Offer
			Silver Offe
*/
SELECT  Customer_Name,
		Product_Name,
		Brand,
		TO_CHAR(Transaction_date,'FMMonth') AS month_name 		
FROM shop_data
WHERE product_category = 'Electronics'
	  AND payment_mode IN('UPI','Credit Card')
	  AND delivery_status = 'Delivered'
	  AND rating >=4.5
	  AND Total_price>9000
	  AND TO_CHAR(transaction_date,'FMMonth') BETWEEN 'July' AND 'December';

/*
Question 4 — Product Catalog Review

Display  :  Product_Name
			Length
			First 4 Characters
			Last 4 Characters
			Product_Status

Rules : Too Short
		Standard
		Too Long
Only include:  Starts with A
				Starts with S
				Ends with Max
				Ends with Pro
*/
SELECT   Product_Name,
		Length(Product_name) AS product_name_length,
		LEFT(product_name ,4) AS first_4_character,
		RIGHT(Product_name,4) AS last_4_character,
		CASE 
			 WHEN LENGTH(Product_name)<2 then 'TOO Short'
			 WHEN LENGTH(Product_name) BETWEEN 3 AND 6 then 'Standard'
		     ELSE 'Standard'
	   END AS Product_Status
FROM shop_data
WHERE product_name like 'A%'
	  OR Product_name like 'S%'
	  OR product_name like '%max'
	  OR product_name like '%pro' ;
	  
/*Question 5 — Customer Feedback Report

Display : Customer_Name
Rating
Delivery_Status
Feedback

Feedback : Outstanding
			Excellent
			Good
			Average
			Poor
Only Delivered orders.
Sort by Rating DESC.
*/
 SELECT Customer_Name,
		Rating,
		Delivery_Status,
		CASE
			 WHEN rating >4.8 then 'outstanding'
			 WHEN rating  between 4 and 4.7 then 'excellent'
			 WHEN rating between 3 and 3.9 then 'Good'
			 WHEN rating between 2 and 3.8 then 'Average'
			 ELSE 'Poor'
    	END AS feedback
FROM shop_data
WHERE Delivery_Status= 'Delivered'
ORDER BY rating DESC;


*---------------------------------------------------------------------
*-------------------------------------------------------------------------
--===========================================================================
/*


🟢 Question 1 — Revenue Classification Report

The Finance Director wants to classify every order based on its value for preparing the quarterly revenue report.

Display :   Transaction_ID
			Customer_Name
			Product_Name
			Unit_Price
			Quantity
			Total_Price
			Revenue_Category
			Revenue_Category
			
			Total_Price ≥ 20000 → Luxury
			Total_Price between 12000 and 19999.99 → Premium
			Total_Price between 5000 and 11999.99 → Standard
			Otherwise → Economy
Conditions :

Only include:

Delivery_Status is Delivered or Shipped
Payment_Mode is UPI, Credit Card, or Debit Card
Unit_Price greater than 1000
Sort By
Revenue_Category
Total_Price DESC
*/
SELECT  Transaction_ID,
		Customer_Name,
		Product_Name,
		Unit_Price,
		Quantity,
		Total_Price,
		CASE 
				WHEN total_price >=20000  then 'Luxury'
				WHEN total_price BETWEEN 12000 AND 19999.99 THEN  'Premium'
				WHEN total_price BETWEEN 5000 and 11999.99 then 'Standard'
				ELSE 'Economy'
			END AS Revenue_category
FROM shop_data
WHERE Delivery_status IN ('Delivered','Shipped')
	  AND payment_mode IN('UPI','Credit card', 'Debit Card')
	  AND unit_price >1000
 ORDER BY total_price DESC,Revenue_category ASC;
	 
/*
🟢 Question 2 — Customer Verification Report

The Customer Success team wants to identify verified customers before launching a loyalty program.

Display:    Transaction_ID
			Customer_Name
			Customer_Name in UPPERCASE
			Email in lowercase
			Brand after removing extra spaces
			Phone_Number
			Phone_Number Length
			Product_Name (first 5 characters)
			Product_Name (last 4 characters)
			Verification_Status
Conditions :

Include only customers who satisfy all of the following:

Delivery_Status = Delivered
Email ends with gmail.com
Phone number has exactly 10 characters
Brand is NOT NULL
Rating is NOT NULL
Product_Category is Electronics, Furniture, or Fashion
Total_Price greater than 5000

Verification_Status
Rating ≥ 4.8 → Fully Verified
Rating between 4 and 4.7 → Verified
Otherwise → Review Required
Sort By
Rating DESC
Total_Price DESC
*/

--solution =2
SELECT Transaction_id,
	    customer_name,
		UPPER(customer_name),
	    Lower(Email),
		Trim(Brand),
		phone_number,
		LENGTH(phone_number),
		LEFT(product_name,5),
		RIGHT(Product_name,4),
		CASE
			WHEN rating >=4.8 then 'Fully verified' 
			WHEN rating BETWEEN 4 AND 4.7 THEN 'Verified'
			ELSE 'Reiwe  Required'
	   END AS verification_status
FROM Shop_data
WHERE Delivery_status = 'Delivered'
	  AND Email LIKE '%@gmail.com'
	  AND Length(Phone_number) = 10 
	  AND  NOT rating is null
	  AND NOT Brand IS NULL
	  AND Product_category IN('Electronics','Furniture','Fashion')
	  AND total_price >5000;
		
/*
🟢 Question 3 — Logistics Delay Report

The Logistics Manager wants to review all orders that still require attention.
Display :  Transaction_ID
			Customer_Name
			Product_Name
			Delivery_Status
			Transaction_Date
			Month_Name
			Total_Price
			Delivery_Priority
			Conditions
Include orders whose Delivery_Status is:
Pending
Processing
Shipped

Only include:
Total_Price greater than 3000,Rating at least 3.5

Delivery_Priority:	Total_Price ≥ 15000 → High Priority
					Total_Price between 7000 and 14999.99 → Medium Priority
					Otherwise → Normal Priority
					Sort By
					Transaction_Date
					Total_Price DESC
*/

SELECT  Transaction_ID,
		Customer_Name,
		Product_Name,
		Delivery_Status,
		Transaction_Date,
		TO_CHAR(transaction_date,'FMMonth') as month_name,
		Total_Price,
		CASE 
			when Total_price>=15000 then 'High Prioriry'
			WHEN total_price BETWEEN 70000 and 14 then 'medium priority'
			ELSE 'Normal priority'
		END   AS Delivery_Priority
FROM shop_data
WHERE delivery_status IN('pending','processing','delivered')
	 and total_price >3000
	 AND  Rating >3.5
ORDER BY Transaction_Date desc , Total_Price DESC;

/*
🟢 Question 4 — Customer Profile Analysis

The CRM department wants to analyze customers with long names for creating personalized marketing campaigns.

Display :   Customer_Name
			Uppercase Name
			Lowercase Name
			Length of Name
			First 2 Characters
			Last 2 Characters
			Email
			Customer_Type
			Profile_Status
Conditions :  Include customers who satisfy:
				Name length greater than 12
				Email ends with gmail.com
				Customer_Type is Premium or Regular
				Rating at least 4
				
				Profile_Status
				Length greater than 18 → Long Name
				Length between 13 and 18 → Medium Name
				Otherwise → Short Name
				
			Sort By
			Length DESC
			Customer_Name*/
--solution = 4			
SELECT  Customer_Name, 
		UPPER(Customer_name) AS upper_name,
		LOWER(Customer_name) AS Lower_name,
		Length(Customer_Name)as length_of_name,
		LEFT(Customer_name,2) AS LEFT_2_Character,
		Right(customer_name,2) AS right_2_character,
		Email,			
		CASE
				WHEN total_price >=50000 then 'Premium'
				WHEN total_price BETWEEN 5000 AND 49999 THEN 'Standard'
				ELSE 'Regular' 
			END AS Customer_type,

			CASE
				WHEN LENGTH(Customer_name)>18  THEN 'Long name'
				WHEN LENGTH(Customer_name) BETWEEN 13 AND 18 then 'Medium name'
				ELSE 'Short name'
			END AS profile_status
FROM shop_data
WHERE LENGTH(customer_name) >12
	  AND Email LIKE '%@gmail.com'
	  AND customer_type IN('Regular','Premium')
	  AND rating >=4
ORDER BY LENGTH(customer_name) DESC, customer_name DESC;


/*
🟢 Question 5 — Customer Rating Inspection

The Quality Assurance team wants to review customer satisfaction.

Display  :  Customer_Name
			Product_Name
			Rating
			Delivery_Status
			Rating_Level
			Conditions

Include only:   Rating IS NOT NULL
				Delivery_Status = Delivered
				Rating greater than or equal to 2
				
					Rating_Level
					Rating ≥ 4.8 → Excellent
					Rating between 4 and 4.7 → Good
					Rating between 3 and 3.9 → Average
					Otherwise → Poor
					
						Sort By
						Rating DESC
						Customer_Name
*/
SELECT      Customer_Name,
			Product_Name,
			Rating,
			Delivery_Status,
			CASE
				WHEN Rating >=4.8 THEN 'Excellent'
				WHEN Rating BETWEEN 4 AND 4.7 THEN 'GOOD'
				WHEN Rating BETWEEN 3 AND 3.9 THEN 'Average'
				ELSE 'Poor'
			END Rating_Level
FROM shop_data
WHERE  NOT Rating  IS NULL
	   AND delivery_status = 'Delivered'
	   AND Rating >=2
ORDER BY Rating DESC ,
	     Customer_Name DESC;



/*
🟢 Question 6 — Seasonal Purchase Report

The Sales Director wants to review purchases made during important business months.

Display :   Transaction_ID
			Customer_Name
			Product_Name
			Transaction_Date
			Month_Name
			Total_Price
			Conditions
include only purchases made in:     January
									March
									July
									October

Also include only:    Delivered orders
						Gmail customers
						Rating at least 4
						Product_Category is Electronics or Fashion
			Sort By
			Transaction_Date
			Total_Price DESC
*/
  SELECT    transaction_ID,
			Customer_Name,
			Product_Name,
			Transaction_Date,
			TO_CHAR(Transaction_date,'FMMonth') AS Month_name, 
			Total_Price
FROM shop_data
WHERE 	TO_CHAR(transaction_date,'FMMonth') IN('January','March','July','October')
	    AND Delivery_status = 'Delivered'
		AND rating >=4
	    AND product_category IN('Electronics','Fashion')
ORDER BY Transaction_date DESC, Total_price DESC;
		
/*
🟢 Question 7 — Executive Audit Report

The CEO suspects there are records that don't match company standards.

Prepare a report.

Display:    Transaction_ID
			Customer_Name
			Product_Name
			Brand
			Email
			Phone_Number
			Rating
			Total_Price
			Audit_Status
			Conditions

Business Requirements: 	Delivered or Shipped orders
						Electronics, Furniture, or Fashion
						Gmail customers
						Phone length exactly 10
						Rating between 3.5 and 5
						Total_Price between 5000 and 25000
						Brand must not be NULL
						Orders placed only in July–December
						
						Audit_Status
						Rating ≥ 4.8 → Excellent Record
						Rating ≥ 4 → Good Record
						Otherwise → Needs Review
						Sort By
						Rating DESC
						Total_Price DESC
*/ 

--solution = 7
SELECT   Transaction_ID,
			Customer_Name,
			Product_Name,
			Brand,
			Email,
			Phone_Number,
			Rating,
			Total_Price,
			CASE 
				WHEN Rating >=4.8 then 'Excellent'
				WHEN rating >=4 then 'Good record'
				ELSE 'Need review'
			END as Audit_Status
from shop_data
WHERE delivery_status IN('Delivered','Shipped')
	  AND Product_category IN('Furniture','Electronics','Fashion')
	  AND  NOT Email IS NULL
	  AND LENGTH(phone_number) = 10
	  AND Rating BETWEEN 3.5 AND 5
	  AND Total_price BETWEEN 5000 AND 25000
	  AND NOT Brand IS NULL
	  AND TO_CHAR(transaction_date,'FMMonth') IN('July','December')
ORDER BY rating DESC ,
	     Total_price DESC;
	  

/*

================================  🟢 Question 8 — 👑 FINAL BOSS (Amazon Board Meeting)  ==================================
Imagine this is your first day as a Data Analyst at Amazon.

The CEO says:

"Tomorrow I have a board meeting. I need a report showing our highest-value verified customers who purchased premium products during the second half of the year."

You have only one SQL query.l
Display :   Transaction_ID                               
			Customer_Name
			Product_Name (UPPERCASE)
			Brand (TRIMMED)
			Email (LOWERCASE)
			State
			City
			Transaction_Date
			Month_Name
			Unit_Price
			Quantity
			Total_Price
			Rating
			
			Customer_Level
Conditions  :
Include only customers who satisfy all of the following:

										Delivery_Status = Delivered
										Product_Category is Electronics, Furniture, or Fashion
										Payment_Mode is UPI, Credit Card, or Debit Card
										Email ends with gmail.com
										Phone number has exactly 10 characters
										Brand IS NOT NULL
										Rating at least 4
										Total_Price greater than 7000
										Unit_Price greater than 1000
										Quantity between 2 and 10
										Transaction month is July, August, September, October, November, or December
										
										Customer_Level : Rating ≥ 4.8 AND Total_Price ≥ 18000 → Elite Customer
														 Rating ≥ 4.5 AND Total_Price ≥ 12000 → Premium Customer
														 Otherwise → Regular Customer
			Sort By:
					Customer_Level
					Rating DESC
					Total_Price DESC
					Customer_Name ASC							
*/	 		 	 						
SELECT
    transaction_id,
    customer_name,
    UPPER(product_name) AS product_name,
    TRIM(brand) AS brand,
    LOWER(email) AS email,
    state,
    city,
    transaction_date,
    TO_CHAR(transaction_date, 'FMMonth') AS month_name,
    unit_price,
    quantity,
    total_price,
    rating,
    CASE
        WHEN rating >= 4.8 AND total_price >= 18000 THEN 'Elite Customer'
        WHEN rating >= 4.5 AND total_price >= 12000 THEN 'Premium Customer'
        ELSE 'Regular Customer'
    END AS customer_level
FROM shop_data
WHERE delivery_status = 'Delivered'
  AND product_category IN ('Fashion', 'Electronics', 'Furniture')
  AND payment_mode IN ('UPI', 'Credit card', 'Debit card')
  AND LOWER(email) LIKE '%@gmail.com'
  AND brand IS NOT NULL
  AND LENGTH(phone_number) = 10
  AND rating >= 4
  AND unit_price > 1000
  AND total_price > 7000
  AND quantity BETWEEN 2 AND 10
  AND EXTRACT(MONTH FROM transaction_date) BETWEEN 6 AND 12
ORDER BY
    customer_level DESC,
    rating DESC,
    total_price DESC,
    customer_name ASC;






================================   📘 SQL  Revision MCQs   =======================================

 Q1. Which clause executes first?

A. SELECT
B. ORDER BY
C. WHERE
D. FROM

✅ Answer: D. FROM

---

 Q2. Which function removes spaces from both ends of a string?

A. LEFT()
B. LENGTH()
C. TRIM()
D. SUBSTRING()

✅ Answer: C. TRIM()

---

 Q3. Which operator is used to check whether a value lies within a range?

A. LIKE
B. IN
C. BETWEEN
D. EXISTS

✅ Answer: C. BETWEEN

---

 Q4. Which query correctly finds email addresses ending with gmail.com`?

A.sql
WHERE email LIKE 'gmail.com%'
```

B.

sql
WHERE email LIKE '%gmail.com'
```

C.

sql
WHERE email LIKE '@gmail.com%'
```

D.

sql
WHERE email LIKE '%gmail%'
```

✅ Answer B

---
 Q5. What does `CASE` return if no condition matches and there is no ELSE clause?

A. 0
B. Empty String 
C. NULL
D. Error

✅ Answer C. NULL

---

 Q6. Which function returns the number of characters in a string?

A. SIZE()
B. COUNT()
C. LENGTH()
D. CHAR()

✅ Answer C. LENGTH()

---

 Q7. Which condition correctly checks that a phone number is not exactly 10 characters long?

A.

sql
LENGTH(phone_number) = 10


B.

sql
NOT LENGTH(phone_number) = 10


C.

sql
phone_number <> 10


D.

sql
phone_number != 10


✅ Answer B

---

 Q8. Which statement about `BETWEEN` is correct?

A. It excludes both boundary values.
B. It includes both boundary values.
C. It includes only the lower boundary.
D. It includes only the upper boundary.

✅ Answer B

---

 Q9. Which function converts text to uppercase?

A. CAPITAL()
B. TOUPPER()
C. UPPER()
D. LARGE()

✅ Answer C. UPPER()

---

 Q10. Which SQL operator is best for checking multiple fixed values?

A. LIKE
B. BETWEEN
C. IN
D. OR

✅ Answer C. IN

---

# 🏆 Score Key

* **9–10 Correct** → Excellent (Ready for GROUP BY)
* **7–8 Correct** → Good (Minor Revision Needed)
* **5–6 Correct** → Practice More
* **Below 5** → Revise SQL Fundamentals Again






		