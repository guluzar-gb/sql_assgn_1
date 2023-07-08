--#1. How many customers are in each city? Your solution should include the city name and the number of customers sorted from highest to lowest.
SELECT city, COUNT(customer_id)
FROM sale.customer
GROUP BY city
ORDER BY COUNT(customer_id) DESC;


--#2Find the total product quantity of the orders. Your solution should include order ids and quantity of products.
SELECT order_id, sum(quantity)as quantity_of_product
FROM sale.order_item
GROUP BY order_id;


--#3. Find the first order date for each customer_id
SELECT customer_id, MIN(order_date) AS first_order_date
FROM sale.orders
GROUP BY customer_id;

--#4. Find the total amount of each order. Your solution should include order id and total amount sorted from highest to lowest.
--before discounted
SELECT order_id, SUM(list_price * quantity) AS total_amount
FROM sale.order_item
GROUP BY order_id
ORDER BY total_amount DESC;

--#5. Find the order id that has the maximum average product price.
--#Your solution should include only one row with the order id and average product price.
SELECT top 1 order_id, AVG(list_price / quantity) AS avg_price
FROM SampleRetail.sale.order_item
GROUP BY order_id
ORDER BY avg_price DESC;


----#6. Write a query that displays brand_id, product_id and list_price 
--sorted first by brand_id (in ascending order), and then by list_price  (in descending order).
SELECT brand_id,  list_price,product_id
FROM SampleRetail.product.product
Order By brand_id ASC, list_price DESC;

--#7. Write a query that displays brand_id, product_id and list_price, but this time sorted
--first by list_price (in descending order), and then by brand_id (in ascending order).
SELECT  list_price, brand_id, product_id
FROM SampleRetail.product.product
Order By list_price DESC, brand_id ASC;

--#8. Compare the results of these two queries above.
--# How are the results different when you switch the column you sort on first?

-- The first query sorts the results first by brand_id in ascending order, and then by list_price in descending order.
-- The second query sorts the results first by list_price in descending order, and then by brand_id in ascending order.

--  The main difference is the primary sorting columns, where  the results in the first query are grouped by brand_id first,
--  and then sorted within each group by list_price. While, the the results in the secons query are sorted by list_price first,
--  and then within each list_price value, sorted by brand_id.

-- As a result, the two queries will produce different results. For example, if there are two products with the same list_price
-- but different brand_id values, the first query will group them together based on brand_id,
-- while the second query will treat them as separate rows based on their distinct list_price values.


--#9. Write a query to pull the first 10 rows
--# and all columns from the product table that have a list_price greater than or equal to 3000.
select top 10 * from  [product].[product]
where list_price>= 3000

--#10. Write a query to pull the first 5 rows and all columns from the product table that have a list_price less than 3000.

  SELECT TOP (5) * FROM [SampleRetail].[product].[product]
  WHERE list_price< 3000


--#11. Find all customer last names that start with 'B' and end with 's'.
Select last_name from SampleRetail.sale.customer
WHERE last_name LIKE 'B%s';

--#12. Use the customer table to find all information regarding customers whose address is Allen or Buffalo or Boston or Berkeley.
Select * from SampleRetail.sale.customer
WHERE city IN ('Allen', 'Buffalo', 'Boston', 'Berkeley');