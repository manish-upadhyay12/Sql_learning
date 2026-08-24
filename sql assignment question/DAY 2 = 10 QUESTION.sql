--------------------------------
   CONDITIONAL FUNCTIONS
--------------------------------

-------------------------------
1. CASE WHEN
2. COALESCE
-------------------------------


------------------ PRACTICE QUESTIONS ----------------------------

/*🟢
Question 1 – Product Price Classification

The Sales Manager wants to categorize products based on price.

Conditions:

Price > 50000 → "Premium"
Price between 10000 and 50000 → "Standard"
Otherwise → "Budget"
*/

SELECT
    product_name,
    price,
    CASE
        WHEN price > 50000 THEN 'Premium'
        WHEN price BETWEEN 10000 AND 50000 THEN 'Standard'
        ELSE 'Budget'
    END AS price_category
FROM products;



/*🟢
Question 2 – Inventory Status

The Warehouse Manager wants to know stock availability.

Conditions:

Quantity >= 30 → "In Stock"
Quantity between 10 and 29 → "Limited Stock"
Quantity < 10 → "Restock Required"
*/

SELECT
    product_name,
    quantity,
    CASE
        WHEN quantity >= 30 THEN 'In Stock'
        WHEN quantity BETWEEN 10 AND 29 THEN 'Limited Stock'
        ELSE 'Restock Required'
    END AS stock_status
FROM products;



/*🟢
Question 3 – Discount Analysis
The Marketing Team wants to classify discounts.
Conditions:
Discount >= 15% → "High Discount"
Discount between 10% and 14.99% → "Medium Discount"
Otherwise → "Low Discount"
*/
SELECT
    product_name,
    discount_rate,
    CASE
        WHEN discount_rate >= 15 THEN 'High Discount'
        WHEN discount_rate BETWEEN 10 AND 14.99 THEN 'Medium Discount'
        ELSE 'Low Discount'
    END AS discount_status
FROM products
ORDER BY discount_rate ASC;

/*🟢
Question 4 – Selling Price After Discount
Management wants to see the actual selling price.Formula:
price - (price * discount_rate / 100)
*/

SELECT
    product_name,
    price,
    ROUND(price - (price * discount_rate / 100), 2) AS selling_price
FROM products;



/*🟢
Question 5 – Profit Margin Category

Selling Price > ₹40,000 → "High Value Product"
Selling Price between ₹10,000–₹40,000 → "Medium Value Product"
Otherwise → "Low Value Product"
*/

SELECT
    product_name,
    ROUND(price - (price * discount_rate / 100), 2) AS selling_price,
    CASE
        WHEN (price - (price * discount_rate / 100)) > 40000 THEN 'High Value Product'
        WHEN (price - (price * discount_rate / 100)) BETWEEN 10000 AND 40000 THEN 'Medium Value Product'
        ELSE 'Low Value Product'
    END AS value_category
FROM products;

/*🟢
Question 6 – Product Age If product was added before 2024-01-01  then Old Productotherwise New Product
*/

SELECT
    product_name,
    added_date,
    CASE
        WHEN added_date > '2024-01-01' THEN 'New Product'
        ELSE 'Old Product'
    END AS product_status
FROM products;



/*🟢
Question 7 – Electronics Priority
If category is Electronics AND price > 30000
then Priority Product
Else Normal Product
*/

SELECT
    product_name,
    category,
    price,
    CASE
        WHEN category = 'Electronics' AND price > 30000 THEN 'Priority Product'
        ELSE 'Normal Product'
    END AS category_status
FROM products;

/*🟢
Question 8 – Restocking Alert

If quantity < 10 AND discount_rate < 10 then Urgent Purchase Else No Action
*/

SELECT
    product_name, quantity,  discount_rate,
    CASE
        WHEN quantity < 10 AND discount_rate < 10 THEN 'Urgent Purchase'
        ELSE 'No Action'
    END AS purchase_status
FROM products;



/*🟢
Question 9 – Festival Offer

Electronics with discount >= 10% → Festival Offer
Furniture with discount >= 15% → Festival Offer
Otherwise → Regular Price
*/

SELECT
    product_name,
    category,
    discount_rate,
    CASE
        WHEN category = 'Electronics' AND discount_rate >= 10 THEN 'Festival Offer'
        WHEN category = 'Furniture' AND discount_rate >= 15 THEN 'Festival Offer'
        ELSE 'Regular Price'
    END AS offer_status
FROM products;



/*🟢
Question 10 – Company Dashboard Report

Display:
Product Name,Original Price,Selling Price,Stock Status,Price Category,Discount Status
*/

SELECT
    product_name,
    price AS original_price,
    ROUND(price - (price * discount_rate / 100), 2) AS selling_price,

    CASE
        WHEN quantity >= 30 THEN 'In Stock'
        WHEN quantity BETWEEN 10 AND 29 THEN 'Limited Stock'
        ELSE 'Restock Required'
    END AS stock_status,

    CASE
        WHEN price > 50000 THEN 'Premium'
        WHEN price BETWEEN 10000 AND 50000 THEN 'Standard'
        ELSE 'Budget'
    END AS price_category,

    CASE
        WHEN category = 'Electronics' AND discount_rate >= 10 THEN 'Festival Offer'
        WHEN category = 'Furniture' AND discount_rate >= 15 THEN 'Festival Offer'
        ELSE 'Regular Price'
    END AS discount_status
FROM products;



--------------------------------
        COALESCE()
--------------------------------

ALTER TABLE products
ADD COLUMN null_check NUMERIC(5,0);

SELECT
    product_name,
    COALESCE(null_check, 0) AS null_checks
FROM products;










