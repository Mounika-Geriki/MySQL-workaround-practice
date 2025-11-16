#Aggregate functions - on rows
#COUNT,MIN, MAX,SUM, AVG
# how each function deals with NULL

#######COUNT#######
##NULLS ARE IGNORED
# Find total number of customers
# if no name is given it takes count(*) to display output
SELECT COUNT(*) FROM customers;
# if name is mentiones as alias total_cust is printed
SELECT COUNT(*) AS total_cust FROM customers;

#if there are any NULL values
#prints 5
SELECT COUNT(CustomerID) AS total_cust
FROM customers;

#prints 4
# NULLS are not counted
#ignores NULL
SELECT COUNT(Score) AS total_cust
FROM customers;


######.  SUM.  ############
# find total quantity of all orders
#NULLS ARE TREATED AS ZEROS
SELECT SUM(Quantity)
FROM orders;

SELECT SUM(Quantity) AS Quantitty_sum
FROM orders;

######. AVG.  ############
# NULLS ARE IGNORED
#FIND AVG SCORES OF ALL CUSTOMERS
SELECT AVG(Score) as avg_scores
FROM customers;


###### MIN, MAX #######
# latest date oldest date
# max score, min 
# NULLS ARE IGNORED
# EXAMPLES: LATEST DATE, OLDEST DATE, MAX SCORE, MIN SCORE

#FIND THE HIGHEST SCORE OF ALL CUSTOMERS
#PRINTS 900
SELECT MAX(Score) max_score
FROM customers;

#PRINTS 350 #### not  NULL#####
SELECT MIN(Score) max_score
FROM customers;
SELECT * FROM orders;
# Find Earliest and latest dates
# 2025-01-01 old one
SELECT MIN(OrderDate) AS min_order_date
FROM orders;

#2025-03-15 recent one
SELECT MAX(OrderDate) AS max_order_date
FROM orders;


