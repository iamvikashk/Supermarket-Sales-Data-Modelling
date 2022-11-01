-- 4. Some retailers believe that their members are spending more per purchase while members believe they are spending less per purchase. Who is right?
-- The average purchase for members is higher ($327.79) than for normal customers ($318.12). The retailers are right.
SELECT customers.type AS "Customer Type", AVG(products.unit_price * quantity + tax) AS "Average Per Purchase" 
FROM orders JOIN order_details 
ON orders.order_id = order_details.order_id JOIN customers 
ON orders.customer_id = customers.customer_id JOIN products 
ON order_details.product_id = products.product_id 
GROUP BY customers.type;
