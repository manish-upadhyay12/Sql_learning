

-- practice of full outer join 

CREATE DATABASE practice_db;  --create database 

CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50),
    description VARCHAR(150)
);

INSERT INTO categories VALUES
(1,'Electronics','Electronic devices'),
(2,'Furniture','Home and office furniture'),
(3,'Clothing','Men and women clothing'),
(4,'Books','Educational and entertainment books'),
(5,'Sports','Sports equipment'),
(6,'Kitchen','Kitchen equipment'),
(7,'Stationery','Office and school supplies'),
(8,'Footwear','Shoes and sandals'),
(9,'Beauty','Beauty products'),
(10,'Toys','Kids toys'),
(11,'Groceries','Daily grocery items'),
(12,'Jewelry','Fashion jewelry'),
(13,'Automotive','Car accessories'),
(14,'Garden','Gardening products'),
(15,'Pet Supplies','Products for pets'),
(16,'Bags','Travel and fashion bags'),
(17,'Watches','Wrist watches'),
(18,'Music','Musical instruments'),
(19,'Mobile Accessories','Phone accessories'),
(20,'Home Decor','Decorative products');

CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(100),
    city VARCHAR(50),
    phone VARCHAR(20)
);

INSERT INTO suppliers VALUES
			(1,'TechWorld','Delhi','9876500011'),
			(2,'Modern Furniture','Mumbai','9876500012'),
			(3,'Fashion Hub','Jaipur','9876500013'),
			(4,'Book House','Lucknow','9876500014'),
			(5,'SportZone','Pune','9876500015'),
			(6,'Kitchen King','Agra','9876500016'),
			(7,'Paper Point','Kanpur','9876500017'),
			(8,'Shoe Mart','Noida','9876500018'),
			(9,'Beauty Care','Delhi','9876500019'),
			(10,'Toy Planet','Mumbai','9876500020'),
			(11,'Fresh Mart','Agra','9876500021'),
			(12,'Royal Jewelry','Jaipur','9876500022'),
			(13,'Auto World','Gurgaon','9876500023'),
			(14,'Green Garden','Lucknow','9876500024'),
			(15,'Pet Paradise','Pune','9876500025'),
			(16,'Bag World','Delhi','9876500026'),
			(17,'Time Zone','Mumbai','9876500027'),
			(18,'Music Store','Noida','9876500028'),
			(19,'Mobile Zone','Kanpur','9876500029'),
			(20,'Home Style','Agra','9876500030');

CREATE TABLE product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category_id INT,
    supplier_id INT,
    price DECIMAL(10,2),
    stock_quantity INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

INSERT INTO product VALUES
(1,'Wireless Headphones',1,1,2499.00,45),
(2,'Bluetooth Speaker',1,1,1799.00,32),
(3,'Office Chair',2,2,5999.00,18),
(4,'Wooden Table',2,2,8999.00,10),
(5,'Cotton Shirt',3,3,899.00,75),
(6,'Programming Basics',4,4,650.00,40),
(7,'Cricket Bat',5,5,2499.00,25),
(8,'Non Stick Pan',6,6,1299.00,35),
(9,'Notebook Pack',7,7,299.00,100),
(10,'Running Shoes',8,8,3499.00,28),
(11,'Face Wash',9,9,499.00,60),
(12,'Remote Car',10,10,1199.00,22),
(13,'Basmati Rice 5kg',11,11,699.00,50),
(14,'Silver Bracelet',12,12,2499.00,15),
(15,'Car Phone Holder',13,13,799.00,30),
(16,'Garden Tool Set',14,14,1599.00,20),
(17,'Dog Food 5kg',15,15,999.00,25),
(18,'Travel Backpack',16,16,1999.00,33),
(19,'Digital Watch',17,17,2999.00,19),
(20,'Acoustic Guitar',18,18,7999.00,8);

CREATE TABLE orders_data (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    order_date DATE,
    order_status VARCHAR(30),
    total_amount DECIMAL(10,2)
);

INSERT INTO orders_data VALUES
(1,'Rahul Sharma','2026-01-05','Delivered',4298.00),
(2,'Priya Singh','2026-01-08','Delivered',5999.00),
(3,'Amit Verma','2026-01-12','Shipped',8999.00),
(4,'Neha Gupta','2026-01-15','Delivered',1798.00),
(5,'Rohit Kumar','2026-01-19','Pending',2499.00),
(6,'Sneha Yadav','2026-01-22','Delivered',3499.00),
(7,'Vikas Jain','2026-01-25','Cancelled',1299.00),
(8,'Anjali Mehta','2026-02-01','Delivered',1199.00),
(9,'Karan Singh','2026-02-05','Shipped',699.00),
(10,'Pooja Sharma','2026-02-09','Delivered',2499.00),
(11,'Arjun Patel','2026-02-13','Pending',1599.00),
(12,'Meena Kumari','2026-02-17','Delivered',999.00),
(13,'Suresh Rao','2026-02-21','Delivered',1999.00),
(14,'Kavita Joshi','2026-02-25','Shipped',2999.00),
(15,'Deepak Singh','2026-03-01','Delivered',7999.00),
(16,'Nisha Agarwal','2026-03-05','Pending',650.00),
(17,'Manish Gupta','2026-03-10','Delivered',8999.00),
(18,'Riya Kapoor','2026-03-15','Cancelled',799.00),
(19,'Aditya Mishra','2026-03-20','Delivered',2499.00),
(20,'Simran Kaur','2026-03-25','Shipped',3499.00);

CREATE TABLE order_items (
    item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders_data(order_id),	
	FOREIGN KEY (product_id) REFERENCES product(product_id)
);

INSERT INTO order_items VALUES
				(1,1,1,1,2499.00),
				(2,1,2,1,1799.00),
				(3,2,3,1,5999.00),
				(4,3,4,1,8999.00),
				(5,4,5,2,899.00),
				(6,5,7,1,2499.00),
				(7,6,10,1,3499.00),
				(8,7,8,1,1299.00),
				(9,8,12,1,1199.00),
				(10,9,13,1,699.00),
				(11,10,14,1,2499.00),
				(12,11,16,1,1599.00),
				(13,12,17,1,999.00),
				(14,13,18,1,1999.00),
				(15,14,19,1,2999.00),
				(16,15,20,1,7999.00),
				(17,16,6,1,650.00),
				(18,17,4,1,8999.00),
				(19,18,15,1,799.00),
				(20,19,14,1,2499.00);

				
CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_date DATE,
    payment_method VARCHAR(30),
    amount DECIMAL(10,2),
    payment_status VARCHAR(30),
    FOREIGN KEY (order_id) REFERENCES orders_data(order_id)
);

INSERT INTO payments VALUES
(1,1,'2026-01-05','UPI',4298.00,'Paid'),
(2,2,'2026-01-08','Credit Card',5999.00,'Paid'),
(3,3,'2026-01-12','Debit Card',8999.00,'Paid'),
(4,4,'2026-01-15','Cash',1798.00,'Paid'),
(5,5,'2026-01-19','UPI',2499.00,'Pending'),
(6,6,'2026-01-22','Credit Card',3499.00,'Paid'),
(7,7,'2026-01-25','UPI',1299.00,'Refunded'),
(8,8,'2026-02-01','Cash',1199.00,'Paid'),
(9,9,'2026-02-05','UPI',699.00,'Paid'),
(10,10,'2026-02-09','Debit Card',2499.00,'Paid'),
(11,11,'2026-02-13','UPI',1599.00,'Pending'),
(12,12,'2026-02-17','Cash',999.00,'Paid'),
(13,13,'2026-02-21','Credit Card',1999.00,'Paid'),
(14,14,'2026-02-25','UPI',2999.00,'Paid'),
(15,15,'2026-03-01','Debit Card',7999.00,'Paid'),
(16,16,'2026-03-05','UPI',650.00,'Pending'),
(17,17,'2026-03-10','Credit Card',8999.00,'Paid'),
(18,18,'2026-03-15','UPI',799.00,'Refunded'),
(19,19,'2026-03-20','Cash',2499.00,'Paid'),
(20,20,'2026-03-25','UPI',3499.00,'Paid');


SELECT * FROM categories;
SELECT * FROM suppliers;
SELECT * FROM product;
SELECT * FROM orders_data;

--Display all products.
SELECT * FROM product;

--Find products costing more than ₹2,000.
SELECT * from product 
WHERE Price >2000;

--Find products with stock below 20.
SELECT  product_name, stock_quantity FROM product 
WHERE stock_quantity <20;

--Display all orders with status Delivered.
SELECT * from orders_data
WHERE  order_status ='Delivered';

--Find the most expensive product.

SELECT * FROM product
ORDER BY price DESC LIMIT 1;

--Count the number of products
SELECT  DISTINCT(COUNT(product_name))  AS no_of_product FROM PRODUCT;

--Find the cheapest product.

SELECT * FROM product
ORDER BY price asc LIMIT 1;

--Find the average product price.
SELECT ROUND(AVG(price),3) AS average_price
FROM  product;

--======= Group by ========
/*
Q. Category-wise kitne products hain?

Expected thinking: product
				category_id
				COUNT()
*/
SELECT category_Id,
	   count(*)
FROM product
GROUP BY category_Id
ORDER BY category_id asc;

--Q. Supplier-wise kitne products supply kiye gaye hain?
/*
Output mein:

supplier_id
*/
SELECT supplier_id,
	   count(*)
FROM product
GROUP BY supplier_id
ORDER  by supplier_id ASC;


/*
🔥 Q. Supplier Performance Analysis

Management wants to identify suppliers who are supplying more than 1 product and whose 
average
product price is greater than ₹2,000.

Task: Display:

supplier_id
supplier_name
Number of products supplied
Average product price

Conditions:     Join suppliers and product
				Group by supplier
				Only include suppliers having more than 1 product
				Average price must be greater than ₹2,000
				Sort by average price descending
*/
SELECT s.supplier_id,
	   s.supplier_name,
	   COUNT(p.product_name) AS NO_OF_PRODUCT,
	   ROUND(AVG(p.price),2) AS average_price   
FROM suppliers s
INNER JOIN product p
ON p.supplier_id = s.supplier_id
GROUP BY s.supplier_id,s.supplier_name
HAVING count(p.product_name)>1   AND AVG(p.price)>2000
ORDER BY s.supplier_id ASC ;

/*
🔥 Q. Category Revenue Potential

The company wants to know which product categories have high-value inventory.
Calculate the total inventory value for each category:  price × stock_quantity

Task: Display:  category_id
				category_name
				Number of products
				Total stock quantity
				Total inventory value

Conditions:  Join categories and product
			Group by category
			Only show categories where:
			Total stock quantity is greater than 30
			Total inventory value is greater than ₹50,000
			Sort by total inventory value descending
*/

SELECT c.category_id,
	   c.category_name,
	   COUNT(p.product_name) AS no_of_product,	   
	   SUM(p.stock_quantity)AS total_stock_quantity,
	   SUM(p.price* p.stock_quantity) AS total_inventory_value
FROM categories c
INNER JOIN product p
ON c.category_id = p.category_id
GROUP BY c.category_id,c.category_name
HAVING  SUM(p.stock_quantity) >30 AND SUM(p.price* p.stock_quantity)>50000
ORDER BY SUM(p.price * p.stock_quantity) DESC;
	   
/*
🔥 Q. Customer Order Analysis

The sales team wants to identify customers whose orders have a high average order value.

Task: Display:

customer_name
Number of orders
Total amount spent
Average order amount

Conditions:

Only include customers whose:
Number of orders is at least 1
Average order amount is greater than ₹3,000
Only consider orders with status Delivered or Shipped
Sort by total amount spent descending

💡 This one will make you think carefully about WHERE vs HAVING*/
SELECT 
    o.customer_name,
    COUNT(*) AS no_of_orders,
    SUM(o.total_amount) AS total_amount_spent,
    AVG(o.total_amount) AS average_order_amount
FROM orders_data o
WHERE o.order_status IN ('Delivered', 'Shipped')
GROUP BY o.customer_name
HAVING COUNT(*) >= 1
   AND AVG(o.total_amount) > 3000
ORDER BY SUM(o.total_amount) DESC;