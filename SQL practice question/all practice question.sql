--===================== ALL 7 PRACTICE QUESTION OF COVERED TOPIC
/*
🟢 Question 1 — VIP Customer Verification

The CRM team wants to identify customers eligible for a new VIP membership.

Display:

Customer_Name
Email (in lowercase)
Product_Name (in uppercase)
Brand (without extra spaces)
Total_Price
Rating
VIP_Status

Rules:

Order was Delivered
Customer purchased Electronics or clothing
Total_Price greater than 6000
Rating at least 4.2
Email ends with gmail.com
Phone number has exactly 10 characters

VIP_Status

Total_Price ≥ 12000 → Platinum
Total_Price between 8000 and 11999.99 → Gold
Otherwise → Silver

Sort by

Rating DESC
Total_Price DESC
*/
--solution -1

SELECT customer_name,
	   LOWER(email),
	   UPPER(Product_name),
	   trim(brand),
	   total_price,
	   Rating
	  
from shop_data
WHERE delivery_status = 'Delivered' 
      AND product_category IN('Electronics' ,'clothing')
	  AND total_price >6000
	  AND rating>=4.2
	  AND email like '%@gmail.com'
	  AND Length(phone_number) = 10;

/*
🟢 Question 2 — Fake Customer Detection

The fraud team suspects fake customer accounts.
Display

Customer_Name
Email
Phone_Number
Fraud_Reason

Rules

Find customers satisfying ANY ONE of these:
Email is NULL
Phone number is NULL
Phone number length is not 10
Email does not contain '@'

Fraud_Reason 
	Missing Email
	Missing Phone
	Invalid Phone
	Invalid Email
*/
--solution -2
SELECT customer_name,
       Email,
	   phone_number,
	   CASE 
	   		WHEN email iS NULL THEN 'Missing Email'
			WHEN phone_number IS NULL THEn 'Missing Phone'
			WHEN  not length(phone_number) =10 THEN 'Invalid phone'
			WHEN not  Email   like '%@%' THEN 'Invalid Email'
		
		END AS fraud_reason
FROM shop_data;

/*🟢 Question 3 — Festival Sales Audit

Finance wants all expensive orders placed during the last quarter of the year.

Display

Transaction_ID
Customer_Name
Product_Name
Month_Name
Total_Price
Order_Category

Conditions

October, November or December
Delivered
Total_Price above 4000
Payment_Mode is UPI or Credit Card

Order_Category

Above 15000 → Mega Order
Above 8000 → Premium Order
Otherwise → Standard Order

Sort
Highest Total_Price first.
*/
--solution -3
SELECT 
		Transaction_ID,
		Customer_Name,
		Product_Name,
		TO_CHAR(Transaction_date,'FMMonth') as month_name,
		Total_Price,
	    CASE 
			 WHEN total_price  >15000 then 'Mega order'
			 WHEN total_price >8000 then 'Premium Order'
			 ELSE 'Standard order'
		END AS order_category
FROM SHOP_DATA 
WHERE to_char(Transaction_date,'FMMONTH') IN('OCTOBER','NOVEMBER','DECEMBER') 
	and delivery_status ='Delivered' 
	AND TOTAL_PRICE >4000
	AND Payment_mode IN('UPI' ,'Credit Card')
ORDER BY TOTAL_PRICE DESC;
    
/*
🟢 Question 4 — Product Name Quality Check

The catalog team wants to find products whose names may not follow company standards.

Display:
		Product_Name
		Length
		First_3_Characters
		Last_3_Characters
		Name_Status
Rules:

Name_Status:
			Length below 6 → Too Short
			Length above 25 → Too Long
			Otherwise → Standard

Only show products

beginning with 'S'
OR ending with 'Pro'
*/
--solution -4
SELECT 
	  product_name,
	  LENGTH(product_name),
	  LEFT(product_name,3) as first_3_characters,
	  RIGHT(product_name,3) as last_3_characters,
	  CASE 
	  	 WHEN LENGTH(Product_name) <6 then 'To Short'
	     WHEN LENGTH(product_name)> 25 then 'Too long'
		 ELSE 'standard'
     END Name_status
FROM shop_data
WHERE 
	product_name like 'S%' product_name like '%pro'	;

/*
🟢 Question 5 — Customer Satisfaction Analysis

Display

Customer_Name
Rating
Delivery_Status
Customer_Type
Satisfaction

Rules:  Delivered orders only.
CASE		
		Rating ≥ 4.8 : 		        → Excellent		
		Rating between 4 and 4.7	→ Good		
		Rating below 4          	→ Needs Improvement
		
		Sort
				Rating DESC
		*/

--solution -5
SELECT 
	    Customer_Name,
		Rating,
		Delivery_Status,
		Customer_Type,
		
		CASE 
			 WHEN rating>=4.8 then 'Excellent'
			 WHEN rating BETWEEN 4 AND 4.7 then 'Good'
			 Else 'Need Improvement'
	 	END AS Satisfaction
FROM shop_data			 
WHERE delivery_status = 'Delivered'
ORDER BY Rating DESC;


/*
🟢 Question 6 — Revenue Inspection

Management wants to inspect unusually expensive orders.

Display: 	Transaction_ID
		Customer_Name
		Product_Name
		Unit_Price
		Quantity
		Total_Price

Conditions  
			Unit_Price greater than 2000
			Quantity between 3 and 10
			Total_Price between 10000 and 40000
			Brand is NOT NULL
			Delivery_Status not Cancelled

Sort: Quantity DESC , Total_Price DESC
*/
--solution -6
SELECT 
	    Transaction_ID,
		Customer_Name,
		Product_Name,
		Unit_Price,
		Quantity,
		Total_Price
FROM shop_data
WHERE 
	 Unit_price >2000
	 AND quantity BETWEEN 3 AND 10
	 AND total_price BETWEEN 10000 and 40000
	 AND Brand is NOT NULL
	 AND NOT delivery_status = 'Cancelled'
ORDER BY quantity DESC , Total_price DESC;

/*
===========================🟢 Question 7 — 🧠  Boss Challenge (Company Audit) ==================================

You are working as a Data Analyst at Amazon.

The CEO asks:

"Prepare a report of our most valuable customers for an executive meeting."

Display : 	Transaction_ID
			Customer_Name
			Product_Name (UPPERCASE)
			Brand (Trimmed)
			Email (Lowercase)
			State
			City
			Month_Name
			Total_Price
			Rating
			Customer_Level

Conditions :    Delivered orders only
				Product_Category is Electronics, Furniture or Fashion
				Total_Price greater than 7000
				Rating at least 4
				Email ends with gmail.com
				Phone number exactly 10 characters
				Payment_Mode is UPI, Credit Card or Debit Card
				Transaction made in July, August, September, October, November or December

Customer_Level:			Rating ≥ 4.8 AND Total_Price ≥ 15000 → Elite
						Rating ≥ 4.5 AND Total_Price ≥ 10000 → Premium
						Otherwise → Regular

Sort by :		Customer_Level
				Rating DESC
				Total_Price DESC
				Customer_Name ASC
*/

--SOLUTION =7
SELECT 
	    Transaction_ID,
		Customer_Name,
		UPPER(Product_Name ),
		Trim(Brand) ,
		Lower(Email),
		State,
		City,
		TO_CHAR(Transaction_date,'FMMonth') as Month_name,
		Total_Price,
		Rating,
		CASE
			WHEN Rating >=4.8 AND total_price >=15000 THEN  'Elite'
			WHEN Rating >= 4.5 AND total_price >=10000 THEN 'Premium'
	        ELSE 'Regular'
		END AS customer_level
FROM shop_data
WHERE Delivery_status = 'Delivered'
	  AND product_category IN('Electronics','Furniture','Fashion')
	  AND Total_price >7000
	  AND Rating >=4
	  AND Email like '%gmail.com'
	  AND LENGTH(Phone_number) = 10
	  AND Payment_mode IN('UPI',' Credit Card','Debit card')
	  AND TO_CHAR(Transaction_date,'FMMonth') IN('July','August','September','October','November','December')

ORDER BY Customer_level  DESC, Rating DESC, Total_price DESC,customer_name ASC;
	  