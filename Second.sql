SELECT * FROM customers
WHERE country = 'Germany' AND score < 400;

SELECT * FROM customers
WHERE country = 'Germany' OR score < 400;

SELECT * FROM customers
WHERE NOT score < 400;

SELECT * FROM customers
WHERE score BETWEEN 100 AND 500;

SELECT * FROM customers
WHERE score >= 100 AND score <= 500;

SELECT * FROM customers
WHERE CustomerID IN (1,2,5);

SELECT * FROM customers
WHERE CustomerID = 1
OR CustomerID = 2
OR CustomerID = 5;

# LIKE OPERATOR
SELECT * FROM customers
WHERE FirstName LIKE 'M%' ;