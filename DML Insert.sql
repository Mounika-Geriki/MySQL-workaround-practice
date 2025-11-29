# DATA MANIPULATION LANGUAGE - INSERT, DELETE, UPDATDE
# UNDERSTAND THE STRUCTURE OF TABLE
#STEP 1
DESCRIBE customers;
DESCRIBE orders;
DESCRIBE employees;

INSERT INTO customers
VALUE (DEFAULT, 'Anna', 'Nixon', 'UK', NULL);
#VALUE (6, 'Anna', 'Nixon', 'UK', NULL);

SELECT * FROM customers;

#DELETE ROW FROM customers
DELETE FROM customers
WHERE CustomerID = 6;

#second method to delete rows in customers
SET SQL_SAFE_UPDATES = 0;

DELETE FROM customers

#WHERE CustomerID =6;
WHERE CustomerID IS NULL;

SET SQL_SAFE_UPDATES = 1;

#add another row 
INSERT INTO customers
VALUES(DEFAULT, 'Max', 'Lang', NULL, NULL);

#specify the fields that we are adding
INSERT INTO customers
(FirstName, LastName)
VALUES('Max', 'Lang');


######. UPDATE   ######

UPDATE customers
SET country = 'Germany'  ## it updates all the values , we should include a where condition
WHERE CustomerID = 7;

# change the score of cust Anna to 100 and change her country from UK to USA
UPDATE customers
SET country = 'USA', score = 100
WHERE CustomerID = 6;


##### DELETE/ TRUNCATE ######
# DELETE - TAKES LONGER TIME TO DELETE THE ENTIRE RECORDS IN TABLE

DELETE FROM customers      # delete all the data from customers, should include WHERE
WHERE CustomerID IN (6,7);

# TRUNCATE - USE THIS TO DELETE BIG DATA
TRUNCATE customers;

