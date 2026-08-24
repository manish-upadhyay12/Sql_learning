SELECT * FROM CUSTOMERS;
SELECT * FROM PRODUCTS;
SELECT * FROM ORDERS;

--============================ Practice question  ========================
/*
🟢 Question 1 — High-Value Customer Purchases

The Sales Team wants to identify expensive purchases.

Display:     Customer_Name
			Product_Name
			Category
			Price
			Quantity
			Total_Bill

Conditions:     Price > ₹4,000
				Quantity >= 2
				Category must be Furniture OR Electronics
				Only matching customer, order, and product records

Sort by Total_Bill descending.*/
SELECT
    c.customer_name,
    p.product_name,
    p.category,
    p.price,
    o.quantity,
    p.price * o.quantity AS total_bill
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
INNER JOIN products p
    ON o.product_id = p.product_id
WHERE p.price > 4000
  AND o.quantity >= 2
  AND p.category IN ('Furniture', 'Electronics')
ORDER BY total_bill DESC;


/*
🟢 Question 2 — Mumbai Electronics Sales

The Marketing Team wants to analyze electronics sales from Mumbai customers.

Display:    Customer_Name
			City
			Product_Name
			Price
			Quantity
			Order_Date

Conditions:  City = Mumbai
			Category = Electronics
			Price >= ₹1,000
			Quantity between 1 and 4

Sort by Order_Date newest first.
*/
SELECT  c.customer_name,
	    c.city,
		p.product_name,
		p.price,
	    o.quantity,
		o.order_date
FROM customers c
INNER  JOIN orders o
ON c.customer_id = o.customer_id
INNER JOIN products p
ON p.product_id = o.product_id
WHERE city ='Mumbai'
	  AND category = 'Electronics'
	  AND price >=1000
	  AND quantity BETWEEN 1 AND 4
ORDER BY o.order_date DESC;


/*
🟢 Question 3 — Premium Customer Identification

The CRM team wants customers who purchased at least one expensive product.

Display:    Customer_Name
			Email
			Product_Name
			Price
			Total_Bill

Conditions:  Price > ₹5,000
			Customer must be from Delhi, Pune, or Lucknow
			Quantity >= 1
			Product category must NOT be Electronics
Sort by Total_Bill descending.
*/
SELECT c.customer_name,
	   c.email,
	   p.product_name,
	   p.price,
	   p.price * o.quantity AS total_bill
FROM customers c 
INNER JOIN orders o 
ON o.customer_id = c.customer_id
INNER JOIN products p
ON p.product_id = o.product_id
WHERE p.price>5000
     AND c.city IN('Delhi','Pune','Lucknow')
	 AND o.quantity >=1
	 AND p.category  <>'Electronics'
ORDER BY  p.price * o.quantity DESC ;
	 
/*
🔥 Question 4 — Suspicious Large Purchase
The Fraud Team wants to inspect unusually large individual purchases.
Display:		Order_ID
			Customer_Name
			Product_Name
			Price
			Quantity
			Total_Bill
			Order_Date

Conditions:	Quantity >= 3
			Total_Bill > ₹10,000
			Price > ₹1,500
			Customer city must NOT be Mumbai
			Product category must be Electronics OR Furniture

Sort by:  Total_Bill DESC Quantity DESC
*/
SELECT  o.order_id,
	    c.customer_name,
		p.product_name,
		p.price,
		o.quantity,
		c AS total_bill,
		o.order_date
FROM customers c
INNER JOIN orders o
ON o.customer_id = c.customer_id
INNER JOIN products p
ON p.product_id = o.product_id
WHERE o.quantity >=3
	
	  AND p.price >1500
	  AND c.city <> 'Mumbai'
	  AND p.category IN('Electronics','Furniture')
ORDER BY  p.price * o.quantity DESC;

--==================================Day 2 ====================

🟢 Question 5 — Customer Spending Analysis

The Finance Team wants to identify individual orders made by customers whose city is either Delhi or Jaipur.

Display:	Customer_Name
			City
			Product_Name
			Price
			Quantity
			Total_Bill

Conditions:	City IN (Delhi, Jaipur)
			Price between ₹1,000 and ₹10,000
			Quantity >= 2
			Total_Bill > ₹5,000

Sort by Total_Bill descending.


SELECT c.customer_name,
	   c.city,
	   p.product_name,
	   p.price,
	   o.quantity,
	   p.price * o.quantity AS total_Bill
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
INNER JOIN products p
ON o.product_id = P.product_id

WHERE      c.city IN ('Delhi','Jaipur')
	  AND  p.price BETWEEN 1000 AND 10000
	  AND  o.quantity >=2
	  AND  (p.price * o.quantity) >5000
ORDER BY (p.price * o.quantity) DESC;


/*
🔥 Question 6 — Product Purchase Audit

The Product Team wants to investigate purchases of high-priced products.

Display:	Product_Name
			Category
			Customer_Name
			City
			Price
			Quantity
			Order_Date

Conditions:  Price > ₹4,500
			Category is Electronics OR Furniture
			Customer city is NOT Pune
			Quantity between 1 and 3
			Order_Date after 2024-02-01

Sort by Price DESC, then Order_Date DESC.
*/
SELECT p.product_name,
	   p.category,
	   c.customer_name,
	   c.city,
	   p.price,
	   o.quantity,
	   o.order_date
FROM customers c
INNER JOIN orders o 
ON o.customer_id  = c.customer_id
INNER JOIN products p
ON p.product_id = o.product_id

WHERE  p.price >45000
	   AND p.category IN('Electronics' , 'Furniture')
	   AND  NOT c.city = 'pune'
		AND o.quantity BETWEEN 1 AND 3
		AND o.order_date > '2024-02-01'
ORDER BY p.price DESC,
	     o.order_date DESC;

/*
🔥 Question 7 — Weekend-Style Business Audit

The management team wants to inspect larger orders placed after March 2024.

Display:Customer_Name
		Product_Name
		Category
		Quantity
		Price
		Total_Bill
		Order_Date

Conditions:  Order_Date >= 2024-03-01
			Quantity >= 2
			Price > ₹1,000
			Total_Bill > ₹7,000
			Customer must be from Delhi, Mumbai, Pune, or Jaipur
Sort by Order_Date DESC and Total_Bill DESC
*/

SELECT c.Customer_Name,
		p.Product_Name,
		p.Category,
		o.Quantity,
		p.Price,
		p.price * o.quantity AS Total_Bill,
		o.Order_Date
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
INNER JOIN products p
ON p.product_id = o.product_id

WHERE       O.Order_Date >= '2024-03-01'
		AND O.Quantity >= 2
		AND P.Price > 1000
		AND p.price * o.quantity > 7000
		AND c.city IN('Delhi', 'Mumbai', 'Pune',  'Jaipur')
ORDER BY o.order_date DESC,
	     p.price * o.quantity DESC;

/*
.

🧠 Question 8 — Customer Product Verification

The Data Quality Team wants to verify that customers are purchasing valid products.

Display:

Customer_ID:  Customer_Name
			Product_ID
			Product_Name
			Category
			Quantity
			Price

Conditions: 
			Customer and product must have a matching order
			Category must NOT be Furniture
			Quantity > 1
			Price < ₹10,000
			Customer city must NOT be Lucknow

Sort by Customer_Name ASC, then Price DESC.
*/
SELECT     c.Customer_Name,
			p.Product_ID,
			p.Product_Name,
			p.Category,
			o.Quantity,
			p.Price
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
INNER JOIN products p
ON p.product_id = o.product_id

WHERE  not p.category  = 'Furniture'
	  AND  o.quantity >1
	  AND  p.price >10000
	  AND  c.city NOT IN('Lucknow')
ORDER BY  c.customer_name ASC,
	   	  p.price DESC;

/*
🔥 Question 9 — Executive Purchase Report

The CEO wants a detailed report of high-value purchases.

Display:	Customer_Name
			City
			Product_Name
			Category
			Price
			Quantity
			Total_Bill
			Order_Date

Conditions:	Price >= ₹1,500
			Quantity >= 2
			Total_Bill >= ₹8,000
			Category IN (Electronics, Furniture)
			City IN (Delhi, Mumbai, Pune)
			Order_Date between 2024-02-01 and 2024-05-01

Sort:		Total_Bill DESC
			Price DESC
			Customer_Name ASC */


SELECT     c.Customer_Name,
			c.City,
			p.Product_Name,
			p.Category,
			p.Price,
			o.Quantity,
			p.price * o.quantity,
			o.Order_Date
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
INNER JOIN products p
ON p.product_id = o.product_id

WHERE       p.Price >= 1500
			AND o.Quantity >= 2
			AND p.price * o.quantity >= 8000
			AND p.Category IN ('Electronics', 'Furniture')
			AND c.City IN ('Delhi', 'Mumbai', 'Pune')
			AND o.Order_Date between '2024-02-01' and '2024-05-01'
ORDER BY p.price * o.quantity DESC,
	     P.price DESC,
		 c.customer_name ASC;