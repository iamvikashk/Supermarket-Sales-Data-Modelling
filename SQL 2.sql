-- 2. Some retailers believe that revenue in food and beverages can be increased amongst women by focusing on Ewallets, while others believe eWallets are more popular with men buying electronic accessories. Who is right?
-- in the Food and Beverages product line (26 orders).
-- Translation: 
SELECT customers.gender, products.line, orders.payment, COUNT(*) 
FROM orders JOIN order_details 
ON orders.order_id = order_details.order_id JOIN customers 
ON orders.customer_id = customers.customer_id JOIN products  
ON order_details.product_id = products.product_id 
WHERE products.line IN ("Electronic accessories", "Food and beverages") 
AND payment = "Ewallet" 
GROUP BY customers.gender, products.line;
-- Answer: Ewallets are more popular with men buying products in the Electronic Accessories line (33 orders) than women 