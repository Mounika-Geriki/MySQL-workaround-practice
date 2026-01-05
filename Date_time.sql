### date(yyyy-mm-dd) and time(hh-mm-ss)
### TIMESTAMP= DATE+TIME ( Oracle, postgres, Mysql) ; DATETIME2(SQL server)


SELECT OrderID, OrderDate, ShipDate,CreationTime
FROM orders;

## date & time values- 3 diff sources
## 1.date column from a table

SELECT OrderID, CreationTime
FROM orders;
# 2. Hardcoded constant string value
SELECT OrderID, CreationTime, '2025-08-20' Hardcoded
FROM orders;
#3. GETDATE() - VERYIMP- RETURN the current date and time at the moment when the query is executed
## IN MYSQL- NOW() INSTEAD OF GETDATE()
SELECT OrderID, CreationTime, '2025-08-20' Hardcoded, NOW() today
FROM orders;


## EXTRACT THE PART OF DATE
### REPLACE(-) WITH SPACES OR / 
## CALCULATE -ADD , DIFF
## VALIDATE

## DATE AND TIME FUNCTIONS
## 1. PART EXTRACTION- DAY, MONTH, YEAR, DATEPART, DATENAME, DATETRUNC, EOMONTH
## 2. FORMAT AND CASTING- FORMAT, CONVERT, CAST
## 3. CALCULATIONS- DATEADD, DATEDIFF
## 4. VALIDATION - ISDATE  

## DAY(date) - RETURNS DAY FROM A DATE
## MONTH(date) - RETURNS MONTH FROM A DATE
## YEAR(date) - RETURNS YEAR FROM A DATE

SELECT OrderID, CreationTime, YEAR(CreationTime) Year, MONTH(CreationTime) Month, DAY(CreationTime) Day
FROM orders;

## DATEPART(part, date)- RETURN a specific part of date as a number- output is a number(integer)
## ex: week, quarter etc
## DATEPART week - 34
## DATEPART quarter- 3

## DATEPART(part, date) - eg: DATEPART(month, OrderDate) eg: DATEPART(mm,'2025-08-20')
## DATEPART IS NOT PRESENT IN MYSQL
SELECT OrderID, CreationTime,
	   DATEPART(year,CreationTime) year_dp,
       DATEPART(month,CreationTime) month_dp,
       DATEPART(day,CreationTime) day_dp,
	   DATEPART(hour,CreationTime) houe_dp,
       DATEPART(quarter,CreationTime) quarter_dp,
       DATEPART(week,CreationTime) week_dp,
	   YEAR(CreationTime) Year, 
       MONTH(CreationTime) Month, 
       DAY(CreationTime) Day
FROM orders;


##DATENAME - monthname, weekname
# DATENAME(part, date) - output data type is string

SELECT OrderID, CreationTime,
		DATENAME(month, CreationTime) Month_dn,
        DATENAME(weekday, CreationTime) weekday_dn,
        DATENAME(day, CreationTime) day_dn,
        DATENAME(year, CreationTime) year_dn,
	   DATEPART(year,CreationTime) year_dp,
       DATEPART(month,CreationTime) month_dp,
       DATEPART(day,CreationTime) day_dp,
	   DATEPART(hour,CreationTime) houe_dp,
       DATEPART(quarter,CreationTime) quarter_dp,
       DATEPART(week,CreationTime) week_dp,
	   YEAR(CreationTime) Year, 
       MONTH(CreationTime) Month, 
       DAY(CreationTime) Day  
FROM orders;

### DATETRUNC(part, date) - Truncate the date to the specific part -- 
##yyyy-mm-dd hh-mm-ss -
##minutes- (reset the seconds to 00)- minimum is minutes
## hours- reset min and seconds to 00
## day - all the time info is resetted
## month- day - RESET TO 01- TIME IS RESET TO 00
## YEAR- month and day reset to 01- time reset to 00


SELECT OrderID, CreationTime,
-- DATETRUNC
	DATETRUNC(day,CreationTime) day_dt,
    DATETRUNC(month,CreationTime) month_dt,
    DATETRUNC(year,CreationTime) year_dt,
    DATETRUNC(minute,CreationTime) year_dt,
-- DATENAME
		DATENAME(month, CreationTime) Month_dn,
        DATENAME(weekday, CreationTime) weekday_dn,
        DATENAME(day, CreationTime) day_dn,
        DATENAME(year, CreationTime) year_dn,
-- DATEPART
	   DATEPART(year,CreationTime) year_dp,
       DATEPART(month,CreationTime) month_dp,
       DATEPART(day,CreationTime) day_dp,
	   DATEPART(hour,CreationTime) houe_dp,
       DATEPART(quarter,CreationTime) quarter_dp,
       DATEPART(week,CreationTime) week_dp,
	   YEAR(CreationTime) Year, 
       MONTH(CreationTime) Month, 
       DAY(CreationTime) Day  
FROM orders;

-- WHY DATETRUNC IS AMAZING FUNC 
SELECT CreationTime, COUNT(*) 
FROM orders
GROUP BY CreationTime;

SELECT DATETRUNC(month,CreationTime) creation, COUNT(*) 
FROM orders
GROUP BY DATETRUNC(month,CreationTime);
-- highest level of aggregation year
SELECT DATETRUNC(year,CreationTime) creation, COUNT(*) 
FROM orders
GROUP BY DATETRUNC(year,CreationTime);

## EOMONTH(date) - END OF MONTH- RETURNS THE LAST DAY OF THE MONTH
-- SQL SERVER
SELECT OrderID, CreationTime,
	   EOMONTH(CreationTime) EndOfMonth
FROM orders;
-- MYSQL- LAST_DAY(date)
SELECT OrderID, CreationTime,
	   LAST_DAY(CreationTime) EndOfMonth
FROM orders;

-- first and last date of months
SELECT OrderID, CreationTime,
	   EOMONTH(CreationTime) EndOfMonth,
       DATETRUNC(month,CreationTime) StartOfMonth
FROM orders;

-- use cases - part extraction
-- 1. data aggregations & reporting - more details

## example: how many orders were placed each year
-- group our data by year and count the no. of orders
SELECT OrderDate, COUNT(*) NoOfOrders
FROM orders
GROUP BY OrderDate;

-- we have to group by year
SELECT YEAR(OrderDate), COUNT(*) NoOfOrders
FROM orders
GROUP BY YEAR(OrderDate);

 ## example: how many orders were placed each MONTH
 SELECT MONTH(OrderDate), COUNT(*) NoOfOrders
FROM orders
GROUP BY MONTH(OrderDate);
-- FULLNAME OF MONTH
SELECT DATENAME(month,OrderDate) AS Ordedate, COUNT(*) NoOfOrders
FROM orders
GROUP BY DATENAME(month,OrderDate);
-- use cases - part extraction
-- 2. data FILTERING

# show all orders that were placed during the month of february
SELECT * 
FROM orders
WHERE month(OrderDate) = 2;

############ best practice- filtering data using an integer(DATEPART, YEAR, MONTH, DAY) is faster than using string(DATENAME) ###########

-- use cases - part extraction
-- 3. FUNCTIONS COMPARISON
 
-- DAY, MONTH, YEAR, DATEPART    --- O/P DATATYPE - INT
-- 				  DATENAME       --- O/P DATATYPE - STRING
--                   DATETRUNC   --- O/P DATATYPE - DATETIME
--                   EOMONTH     --- O/P DATATYPE - DATE 

-- WHEN TO USE WHAT
-- DAY, MONTH? -> NUMERIC - DAY(), MONTH
-- 	           -> FullName - DATENAME()
-- YEAR        -> YEAR()
-- OTHER PARTS -> DATEPART()

-- PART EXTRACTION ALL PARTS:

