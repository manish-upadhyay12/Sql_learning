
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price NUMERIC(10, 2),
    quantity INT,
    added_date DATE,
    discount_rate NUMERIC(5, 2)
);
INSERT INTO products (
    product_name,
    category,
    price,
    quantity,
    added_date,
    discount_rate
)
VALUES
('Laptop', 'Electronics', 75000.50, 10, '2024-01-15', 10.00),
('Smartphone', 'Electronics', 45000.99, 25, '2024-02-20', 5.00),
('Headphones', 'Accessories', 1500.75, 50, '2024-03-05', 15.00),
('Office Chair', 'Furniture', 5500.00, 20, '2023-12-01', 20.00),
('Desk', 'Furniture', 8000.00, 15, '2023-11-20', 12.00),
('Monitor', 'Electronics', 12000.00, 8, '2024-01-10', 8.00),
('Printer', 'Electronics', 9500.50, 5, '2024-02-01', 7.50),
('Mouse', 'Accessories', 750.00, 40, '2024-03-18', 10.00),
('Keyboard', 'Accessories', 1250.00, 35, '2024-03-18', 10.00),
('Tablet', 'Electronics', 30000.00, 12, '2024-02-28', 5.00);

SELECT *FROM products;

----------------------------------------AGGREATION FUNCTION -------------------------------------------------
            -----------------------------Level 1 (Warm-up)---------------------------------------------
-- Q1. How many products are available in the inventory?

SELECT DISTINCT COUNT(*) AS count_data 
FROM products;

--Q2. Find the total quantity of all products.

SELECT SUM(quantity) AS total_quantity FROM products;


--Q3. Find the average price of all products.
SELECT AVG(price) AS avg_price 
FROM products;

--Q4. Find the most expensive product price.
SELECT MAX(price) AS most_expensive
FROM products;

-- IF QUESTION SAY ALSO SHOW NAME OF PRODUCT 
SELECT  product_name ,price FROM products ORDER BY price DESC LIMIT 1;

--Q5. Find the cheapest product price product_name.
SELECT product_name ,
	   price
FROM products ORDER BY price ASC 
LIMIT 1;

--Q6. How many products belong to Electronics?
SELECT product_name,
	   category
FROM products
WHERE category ='Electronics';

--Q7. Find the total quantity of Electronics products.
SELECT SUM(quantity) AS Total_quantity 
FROM products
WHERE category = 'Electronics';

--Q8. Find the average discount_rate offered.

SELECT  ROUND(AVG(discount_rate),2) AS avg_discount 
FROM products;

--Q9. Find the maximum discount available.
SELECT MAX(discount_rate) AS avg_discount 
FROM products;

         --+--+--+--+--+---+---+---Level 2 (Real Company Style) --+--+---+---+-----+----
-- Q10, Your manager asks:
-- 	"How many products cost more than ₹10,000?"
SELECT product_name,
	   price
FROM products
WHERE price>10000;

--Q11.  Find the total quantity of products priced above ₹10,000.
SELECT SUM(quantity) AS total_quantity
FROM products
WHERE price>10000;

--Q12. Find the average price of Furniture products.
SELECT ROUND(AVG(price) ,2) AS average_price 
FROM products
WHERE category = 'Furniture';

--Q13. Find the highest price of electonics product 
SELECT MAX(price) AS Highest_price 
FROM products
WHERE category = 'Electronics';

--Q14. Find the cheapest Accessories product.
SELECT product_name,
	   category,
	   price
FROM products
WHERE category = 'Accessories'
ORDER BY price ASC 
LIMIT 1;

--Q15. How many products were added in 2024?
SELECT product_name,
	   added_date
FROM  products
WHERE added_date BETWEEN '2024-12-31' AND '2026-01-01';


--Q16. Find the total quantity of products added after 1st February 2024.
SELECT SUM(quantity) 
AS Total_quantity
FROM products
WHERE added_date >'2024-02-01';


--18. Find the average price of products with a discount greater than 10%.

SELECT   ROUND(AVG(price),2) AS Avg_price
FROM products
WHERE discount_rate>10;

--Q19. How many products have exactly a 10% discount?
SELECT product_name from products
WHERE discount_rate =10;


--Q20. Find the total quantity of Furniture products costing less than ₹10,000.
SELECT  SUM(quantity) AS total_quantity
from products
WHERE category = 'Furniture';  --output : 35

--------------------------------------Level 3 (Logic Building)-------------------------------
-- -Q21.  Find the total inventory value.

-- Formula:
-- price × quantity
-- Example
-- Laptop
-- 75000 × 10

SELECT product_name,
	   (price* quantity) AS Total_quantity
from products;
	   
--Q22.  Find the total inventory value of Electronics only.
SELECT product_name,
	   category,
	   (price*quantity) AS Total_amount
FROM products
WHERE category ='Electronics';


--Q23. Find the average Total_amount value per product.
SELECT ROUND(AVG(price*quantity),2) AS Average_value
FROM products;

--Q24. Find the highest inventory value among all products.
SELECT product_name,
	   (quantity*price) AS Total_quantity
FROM products ORDER BY Total_quantity Desc limit 1;

--Q25. Find the lowest inventory value.
SELECT product_name,
	   (quantity*price) AS Total_quantity
FROM products ORDER BY Total_quantity ASC limit 1;

--------------------------------------------------------------------------------------------------------












