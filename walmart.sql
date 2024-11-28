CREATE DATABASE IF NOT EXISTS walmart;

USE walmart;



select * from  walmart;

--  >>>Time_of_day

SELECT time,
(CASE 
	WHEN `time` BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
	WHEN `time` BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
	ELSE "Evening" 
END) AS time_of_day
FROM walmart;

ALTER TABLE walmart ADD COLUMN time_of_day VARCHAR(20);

SET SQL_SAFE_UPDATES = 0;

UPDATE walmart
SET time_of_day = (
    CASE 
        WHEN `time` BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
        WHEN `time` BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
        ELSE "Evening" 
    END
);

SET SQL_SAFE_UPDATES = 1;  -- Optional: Re-enable safe updates

-- >>>Day_name

SELECT date,
DAYNAME(date) AS day_name
FROM walmart;

ALTER TABLE walmart ADD COLUMN day_name VARCHAR(10);

SET SQL_SAFE_UPDATES = 0;
UPDATE walmart
SET day_name = DAYNAME(date);

-- >>>Month name

SELECT date,
MONTHNAME(date) AS month_name
FROM walmart;

ALTER TABLE walmart ADD COLUMN month_name VARCHAR(10);

SET SQL_SAFE_UPDATES = 0;
UPDATE walmart
SET month_name = MONTHNAME(date);
select * from walmart;

-- ___________________ PERFORMING EDA _____________________
-- ___GENERAL QUESTIONS
-- >>> How many distinct cities are present in the dataset?
SELECT DISTINCT city FROM walmart;

-- >>>In which city is each branch situated?
SELECT DISTINCT branch, city FROM walmart;

-- ___PRODUCT ANALYSIS
-- >>> How many distinct product lines are there in the dataset?
SELECT COUNT(DISTINCT `product line`) 
FROM walmart;

-- >>>What is the most common payment method?
SELECT payment, COUNT(payment) AS common_payment_method 
FROM walmart GROUP BY payment ORDER BY common_payment_method DESC LIMIT 1;

-- >>>What is the most selling product line?
SELECT`product line`, count(`product line`) AS most_selling_product
FROM walmart GROUP BY `product line` ORDER BY most_selling_product DESC LIMIT 1;

-- >>>What is the total revenue by month?
SELECT month_name, round(SUM(total),2) AS total_revenue
FROM walmart GROUP BY month_name ORDER BY total_revenue DESC;

-- >>>Which month recorded the highest Cost of Goods Sold (COGS)?
SELECT month_name, round(SUM(cogs),2) AS total_cogs
FROM walmart GROUP BY month_name ORDER BY total_cogs DESC;

-- >>>.Which product line generated the highest revenue?
SELECT `product line`, round(SUM(total),2) AS total_revenue
FROM walmart GROUP BY `product line` ORDER BY total_revenue DESC LIMIT 1;

-- >>>Which city has the highest revenue?
SELECT city, round(SUM(total),2) AS total_revenue
FROM walmart GROUP BY city ORDER BY total_revenue DESC LIMIT 1;

-- >>> Which product line incurred the highest VAT?
SELECT product_line, SUM(vat) as VAT 
FROM sales GROUP BY product_line ORDER BY VAT DESC LIMIT 1;

-- >>>Which product line incurred the highest VAT?
SELECT product_line, SUM(vat) as VAT 
FROM walmart GROUP BY product_line ORDER BY VAT DESC LIMIT 1;

-- >>>Retrieve each product line and add a column product_category, indicating 'Good' or 'Bad,'
--    based on whether its sales are above the average.

ALTER TABLE walmart ADD COLUMN product_category VARCHAR(20);

UPDATE walmart 
SET product_category = 
(CASE 
    WHEN total >= (SELECT AVG(total) FROM (SELECT total FROM walmart) AS temp) THEN 'Good'
    ELSE 'Bad'
END);

-- >>> Which branch sold more products than average product sold?
SELECT branch, round(SUM(quantity),2) AS quantity
FROM walmart GROUP BY branch HAVING SUM(quantity) > AVG(quantity) ORDER BY quantity DESC LIMIT 1;

-- >>> 11.What is the most common product line by gender?
SELECT gender, `product line`, COUNT(gender) total_count
FROM walmart GROUP BY gender, `product line` ORDER BY total_count DESC;

-- >>> What is the average rating of each product line?
SELECT `product line`, ROUND(AVG(rating),2) average_rating
FROM sales GROUP BY 'product line' ORDER BY average_rating DESC;

-- _____SALES ANALYSIS

-- >>> Number of sales made in each time of the day per weekday
SELECT day_name, time_of_day, COUNT('invoice id') AS total_sales
FROM walmart GROUP BY day_name, time_of_day HAVING day_name NOT IN ('Sunday','Saturday');

SELECT day_name, time_of_day, COUNT(*) AS total_sales
FROM walmart WHERE day_name NOT IN ('Saturday','Sunday') GROUP BY day_name, time_of_day;

-- >>> Identify the customer type that generates the highest revenue.
SELECT `customer type`, round(SUM(total),2) AS total_sales
FROM walmart GROUP BY `customer type` ORDER BY total_sales DESC LIMIT 1;

-- >>> Which city has the largest tax percent/ VAT (Value Added Tax)?
SELECT city, round(SUM(`tax 5%`),2) AS total_VAT
FROM walmart GROUP BY city ORDER BY total_VAT DESC LIMIT 1;

-- >>> Which customer type pays the most in VAT?
SELECT `customer type`,round(SUM(`tax 5%`),2)  AS total_VAT
FROM walmart GROUP BY `customer type` ORDER BY total_VAT DESC LIMIT 1;

-- _____Customer Analysis

-- >>> How many unique customer types does the data have?
SELECT COUNT(DISTINCT `customer type`) FROM walmart;

-- >>> How many unique payment methods does the data have?
SELECT COUNT(DISTINCT payment) FROM walmart;

-- >>> Which is the most common customer type?
SELECT `customer type`, COUNT('customer type') AS common_customer
FROM walmart GROUP BY `customer type` ORDER BY common_customer DESC LIMIT 1;

-- >>> Which customer type buys the most?
SELECT `customer type`, round(SUM(total),2) as total_sales
FROM walmart GROUP BY `customer type` ORDER BY total_sales LIMIT 1;

SELECT `customer type`, COUNT(*) AS most_buyer
FROM walmart GROUP BY `customer type` ORDER BY most_buyer DESC LIMIT 1;

-- >>> What is the gender of most of the customers?
SELECT gender, COUNT(*) AS all_genders 
FROM walmart GROUP BY gender ORDER BY all_genders DESC LIMIT 1;

-- >>> What is the gender distribution per branch?
SELECT branch, gender, COUNT(gender) AS gender_distribution
FROM walmart GROUP BY branch, gender ORDER BY branch;

-- >>> What is the gender distribution per branch?
SELECT branch, gender, COUNT(gender) AS gender_distribution
FROM walmart GROUP BY branch, gender ORDER BY branch;

SELECT branch, 
       gender, 
       COUNT(*) AS count
FROM walmart
GROUP BY branch, gender
ORDER BY branch, gender;

-- >>>  Which day of the week has the best avg ratings?
SELECT day_name, round(AVG(rating),2) AS average_rating
FROM walmart GROUP BY day_name ORDER BY average_rating DESC LIMIT 1;

-- >>> .Which day of the week has the best average ratings per branch?
SELECT  branch, day_name, round(AVG(rating),2) AS average_rating
FROM walmart GROUP BY day_name, branch ORDER BY average_rating DESC LIMIT 1;








