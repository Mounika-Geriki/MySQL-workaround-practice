#UNIONS
# list Firstname, lastname and country of all persons from customers and employees
# we have to consider customers, orders tables
# UNION- REMOVES DUPLICATES- UNIQUE LIST
#FIRST TABLE CONTROLS THE COLOUMN NAMES

SELECT FirstName, LastName, CustomerID
FROM customers
UNION 
SELECT FirstName, LastName, EmployeeID
FROM employees;

SELECT * FROM employees;
SELECT * FROM customers;

#UNION ALL - PRINTS EVERYTHING
#FIRST TABLE CONTROLS THE COLOUMN NAMES
SELECT FirstName, LastName, CustomerID
FROM customers
UNION ALL 
SELECT FirstName, LastName, EmployeeID
FROM employees;

#FIRST TABLE CONTROLS THE COLOUMN NAMES
#example to show how this works
# fn, LastName, CustomerID fields gets printed
SELECT FirstName AS fn, LastName, CustomerID
FROM customers
UNION ALL 
SELECT FirstName, LastName AS l, EmployeeID
FROM employees;

#change order of fileds 
#  LastName, FirstName from employees table
# it checks the data types
#order of the fileds should be considered while using joins/unions
SELECT FirstName AS fn, LastName, CustomerID
FROM customers
UNION ALL 
SELECT LastName, FirstName AS l, EmployeeID
FROM employees;

#diff num of columns in each table
#GIVES ERROR
SELECT FirstName AS fn, LastName, CustomerID
FROM customers
UNION ALL 
SELECT LastName, FirstName AS l, EmployeeID, salary
FROM employees;
