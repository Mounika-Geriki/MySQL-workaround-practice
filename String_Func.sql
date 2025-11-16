## STRING FUNCTIONS
# CONCAT, LOWER, UPPER, TRIM, LENGTH, SUBSTRING
# List all the cust names where the name is a combination of first name and last name

#CONCAT - COMBINES 2 OR MORES STRINGS
SELECT FirstName, LastName
FROM customers;

#Concat
SELECT CONCAT(FirstName,' ', LastName) AS Name
FROM customers;

#LIST all firstnames of all customers  in uppercase

SELECT UPPER(FirstName) AS Upper_FirstName
FROM customers;

SELECT LOWER(FirstName) AS Lower_FirstName
FROM customers;

##### TRIM ####
# __MARIA__.  spaces at the start and end of the name - bad data - remove spaces
SELECT LastName FROM customers;
#LTRIM()
SELECT LTRIM(LastName) FROM customers;
#RTRIM()
SELECT RTRIM(LastName) FROM customers;
#TRIM()
SELECT TRIM(LastName) FROM customers;

##### LENGTH ######
# HOW MANY CHARACTERS
# FIND THE LENGTH OF THE LAST NAME OF ALL CUSTOMERS
SELECT LastName, TRIM(LastName) AS trimmed_lastname,
LENGTH(LastName) AS len_lastname  FROM customers;

######COMBINE TRIM AND LENGTH
SELECT LastName, LENGTH(TRIM(LastName)) AS len_TRIMMEDlastname  FROM customers;

#### SUBSTING ####
## STRATS WITH 1,2,3..... 
### SUBSTRING( Column, Start, Length)
## example: SUBSTRING('Maria', 2, 3).   // output ari

SELECT LastName, SUBSTRING(LastName,2,3) AS substring_lastname  FROM customers;







