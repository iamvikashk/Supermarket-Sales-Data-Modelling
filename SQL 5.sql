-- 5. Some retailers believe that their male members are bringing in more overall revenue per purchase while others believe female non-members are bringing in more revenue per purchase of fashion accessories. Who is right?

SELECT customers.gender as "Gender", products.line, AVG(products.unit_price * quantity + tax) AS " Average Purchase" 
FROM orders JOIN order_details 
ON orders.order_id = order_details.order_id JOIN customers 
ON orders.customer_id = customers.customer_id JOIN products 
ON order_details.product_id = products.product_id 
WHERE products.line = "Fashion accessories" 
AND customers.gender = "Female" 
AND customers.type = "Normal" 
UNION 
SELECT customers.gender as "Gender", "Overall", AVG(products.unit_price * quantity + tax) AS " Average Purchase" 
FROM orders JOIN order_details 
ON orders.order_id = order_details.order_id JOIN customers 
ON orders.customer_id = customers.customer_id JOIN products  
ON order_details.product_id = products.product_id 
WHERE customers.gender = "Male" 
AND customers.type = "Member";
