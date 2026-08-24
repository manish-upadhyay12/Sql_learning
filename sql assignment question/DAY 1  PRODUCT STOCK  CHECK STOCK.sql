
------------------------
Assignment
------------------------

/*
Condition :
			if quantity >=10                 : In stock
			if quantity >=5 and quantity <=9 : Limited Stock
			if quantity <5                   : outof stock

*/

SELECT product_name,
	   quantity,
	CASE
		WHEN quantity >=10 then 'In stock'
		WHEN quantity >=5 AND quantity <=9 then 'Limited stock' 
		else 'Out Of Stock' 
	END
FROM products;
 