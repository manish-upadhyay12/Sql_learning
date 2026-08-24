   --   ==================== Having ==========================

--Note : we can not use aggregation fnction inside where 
/*
🟢 Question 1 — High Revenue Categories

The Finance Team wants categories whose total revenue is greater than ₹50,000.

Display:

Product_Category
Total_Revenue

Sort by revenue descending.*/

SELECT product_category,
	   SUM(total_price)
FROM shop_data
GROUP BY product_category 
HAVING SUM(total_price) >50000
ORDER BY SUM(total_price) DESC;

/*
🟢 Question 2 — Popular Brands

The Product Manager wants brands that have more than 10 orders.

Display: Brand
		Total_Orders

Sort by Total_Orders descending.
*/
SELECT brand,
		count(*) AS total_order 
FROM shop_data
GROUP BY brand
HAVING count(*) >10
ORDER BY COUNT(*) desc;

/*
🟢 Question 3 — Premium Cities

The Sales Director wants cities where the average order value exceeds ₹5,000.

Display: City
		Average_Order_Value
Sort by Average_Order_Value descending.
*/
SELECT city ,
	   ROUND(AVG(total_price),2) Average_order_value
FROM shop_data
GROUP BY City
HAVING AVG(total_price) >5000
ORDER BY AVG(total_price);

/*
🟢 Question 4 — Highly Rated Categories

The CEO wants product categories with an average rating of at least 4.5.

Display:    Product_Category
			Average_Rating
Sort by Average_Rating descending.
*/
SELECT product_category,
	   ROUND(AVG(rating),2) AS average_rating
FROM shop_data
GROUP BY product_category
HAVING AVG(rating) >4.5
ORDER BY AVG(Rating) DESC;

/*
🟢 Question 5 — Executive Revenue Report

The company wants payment modes that satisfy both:

Total revenue greater than ₹1,00,000
More than 20 orders

Display:    Payment_Mode
			Total_Orders
			Total_Revenue
Sort by revenue descending.
*/

SELECT 
	  payment_mode,
	  COUNT(*) AS total_order ,
	  SUM(total_price) AS total_revenue
FROM shop_data
GROUP BY payment_mode
HAVING  COUNT(*) >20 AND  	  SUM(total_price) >100000
ORDER BY SUM(total_price) DESC;

/*
🟢 Question 6 — Premium Category Audit

One row should represent one Product_Category.

Display:     Product_Category
			Total_Orders
			Total_Revenue

Conditions: 	Delivered orders only
				Gmail customers only
				Rating ≥ 4
				Phone number length = 10
Show only categories whose revenue exceeds ₹75,000.
*/

SELECT product_category,
       COUNT(*) AS total_orders,
       SUM(total_price) AS total_revenue
FROM shop_data
WHERE delivery_status = 'Delivered'
  AND email LIKE '%@gmail.com'
  AND rating >= 4
  AND LENGTH(phone_number) = 10
GROUP BY product_category
HAVING SUM(total_price) > 75000
ORDER BY total_revenue DESC;
/*
🟢 Question 7 — State Performance

One row should represent one State.

Display:    State
			Total_Revenue
			Average_Order_Value

Conditions :    Eectronics or Furniture
				Delivered orders

Show only states having more than 5 orders.
*/
SELECT state,
       SUM(total_price) AS total_revenue,
       ROUND(AVG(total_price),2) AS average_order_value
FROM shop_data
WHERE product_category IN ('Electronics','Furniture')
  AND delivery_status='Delivered'
GROUP BY state
HAVING COUNT(*) > 5
ORDER BY total_revenue DESC;

-------------------------==------------------------------------
-------------------------==------------------------------------
-------------------------==------------------------------------

/*
🟢 Question 1 — Brand Rating Dashboard

One row should represent one Brand.

Display:    Brand (Trimmed)
			Total_Orders
			Average_Rating

Conditions:     Rating IS NOT NULL
				Unit_Price >1000
Show only brands whose average rating is above 4.3.
*/

SELECT Trim(Brand),		
	    COUNT(*),
		AVG(rating) AS average_rating
FROM shop_data
WHERE Rating IS NOT NULL
	  AND Unit_price >1000
GROUP BY brand
HAVING AVG(Rating) >4.3;
 	   
/*
🟢 Question 2 — Holiday Sales Report

One row should represent one Month.

Display: Month_Name
		Total_Revenue
		Highest_Order

Conditions:  July to December
			Delivered orders
Show only months where total revenue exceeds ₹50,000.
*/
SELECT TO_CHAR(transaction_date,'FMMonth') AS Month,
	   SUM(Total_price) as total_revenue,	
	   MAX(total_price) AS highest_order
FROM shop_data
WHERE TO_CHAR(transaction_date,'MM')  BETWEEN '07'  AND '12'
	  AND delivery_status = 'Delivered'
GROUP BY TO_CHAR(transaction_date,'FMMonth') 
HAVING SUM(Total_price) >50000;

/*
🟢 Question 3 — CEO  Challenge

One row should represent one Product_Category.

Display: Product_Category
		Total_Orders
		Total_Revenue
		Average_Order_Value
		Highest_Order
		Lowest_Order
		Revenue_Level (using CASE)

Conditions: Delivered orders
			Gmail customers
			Rating ≥ 4
			Phone number length = 10
			Product_Category IN ('Electronics', 'Fashion', 'Furniture')
			Transaction month July–December

Revenue_Level: Revenue ≥ ₹1,50,000 → Elite
				Revenue ≥ ₹1,00,000 → Premium
				Otherwise → Standard
*/

SELECT product_category,
	   COUNT(*) AS total_orders,
	   SUM(total_price) AS total_revenue,
	   AVG(total_price) AS average_order_value,
	   MAX(total_price)  AS Highest_order,
	   MIN(total_price) AS Lowest_order,
	   CASE
	   		WHEN SUM(Total_price) > 150000 then 'Elite'
			WHEN SUM(Total_price) >= 100000 then 'Premium'
			ELSE 'Standard'
	  END AS Revenue_level
from shop_data
GROUP BY product_category;

/*
🟢 Question 4 — Executive Category Performance Report
📖 Business Problem

The CEO wants to identify the best-performing product categories for the quarterly review.

Display : Product_Category
			Total_Orders
			Total_Revenue
			Average_Order_Value
Revenue_Level (using CASE)
							Revenue_Level Rules
							Revenue ≥ ₹1,50,000 → Elite
							Revenue ≥ ₹75,000 → Premium
							Otherwise → Standard
							
Conditions : Delivered orders only
			Email ends with @gmail.com
			Rating ≥ 4
			Phone number must contain exactly 10 digits
			Transaction month between April and December
			Product_Category IN ('Electronics', 'Fashion', 'Furniture')
			HAVING

Show only categories whose:

Total Revenue > ₹80,000
Total Orders ≥ 5
Sort By
Total_Revenue DESC
Average_Order_Value DESC
*/
--solution 4
SELECT  Product_category,
	    COUNT(*) AS Total_order,
	    SUM(total_price),
		AVG(total_price),
		CASE
			WHEN SUM(total_price) >1500000 THEN 'Elite'
			WHEN SUM(total_price) >75000 THEN 'Premium'
			ELSE 'Standard'
		END AS revenue_level
FROM shop_data
WHERE Delivery_status ='Delivered'
	  AND Email LIKE '%@gmail.com'
	  AND rating >=4
	  AND LENGTH(phone_number)  =10
	  AND TO_CHAR(transaction_date,'MM') BETWEEN '04' AND '12'
	  AND product_category IN('Electronics','Fashion','Furniture')
GROUP BY product_category
HAVING SUM(Total_price) >80000 
	   AND COUNT(*)>=5
ORDER BY SUM(Total_price) DESC,
	     AVG(Total_price) DESC;


/*
🟢 Question 5 — Brand Quality Audit
📖 Business Problem

The Product Quality Team wants to identify brands with consistently high customer satisfaction.

Display  :  Brand (Trimmed)
			Total_Products_Sold
			Average_Rating
			Highest_Unit_Price
			
			Brand_Status :
			Average Rating ≥ 4.8 → Excellent
			Average Rating ≥ 4.5 → Good
			Otherwise → Average
			
Conditions : Rating IS NOT NULL
			Unit_Price > 1000
			Delivery_Status = 'Delivered'
			

Show only brands where:

Average Rating > 4.3
Total Products Sold > 3

Sort By
Average_Rating DESC
Highest_Unit_Price DESC
*/
--solution -5
SELECT Trim(Brand),
	   SUM(Quantity) AS Total_products_sold,
	   AVG(Rating) AS average_rating,
	   MAX(Unit_price),
	   CASE
	   		WHEN AVG(Rating) >=4.8 THEN 'Excellent'
			WHEN AVG(Rating) >4.5 THEN 'Good'
			ELSE 'Average'
		END As Brand_status
FROM shop_data
WHERE Rating IS NOT NULL
	  AND unit_price >1000
	  AND Delivery_status = 'Delivery'
GROUP BY brand
HAVING AVG(Rating) > 4.3 AND 
	   SUM(Quantity) >3
ORDER  BY AVG(Rating) DESC,
	      MAX(Unit_price);

/*
🟢 Question 6 — City Sales Verification
📖 Business Problem

The Regional Sales Manager wants to verify sales quality across cities.
Display :   City
			Total_Orders
			Total_Revenue
			Highest_Order
			Lowest_Order			
Conditions :    Product_Category IN ('Electronics', 'Furniture')
				Email ends with @gmail.com
				Phone number length = 10
				Delivered orders only				

Show only cities where: 

Total Orders ≥ 4
Total Revenue > ₹50,000
Sort By
Total_Revenue DESC
*/
SELECT city,
	   COUNT(*) AS Total_orders,
	   SUM(Total_price) AS total_revenue,
	   MAX(Total_price) AS Highest_order,
	   MIN(Total_price) AS Lowest_order
FROM shop_data
WHERE  product_category IN('Electronics','Furniture') 
	   AND Email LIKE '%@gmail.com'
	   AND LENGTH(phone_number) = 10
	   AND delivery_status =  'Delivered'
GROUP BY city
HAVING COUNT(*)>=4 
	   AND SUM(total_price) >50000 
ORDER BY  SUM(Total_price) DESC;
	   


/*
🟢 Question 5 — 🔥 Final CEO Audit Challenge
📖 Business Problem

You are working as a Data Analyst at Amazon.
The CEO wants a report of the company's most valuable product categories.
One row should represent one Product_Category.
Display  :  Product_Category
			Total_Orders
			Total_Revenue
			Average_Order_Value
			Highest_Order
			Lowest_Order			
Revenue_Level   :
			Revenue_Level (CASE) :
						Revenue ≥ ₹2,00,000 → Diamond
						Revenue ≥ ₹1,20,000 → Platinum
						Revenue ≥ ₹80,000 → Gold
						Otherwise → Silver
Conditions
			Delivery_Status = 'Delivered'
			Email ends with @gmail.com
			Phone number contains exactly 10 digits
			Rating ≥ 4.2
			Product_Category IN ('Electronics', 'Furniture', 'Fashion')
			Payment_Mode IN ('UPI', 'Credit Card', 'Debit Card')
			Transaction month between July and December
			Total_Price IS NOT NULL
Show only categories where:

Total Revenue > ₹1,00,000
Average Order Value > ₹6,000
Total Orders ≥ 5

Sort By
Total_Revenue DESC
Average_Order_Value DESC
Product_Category ASC
*/

-- solution=5
SELECT      Product_Category,
			COUNT(*),
			SUM(Total_price),
			Avg(Total_price),
			MAX(Total_price),
			MIN(Total_price),
			CASE
				WHEN  SUM(Total_price) >=200000 THEN  'Diamond'
				WHEN  SUM(Total_price)  >= 120000   THEN 'Platinum'
				WHEN  SUM(Total_price)  >= 80000 THEN   'Gold'
			    ELSE  'Silver'
			END Revenue_level
FROM shop_data
WHERE  
	     Delivery_Status = 'Delivered' 
			AND Email Like  '%@gmail.com'
			AND LENGTH(Phone_number) = 10 
			AND Rating >= 4.2
			AND Product_Category IN ('Electronics', 'Furniture', 'Fashion')
			AND Payment_Mode IN ('UPI', 'Credit Card', 'Debit Card')
			AND TO_CHAR(Transaction_date ,'FMMonth') between 'July' and 'December'
			AND Total_Price IS NOT NULL
GROUP BY product_category
HAVING  SUM(Total_price) > 100000
		AND Avg(Total_price) > 6000
		AND COUNT(*) >= 5
ORDER BY SUM(Total_price) DESC,
         Avg(Total_price)  DESC,
          Product_Category ASC;








