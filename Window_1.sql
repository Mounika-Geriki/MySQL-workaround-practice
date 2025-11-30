### ADVANCED SQL 

-- ## WINDOW functions
-- # GROUP BY - few details are lost - i/p 4 rows -> o/p 2 rows
-- # WINDOW- row level calculations - i/p 4 rows -> o/p 4 rows
-- #GROUP BY and WINDOW Aggregate functions- COUNT, SUM, AVG, MIN, MAX
-- # WINDOW has more functions- Rank functions ( ROW_NUMBER, RANK, DENSE_RANK, CUME_DIST, PERCENT_RANK, NTILE)
-- # VALUE(Analytics) functions(LEAD,LAG,FIRST_VALUE,LAST_VALUE)
  
#Why we need WINDOW functions why GROUPBY is not enough?
# task- find the total sales across all orders
SELECT * FROM orders;
SELECT Sales FROM orders;
SELECT SUM(Sales) AS TotalSales FROM orders;  ### no need to group by

# FIND THE TOTAL SALES FOR EACH PRODUCT
SELECT ProductID,SUM(Sales) AS TotalSales 
FROM orders
GROUP BY ProductID; 
# the no of rows in the o/p is defined by the dimension 
 
 
 # FIND THE TOTAL SALES FOR EACH PRODUCT additionally provide details such order id and order date
SELECT OrderID, OrderDate,ProductID,SUM(Sales) AS TotalSales 
FROM orders
GROUP BY ProductID;  
### ERROR SQL WIL NOT ALLOW
###### ALL THE COLUMNS IN SELECT MUST BE INCLUDED IN GROUP BY

SELECT OrderID, OrderDate,ProductID,SUM(Sales) AS TotalSales 
FROM orders
GROUP BY OrderID, OrderDate,ProductID; 
## DATA IS NOT AGGREGATED- TOTAL SALES IS NOT AGGREGATED

######## USING GROUP BY- CANT DO AGGREGATIONS AND PROVIDE DETAILS AT THE SAME TIME #########
#### That is why we USE WINDOW functions

SELECT SUM(Sales) OVER()
FROM orders;    ### prints 760(all sales sum) in each row
#### WINDOW functions returns results for each row - sql shouldnot grp

SELECT SUM(Sales) OVER(PARTITION BY ProductID) TotalSalesByProducts
FROM orders;    ## prints 280,280,... 210, 210,210... 
### PARTITIOB BY - SAME AS GROUP BY
# still we need to add somemore info

SELECT OrderID, OrderDate,ProductID, SUM(Sales) OVER(PARTITION BY ProductID) TotalSalesByProducts
FROM orders; 
### WE have solved the task- we can see  OrderID, OrderDate,ProductID, and TotalSalesByProducts(aggregated by each row)
 

-- ### OVER CLAUSE- TELLS SQL THAT FUNC USED IS A WINDOW FUNCTION
-- ### PARTITION BY - DIVIDES THE DATASET/RESULTS INTO WINDOWS(PARTITIONS)- SIMILAR TO GROUPBY
-- ### OVER()- Calculations is done on entire dataset - entire dataset is considerd as single window
-- ### OVER( PARTITION BY Product) - Calculations is done ***individually*** on each window

-- ## we have 3 fields - Month(Jan, Feb), Product(Bottle, cap, Gloves), Sale(1,20,....)
 SUM(Sales) OVER()    ### entire dataset is a single window)
 
 SUM(Sales) OVER( PARTITION BY Month)  ### consider Jan as 1 window and Feb as 2nd window


##### TASK : Find the total sales across all orders additionally provide details such order id and order date
#### prints 760 in all the rows
SELECT OrderID, OrderDate,SUM(Sales) OVER() TotalSales
FROM orders;

##### TASK : Find the total sales FOR EACH PRODUCT additionally provide details such order id and order date
### prints 280- window1, 210- window2 .....
SELECT OrderID, OrderDate,ProductID, SUM(Sales) OVER(PARTITION BY ProductID) TotalSales
FROM orders;


###### Find the total sales across all orders
####### TASK : Find the total sales FOR EACH PRODUCT additionally provide details such order id and order date

SELECT OrderID, OrderDate,ProductID,
SUM(Sales) OVER() TotalSales,
SUM(Sales) OVER(PARTITION BY ProductID) TotalSalesByProduct
FROM orders;

SELECT OrderID, OrderDate,ProductID, Sales,
SUM(Sales) OVER() TotalSales,
SUM(Sales) OVER(PARTITION BY ProductID) TotalSalesByProduct
FROM orders;

#### TASK2: FIND THE TOTAL SALES FOR EACH COMBINATION OF PRODUCT AND ORDER STATUS
SELECT OrderID, OrderDate,ProductID, OrderStatus, Sales,
SUM(Sales) OVER() TotalSales,
SUM(Sales) OVER(PARTITION BY ProductID) SalesByProduct,
SUM(Sales) OVER(PARTITION BY ProductID, OrderStatus) SalesBYProductAndStatus
FROM orders;

# explanation- product id 101 and delivered as window 1, productid 101 and shipped as window2



##### ORDERBY - SORTS THE DATA WITHIN THE WINDOW ###### 
### default - ASC
## refer Month product sales example from notes
#### TASK: RANK each order based on their sales from highest to lowest additionally provide details such order id and order date

SELECT OrderID, OrderDate,ProductID, OrderStatus, Sales,
RANK() OVER(ORDER BY Sales DESC) Ranksales
FROM orders;

-- ##### WINDOW FRAMES - DEFINES SUBSET OF ROWS WITHIN EACH WINDOW THAT IS RELEVANT FOR THE CALCULATIONS
-- #### FRAME TYPES, FRAME BOUNDARY(LOWER VALUE),FRAME BOUNDARY(HIGHER VALUE)
-- ###*****RULES***** 
-- ###RULE1: Frame clause can ONLY be used together with ORDER BY clause
-- ###RULE2: lower value must be before the higher value

-- #### refer notes for combinations of frames
SELECT OrderID, OrderDate, OrderStatus, Sales,
SUM(Sales) OVER(PARTITION BY OrderStatus ORDER BY OrderDate
                 ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING) Totalsales
FROM orders;
## explanation - 2 windows-delivered, shipped - sorted by order date- starts with row 1 -as current row and 2 following rows 


### SHORT CUT- For only PRECEING, the CURRENT ROW  can be skipped
SELECT OrderID, OrderDate, OrderStatus, Sales,
SUM(Sales) OVER(PARTITION BY OrderStatus ORDER BY OrderDate
                 ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) Totalsales
FROM orders;

## SHORT CUT WITH PRECEDING- For only PRECEING, the CURRENT ROW can be skipped
SELECT OrderID, OrderDate, OrderStatus, Sales,
SUM(Sales) OVER(PARTITION BY OrderStatus ORDER BY OrderDate
                 ROWS  2 PRECEDING) Totalsales
FROM orders;
## SHORT CUT WITH PRECEDING- For only PRECEING, the CURRENT ROW can be skipped
SELECT OrderID, OrderDate, OrderStatus, Sales,
SUM(Sales) OVER(PARTITION BY OrderStatus ORDER BY OrderDate
                 ROWS  UNBOUNDED PRECEDING) Totalsales
FROM orders;

## ERROR 
SELECT OrderID, OrderDate, OrderStatus, Sales,
SUM(Sales) OVER(PARTITION BY OrderStatus ORDER BY OrderDate
                 ROWS  UNBOUNDED FOLLOWING) Totalsales
FROM orders;

####DEFAULT  UNBOUNDED PRECEDING AND CURRENT ROW
SELECT OrderID, OrderDate, OrderStatus, Sales,
SUM(Sales) OVER(PARTITION BY OrderStatus ORDER BY OrderDate
                 ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) Totalsales
FROM orders;

###SHORTCUT
SELECT OrderID, OrderDate, OrderStatus, Sales,
SUM(Sales) OVER(PARTITION BY OrderStatus ORDER BY OrderDate
                 ROWS UNBOUNDED PRECEDING ) Totalsales
FROM orders;

###DEFAULT- HIDDEN
###SHORTCUT
SELECT OrderID, OrderDate, OrderStatus, Sales,
SUM(Sales) OVER(PARTITION BY OrderStatus ORDER BY OrderDate) Totalsales
FROM orders;

## REMOVE ORDER BY
SELECT OrderID, OrderDate, OrderStatus, Sales,
SUM(Sales) OVER(PARTITION BY OrderStatus) Totalsales
FROM orders;


### RULES IN WINDOW FUNCTIONS

### 1. WINDOW FUNC can be used ONLY in SELECT AND ORDERBY clauses
SELECT OrderID, OrderDate, OrderStatus, Sales,
SUM(Sales) OVER(PARTITION BY OrderStatus) Totalsales
FROM orders
ORDER BY SUM(Sales) OVER(PARTITION BY OrderStatus) DESC ;

### 1.1 WINDOW Func cannot be used to filter Data
## ERROR
SELECT OrderID, OrderDate, OrderStatus, Sales,
SUM(Sales) OVER(PARTITION BY OrderStatus) Totalsales
FROM orders
WHERE SUM(Sales) OVER(PARTITION BY OrderStatus) > 100;

##ERROR
SELECT OrderID, OrderDate, OrderStatus, Sales,
SUM(Sales) OVER(PARTITION BY OrderStatus) Totalsales
FROM orders
GROUP BY SUM(Sales) OVER(PARTITION BY OrderStatus);

### RULE 2: Nesting WINDOW funct is not allowed!!!!!
## error
SELECT OrderID, OrderDate, OrderStatus, Sales,
SUM(SUM(Sales) OVER(PARTITION BY OrderStatus)) OVER(PARTITION BY OrderStatus) Totalsales
FROM orders;



###RULE 3: SQL EXecute WINDOW func after WHERE Clause
### task : FIND THE TOTAL SALES FOR EACH ORDER STATUS, ONLY FOR PRODUCTS 101 AND 102
SELECT OrderID, OrderDate, OrderStatus, Sales,
SUM(Sales) OVER(PARTITION BY OrderStatus) Totalsales
FROM orders
WHERE ProductID IN (101,102);

## RULE 4 : Window func can be used together with GROUPBY in the same query, ONLY if the same columns are used
### task: RANK THE CUSTOMERS BASED ON THEIR TOTAL SALES
### 2 TASKS - AGGREGATION - SUM AND RANK
## STEP1: ADD GROUP BY TO THE QUERY
SELECT CustomerID,
SUM(Sales) Totalsales,
RANK() OVER(ORDER BY SUM(Sales) DESC) RankCustomers
FROM orders
GROUP BY CustomerID;

##error- bcz sales is not part of group by use SUM(Sales)
SELECT CustomerID,
SUM(Sales) Totalsales,
RANK() OVER(ORDER BY Sales DESC) RankCustomers
FROM orders
GROUP BY CustomerID;

##no error
SELECT CustomerID,
SUM(Sales) Totalsales,
RANK() OVER(ORDER BY CustomerID DESC) RankCustomers
FROM orders
GROUP BY CustomerID;

