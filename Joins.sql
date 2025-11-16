#\ALIASES
SELECT c.CustomerID AS cid
FROM customers AS c;

# list customerId, firstname, order id, quantity. ##exclude## cust who have not placed any orders
# we have to consider customers, orders tables
SELECT * FROM orders;

SELECT customers.CustomerID, FirstName, OrderID, Quantity
FROM customers
INNER JOIN orders 
ON customers.CustomerID = orders.CustomerID;

#using ALiases
SELECT c.CustomerID, c.FirstName, o.OrderID, o.Quantity
FROM customers AS c
INNER JOIN orders AS o
ON c.CustomerID = o.CustomerID;


# list customerId, firstname, order id, quantity. ##include## cust who have not placed any orders
# we have to consider customers, orders tables

SELECT c.CustomerID, c.FirstName, o.OrderID, o.Quantity
FROM customers AS c
LEFT JOIN orders AS o
ON c.CustomerID = o.CustomerID;

# list customerId, firstname, order id, quantity. ##include ALL ORDERS REGARDLESS OF WHETHER THERE IS MATCHING CUSTOMER##
# we have to consider customers, orders tables
SELECT c.CustomerID, c.FirstName, o.OrderID, o.Quantity
FROM customers AS c
RIGHT JOIN orders AS o
ON c.CustomerID = o.CustomerID;

# list customerId, firstname, order id, quantity. ##include EVERYTHING ALL ORDERS ALL CUSTOMERS
# we have to consider customers, orders tables
SELECT c.CustomerID, c.FirstName, o.OrderID, o.Quantity
FROM customers AS c
FULL JOIN orders AS o   #doesnot supported in mysql (supported in microsft sql)
ON c.CustomerID = o.CustomerID;


# FULL join is LEFT+RIGHT
SELECT c.CustomerID, c.FirstName, o.OrderID, o.Quantity
FROM customers AS c
LEFT JOIN orders AS o
ON c.CustomerID = o.CustomerID
UNION
SELECT c.CustomerID, c.FirstName, o.OrderID, o.Quantity
FROM customers AS c
RIGHT JOIN orders AS o
ON c.CustomerID = o.CustomerID;
