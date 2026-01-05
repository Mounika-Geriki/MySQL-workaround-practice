### DATE FORMAT
## DATETIME2    - (YYYY-MM-dd HH:mm:ss) - (MM-month, mm- min)- 
# INternational -  YYYY-MM-dd. - sql server
## USA STANDARD -  MM-dd- yyyy
## European     -   dd-MM-yyyy

## fprmatting and casting
## FORMATTING- Changing the format of a value from one to another. changing how the data looks like

-- with Date
## FORMAT()- (MM/dd/yy -> 08/20/25) 
-- 			 (MMM yyyy - Aug 2025)
## CONVERT() - (6-> 20 AUG 25) 
-- 			   (112-> 20250820)

-- with Number

## FORMAT() - (N-> 1,234,567.89) 
--  		  (C-> $1,234,567.89)
--            (P-> 1,234,567.89%)


### CASTING- CHANGING THE DATA TYPE FROM ONE TO ANOTHER
## STRING TO INT
## DATE TO STRING AND VICE VERSA

## CAST()
## CONVERT()


## FROMAT(value, format [, culture])- third param is optional - culture - show specific to region - en, us
## value- date, num

-- FROMAT(OrderDate, 'dd/MM/yyyy')
-- FROMAT(OrderDate, 'dd/MM/yyyy', 'ja-JP')

--  FORMAT(1234.56, 'D', 'fr-FR')


SELECT OrderID, CreationTime,
		FORMAT(CreationTime, 'MM-dd-yyyy') USA_Format,
        FORMAT(CreationTime, 'dd-MM-yyyy') EU_Format,
		FORMAT(CreationTime, 'dd') dd, -- shows date(numbers)
        FORMAT(CreationTime, 'ddd') ddd,   -- shows days(sun, mon etc)
        FORMAT(CreationTime, 'dddd') dddd ,
        FORMAT(CreationTime, 'MM') MM ,
        FORMAT(CreationTime, 'MMM') MMM,
        FORMAT(CreationTime, 'MMMM') MMMM 
FROM orders;

-- IN MYSQL - DATE_FORMAT()
-- MYSQL EQUIVALENT
SELECT
    OrderID,
    CreationTime,
	DATE_FORMAT(CreationTime, '%m-%d-%Y') AS USA_Format, 
    DATE_FORMAT(CreationTime, '%d-%m-%Y') AS EU_Format,

    DATE_FORMAT(CreationTime, '%d') AS dd,      -- day (01–31)
    DATE_FORMAT(CreationTime, '%a') AS ddd,     -- Wed
    DATE_FORMAT(CreationTime, '%W') AS dddd,    -- Wednesday

    DATE_FORMAT(CreationTime, '%m') AS MM,      -- 01–12
    DATE_FORMAT(CreationTime, '%b') AS MMM,     -- Jan
    DATE_FORMAT(CreationTime, '%M') AS MMMM     -- January

FROM orders;


## SHOW CREATION TIME USING THE FOLLOWING FORMAT
-- Day Wed Jan Q1 2025 12:34:56 PM
SELECT OrderID, CreationTime,
		'Day '+ FORMAT(CreationTime, 'ddd MMM')+ ' Q' + DATENAME(quarter, CreationTime)+ ''+ 
        FORMAT(CreationTime, 'yyyy hh:mm:ss tt')AS CustomFormat
FROM orders;

SELECT OrderID,CreationTime,
    CONCAT('Day ',DATE_FORMAT(CreationTime, '%a %b'),' Q',QUARTER(CreationTime),
        ' ',DATE_FORMAT(CreationTime, '%Y %h:%i:%s %p')
    ) AS CustomFormat
FROM orders;

## FORMATTING USE CASE
## DATA AGGREGATION- MORE CUSTOMIZATIONS

SELECT OrderDate, Count(*)
FROM orders
GROUP BY OrderDate;

SELECT FORMAT(OrderDate, 'MMM yy') OrderDate, Count(*)
FROM orders
GROUP BY OrderDate;

SELECT DATE_FORMAT(OrderDate, '%b %y') OrderDate, Count(*)
FROM orders
GROUP BY OrderDate;


## FORMATTING USE CASE
## DATA standardizations
## data from diff storages( csv, api, database) - format it to standard format before analysis


## CONVERT() - CONVERTS A DATE OR TIME VALUE TO A DIFFERENT DATA TYPE & FORMATS THE values
## CONVERT( data_type, value [,style])