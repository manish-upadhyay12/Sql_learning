  ------------------- JOIN ---------------------
CREATE TABLE customers(
	customer_id INT PRIMARY KEY,
	customer_name VARCHAR(100),
	email VARCHAR(100),
	city VARCHAR(100)
);

INSERT INTO customers VALUES
			(101,'Rahul','rahul@gmail.com','Delhi'),
			(102,'Aman','aman@gmail.com','Mumbai'),
			(103,'Priya','priya@gmail.com','Pune'),
			(104,'Sneha','sneha@gmail.com','Lucknow'),
			(105,'Rohit','rohit@gmail.com','Jaipur');

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price NUMERIC(10,2)
);


INSERT INTO products VALUES
			(201,'Laptop','Electronics',55000),
			(202,'Mouse','Electronics',800),
			(203,'Keyboard','Electronics',1500),
			(204,'Chair','Furniture',4500),
			(205,'Table','Furniture',7000);


CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    order_date DATE
);

INSERT INTO orders(order_id,customer_id,product_id,quantity,order_date)

VALUES
		(1,101,201,1,'2024-01-10'),
		(2,101,202,2,'2024-01-15'),
		(3,102,204,1,'2024-02-03'),
		(4,103,201,1,'2024-02-12'),
		(5,104,205,2,'2024-03-01'),
		(6,105,203,3,'2024-03-05'),
		(7,102,202,1,'2024-03-08'),
		(8,103,204,2,'2024-03-15'),
		(9,101,205,1,'2024-04-01'),
		(10,104,201,1,'2024-04-06'),
		(11,105,202,4,'2024-04-09'),
		(12,103,203,2,'2024-04-20'),
		(13,102,205,1,'2024-05-01'),
		(14,101,204,2,'2024-05-10'),
		(15,104,202,1,'2024-05-18');

/*
🎯 Practice Questions 
🟢 Question 1 — Customer Purchase Summary

Display:   Customer_Name
			Product_Name
			Price
			Quantity
			Total_Bill

Sort by : Highest Total_Bill first.
*/
SELECT
    customers.customer_name AS customer_name,
    products.product_name AS product_name,
    products.price AS price,
    orders.quantity AS quantity
FROM customers
INNER JOIN orders
    ON customers.customer_id = orders.customer_id
INNER JOIN products
    ON orders.product_id = products.product_id
ORDER BY products.price DESC;


/*
🟢 Question 2 — Electronics Orders

Display  : Customer_Name
			Product_Name
			Category
			Price

Conditions : Electronics  only
			Price >1000p

Sort by Price DESC.
*/
SELECT c.customer_name,
	   p.product_name,
	   p.category,
	   p.price
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
INNER JOIN products p
ON p.product_id = o.product_id
WHERE category = 'Electronics'
ORDER BY p.price DESC;

/*
🟢 Question 3 — Furniture Report

Display :   Customer_Name
			Product_Name
			Quantity
			Order_Date

Conditions : Furniture category
			Quantity at least 2

Sort by Order_Date.
*/
SELECT c.customer_name,
	   p.product_name,
	   o.quantity,
	   o. order_date
FROM customers  c
INNER JOIN orders o
ON c.customer_id = o.customer_id
INNER JOIN products p
ON o.product_id  = p.product_id
ORDER BY  O.order_date DESC;


/*
🟢 Question 4 — Premium Orders

Display  :  Customer_Name
			Product_Name
			Price
			Quantity
			Total_Bill

Conditions   : Total_Bill greater than ₹10,000
Sort by Total_Bill DESC
*/
SELECT c.Customer_Name,
	   p.product_name,
	   p.pricE,
	   o.quantity,
	   o.quantity *  p.price AS total_bill
FROM customers c 
INNER JOIN orders o
ON c.customer_id = o.customer_id
INNER JOIN products p
ON p.product_id  = o.product_id

WHERE o.quantity *  p.price >10000

ORDER BY  o.quantity *  p.price DESC;







































































































































































































































































































































































































































































