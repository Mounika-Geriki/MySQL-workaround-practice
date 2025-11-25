### SUB QUERY - NESTED QUERY
# Find all the orders placed from customers whose score higher than 500 using customer ID
# FOCUS ON orders and customers tables

#STEP1
SELECT * FROM orders;

#STEP2
SELECT * FROM customers
WHERE Score > 500;
## PRINTS CUSTID 2,3

#STEP3 ADD WHERE CustomerID IN (2,3);
SELECT * FROM orders
WHERE CustomerID IN (2,3);

# WE HAVE TO RUN OTHER QUERY TO GET IDS
# FOR BIG TABLES ITS NOT EASY

#SO USE SUBQUERY
# WE WANT ONLY CUSTID FROM customers table
SELECT CustomerID FROM customers
WHERE Score > 500;

#USING """"""IN"""""""
#### place the above inside orders query
SELECT * FROM orders
WHERE CustomerID IN 
(SELECT CustomerID FROM customers
WHERE Score > 500);

#USING """"""EXIST""""""
# USE EXISTS insted of IN for large tables. you will get better performance with EXISTS
SELECT * FROM orders AS o
WHERE EXISTS(
SELECT 1           ## CAN BE ANYTHING cust_id, *, score, country ---- doesnot matter
FROM customers AS c
WHERE c.CustomerID = o.CustomerID
AND Score > 500);








