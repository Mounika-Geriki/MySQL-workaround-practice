### GROUP BY #######
### find the total no of customers for each country
SELECT COUNT(*) AS total_cust, country
FROM customers
GROUP BY country;

### find the total no of customers for each country and sort the resuly by total(lowest  first)
SELECT COUNT(*) AS total_cust, country
FROM customers
GROUP BY country
ORDER BY total_cust ASC;

### find the highest score of customers for each country
SELECT MAX(Score) AS max_score, country
FROM customers
GROUP BY country;

#### find the total no of customers for each country and only include countries that have more than 2 customers
SELECT COUNT(*) AS total_cust, country
FROM customers
GROUP BY country
HAVING total_cust >2;

## HAVING - can be used with only GROUP BY

## USING WHERE 
SELECT COUNT(*) AS total_cust, country
FROM customers
WHERE country !='USA'
GROUP BY country
HAVING total_cust >1;
###  WHERE - IS USED BEFORE GROUP BY









