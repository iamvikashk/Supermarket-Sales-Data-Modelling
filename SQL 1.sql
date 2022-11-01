-- 1. Some retailers believe that there is more money to be made in selling fashion accessories to men than sports and travel to women.Is this true?
-- Translation: 
-- Cleanup: 
SELECT products.line, gender, SUM(products.unit_price * quantity + tax) AS CategoryTotal
FROM orders JOIN order_details
ON orders.order_id = order_details.order_id JOIN customers
ON orders.customer_id = customers.customer_id JOIN products 
ON order_details.product_id = products.product_id
WHERE products.line IN ("Fashion accessories", "Sports and travel")
GROUP BY customers.gender, products.line;
-- Answer: This is not true. The total of all orders for Male customers in Fashion Accessories line was $23,868.57 while the total of all orders for Female customers in Sports and Travel line was $28,574,81