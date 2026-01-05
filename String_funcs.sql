#Functions- builtin SQL code- accepts input value, processs it and return output value
### 2 categories
#1- Single -Row - eg- LOWER()
#2-Multi-Row - eg - SUM()

# Nested Functions- functions inside another function
# eg : LOWER(LEFT('Maria',2)) -> o/p- ma
# eg : LEN(LOWER(LEFT('Maria',2))) -> o/p- 2

# single-Row(Row level calculations)(inorder to manipulate and prep data for multi row) -(data enginners)- string Func, Numeric func, date& Time, Null func
# Multi-Row -( data analyst uses)- Aggregate(basic), window(adv)

### String Functions
# Manipulation- CONCAT, UPPER, LOWER, TRIM, REPLACE
# Calculation- LEN
# String Extraction- LEFT, RIGHT, SUBSTRING

##CONCAT-  combine multiple strings into one value

##example: concatenate first name and country into one column

SELECT FirstName, Country,
		CONCAT(FirstName, ' ', Country) AS name_country
FROM customers;


## UPPER- converts all characters to upper case
## LOWER- converts all characters to lower case

## convert firstname to lower case

SELECT FirstName,
		LOWER(FirstName) AS name,
        UPPER(FirstName) AS up_name
FROM customers;


## TRIM()- Remove leading and trailing spaces
## find the customers whose first name contains leading or trailing spaces
SELECT FirstName
FROM customers
WHERE FirstName != TRIM(FirstName);
-- LEN(Firstname)-- LEN IS NOT PRESENT IN MYSQL- LENGTH()

SELECT FirstName,
		LENGTH(FirstName) len_name,
        LENGTH(TRIM(FirstName)) len_trim_name,
        LENGTH(FirstName)- LENGTH(TRIM(FirstName)) flag
FROM customers
WHERE LENGTH(FirstName) != LENGTH(TRIM(FirstName));

##REPLACE- VERYIMP- Replace specifuc character with a new character
## remove (-) from phone number
SELECT '123-456-7890', REPLACE('123-456-7890', '-', '') AS clean_phone;

## Replace file extension from txt to csv
SELECT 'report.txt', REPLACE('report.txt', '.txt', '.csv') AS new_filename;

##LENGTH-Counts how many characters
## Calculate the length of each customer's firstname

SELECT FirstName,
		LENGTH(FirstName) len_name
FROM customers;


### # String Extraction- LEFT, RIGHT, SUBSTRING

## LEFT- extracts specific number of characters from the start
## RIGHT- extracts specific number of characters from the end

## LEFT(value,no.of characters), RIGHT(value,no.of characters)

##Example: RETRIEVE  the first two characters of each first name
SELECT FirstName,
		LEFT(TRIM(FirstName),2) first_2_char,
        RIGHT(TRIM(FirstName),2) last_2_char
FROM customers;

##SUBSTRING - Extract a part of string at a specified position
#substring(value, start, length)- LENGTH()
##Example: retrieve a list of customers first name removing the first character

SELECT FirstName, 
		SUBSTRING(TRIM(FirstName), 2,LENGTH(FirstName)) AS sub_name
FROM customers;


## Numeric functions
##ROUND(), ABS()

## ROUND(2)- ROUNDS 2 digits
## ROUND 2 -> 3.516  --> (6>5) -> WE GET  3.52
## ROUND 1-> 3.516 --> (1<5) --> 3.5
## ROUND 0 -> 3.516->0TH POSITION-NUMBER 3 -> (5>5) --> 4.00 

SELECT 3.516, ROUND(3.516,2) AS round_2,ROUND(3.516,1) AS round_1,ROUND(3.516,0) AS round_0;

###ABS- RETURNS absolute(positive) value of a nukber, removing any negative sign

SELECT -10, ABS(-10), ABS(10);
