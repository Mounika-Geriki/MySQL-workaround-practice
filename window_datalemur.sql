### datalemur amazon question

SELECT category, product, 
COUNT(*) OVER () AS row_count,
COUNT(*) OVER(PARTITION BY category) AS category_count,
COUNT(*) OVER(PARTITION BY category, product) AS product_count
FROM product_spend;

# SUM(): Calculating Running Sum Within a Window

SELECT user_id, category, product, transaction_date, spend,
SUM(spend) OVER(PARTITION BY user_id ORDER BY transaction_date) AS cumulative_spend
FROM product_spend;


-- First window for user 101:

-- In the first row, the spend is $7.99. Therefore, the cumulative spending remains $7.99.
-- Moving on to the next row, the cumulative spend becomes $7.99 + $34.49 = $42.48. And then, with the subsequent row, it becomes $7.99 + $34.49 + $64.95= $107.43.
-- Second window for user 123:

-- Here's where the scenario is slightly different. The cumulative spend becomes $219.80 + $299.99 = $519.79, as both products were purchased at the same time.
-- As we progress to the next row, the cumulative spending continues to accumulate: $219.80 + $299.99 + $220.00 = $739.79.

## AVG(): Calculate Rolling Averages Within a Window
SELECT user_id, category, product, transaction_date, spend,
ROUND(AVG(spend) OVER(PARTITION BY user_id ORDER BY transaction_date), 2) AS rolling_avg_spend
FROM product_spend;

-- First window for user 101:

-- In the first row, the spend is $7.99. Therefore, the rolling average spend remains $7.99.
-- In the next row, the rolling average becomes ($7.99 + $34.49)/2 = $21.24. And then, in the following row, it becomes ($7.99 + $34.49 + $64.95)/3 = $35.81.
-- Second window for user 123:

-- This is slightly different. The rolling average becomes ($219.80 + $299.99)/2 = $259.90, as both products were purchased at the same time.
-- As we progress to the next row, the rolling average continues to accumulate: ($219.80 + $299.99 + $220.00)/3 = $739.79.


### STEP 1:
SELECT user_id,tweet_date,
AVG(tweet_count) OVER (PARTITION BY user_id ORDER BY tweet_date) AS rolling_avg_3d 
FROM tweets;

#STEP2:
SELECT user_id,tweet_date,tweet_count,
AVG(tweet_count) OVER (PARTITION BY user_id ORDER BY tweet_date
					   ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS rolling_avg
FROM tweets;

## STEP 3:
SELECT user_id,tweet_date,   
ROUND(AVG(tweet_count) OVER (PARTITION BY user_id ORDER BY tweet_date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW),2) AS rolling_avg_3d
FROM tweets;

# MIN(): Returns the Lowest Value Within a Window
SELECT category, product,spend,
MIN(spend) OVER(PARTITION BY product) AS min_product_spend
FROM product_spend;


# MAX(): Returns the Highest Value Within a Window
SELECT category, product,spend,
Max(spend) OVER(PARTITION BY product) AS max_product_spend
FROM product_spend;

### FIRST_VALUE() and LAST_VALUE(): Returns First and Last Values
SELECT category, product, user_id, spend, transaction_date,
  FIRST_VALUE(product) OVER (ORDER BY transaction_date) AS first_purchase,
  LAST_VALUE(product) OVER (ORDER BY transaction_date) AS last_purchase
FROM product_spend;

## it prints first value refrigerator as first and microwve as last
#using partition by
SELECT category, product, user_id, spend, transaction_date,
  FIRST_VALUE(product) OVER (PARTITION BY user_id ORDER BY transaction_date) AS first_user_purchase,
  LAST_VALUE(product) OVER (PARTITION BY user_id ORDER BY transaction_date) AS last_user_purchase
FROM product_spend;

