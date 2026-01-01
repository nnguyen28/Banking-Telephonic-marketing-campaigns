
/*

About Dataset

Context
Term deposits are a major source of income for a bank. A term deposit is a cash investment held at a financial institution. 
Your money is invested for an agreed rate of interest over a fixed amount of time, or term. 
The bank has various outreach plans to sell term deposits to their customers such as email marketing, advertisements, telephonic marketing, and digital marketing.

Telephonic marketing campaigns still remain one of the most effective way to reach out to people. 
However, they require huge investment as large call centers are hired to actually execute these campaigns. 
Hence, it is crucial to identify the customers most likely to convert beforehand so that they can be specifically targeted via call.

The data is related to direct marketing campaigns (phone calls) of a Portuguese banking institution. 
The classification goal is to predict if the client will subscribe to a term deposit (variable y).

Citation:
This dataset is publicly available for research. It has been picked up from the UCI Machine Learning with random sampling and a few additional columns.
Please add this citation if you use this dataset for any further analysis.
S. Moro, P. Cortez and P. Rita. A Data-Driven Approach to Predict the Success of Bank Telemarketing. Decision Support Systems, Elsevier, 62:22-31, June 2014

*/


-- creating new database for the project
CREATE DATABASE banking_data;

USE banking_data;

SHOW TABLES;
DESCRIBE banking;
SHOW COLUMNS FROM banking;

SELECT COUNT(*) FROM banking;

SELECT * FROM banking LIMIT 100;

-- 1. What % of clients actually subscribe?
	-- there is about 12% subscribe after the market campaign
SELECT
	y, 
    COUNT(*) AS total_count,
    ROUND(100 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS percent_count
FROM banking
GROUP BY y;

-- 2. Identify which groups have the highest convert/non-convert.
	-- clients with job title as management has the highest rate of conversion
SELECT
	job, y, COUNT(y) AS total_count,
    ROUND(100 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS percent_count
FROM banking
GROUP BY job, y
HAVING y = 'yes'
ORDER BY COUNT(y) DESC, job;

-- 3. Identify the outcome of the campaigns
	-- campaign 1 and 2 has the highest conversion
SELECT 
	campaign, y, COUNT(*) AS cnt
FROM banking
GROUP BY campaign, y
ORDER BY y DESC, cnt DESC;

-- 4. Identify the monthly outcome
SELECT 
	month, y, COUNT(*) AS cnt
FROM banking
GROUP BY month, y
ORDER BY y DESC, cnt DESC;

-- 5. Identify the clients behavior according to their financial situation
SELECT 
	housing, loan, y, 
    COUNT(*) AS cnt
FROM banking
GROUP BY housing, loan, y
ORDER BY y;

-- 6. Identify the avg. calls per conversion
SELECT 
	job,
	ROUND(AVG(campaign), 2) AS avg_calls,
	ROUND(SUM(y = 'yes') / COUNT(*), 2) AS conversion_rate
FROM banking
GROUP BY job
ORDER BY avg_calls;

    