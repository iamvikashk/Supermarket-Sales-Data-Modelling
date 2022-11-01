-- 7. Yangon calls itself the most eWallet-friendly city for health and beauty while Mandalay calls itself a haven for cash spending. Does the data support their claims?
-- Both claims are wrong
SELECT products.line, orders.payment, orders.city, COUNT(*) 
FROM orders JOIN order_details 
ON orders.order_id = order_details.order_id JOIN customers 
ON orders.customer_id = customers.customer_id JOIN products  
ON order_details.product_id = products.product_id 
WHERE products.line = "Health and beauty" and orders.payment = "Ewallet" 
GROUP BY payment, city 
union 
SELECT "Overall", orders.payment, orders.city, COUNT(*) 
FROM orders JOIN order_details 
ON orders.order_id = order_details.order_id JOIN customers 
ON orders.customer_id = customers.customer_id JOIN products  
ON order_details.product_id = products.product_id 
WHERE payment = "Cash" 
GROUP BY orders.city;