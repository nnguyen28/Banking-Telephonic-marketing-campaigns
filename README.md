# Banking Marketing Campaign Analysis (MySQL)

About Dataset:
- The data is related to direct marketing campaigns (phone calls) of a Portuguese banking institution. The classification goal is to predict if the client will subscribe to a term deposit (variable y).

Project Overview
This project analyzes direct marketing campaign data from a Portuguese banking institution to understand what drives client subscription to a term deposit product. Using MySQL, the analysis focuses on customer demographics, financial status, campaign behavior, and timing to identify patterns that improve campaign efficiency and conversion rates.

Business Objective:

  - Predict whether a client will subscribe to a term deposit (y = yes / no)
  
  - Identify high-conversion customer segments
  
  - Detect diminishing returns from repeated contact attempts
  
  - Provide actionable insights to optimize future marketing campaigns

🛠️ Tools & Skills Used:

  - MySQL
  
  - Aggregations (COUNT, SUM, AVG)
  
  - GROUP BY, HAVING
  
  - CASE statements
  
  - Window functions
  
  - Query optimization and indexing
  
  - Business-oriented analytical reasoning

🔍 Key Analytical Questions:

  1. What percentage of clients subscribe to the term deposit?
  
  2. Which customer groups have the highest and lowest conversion rates?
  
  3. How does the number of campaign contacts affect conversion?
  
  4. Are there seasonal patterns in campaign success?
  
  5. How do financial obligations (loans) impact client behavior?
  
  6. Which segments require the most calls per successful conversion?

📈 Key Insights:

 - Overall conversion rate is approximately 12%, indicating that broad, untargeted outreach is inefficient.
  
 - Clients in management-related roles exhibit the highest likelihood of subscribing.

 - Early contact attempts (1–2 calls) generate the highest conversions, with diminishing returns after multiple calls.
  
 - Campaign performance varies by month, suggesting that timing has a material impact on outcomes.
  
 - Clients without housing or personal loans are more likely to subscribe, while financially burdened clients convert less.
  
 - Call efficiency differs significantly by occupation, with some segments requiring more calls per conversion, reducing overall ROI.

📂 Example SQL Queries:

1. What % of clients actually subscribe?
	 - there is about 12% subscribe after the market campaign

SELECT
  y,
  COUNT(*) AS total_count,
  ROUND(100 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS percent_count
FROM banking
GROUP BY y;

2. Identify which groups have the highest convert/non-convert.
	 - clients with job title as management has the highest rate of conversion

SELECT
  job, 
  y, 
  COUNT(y) AS total_count,
  ROUND(100 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS percent_count
FROM banking
GROUP BY job, y
HAVING y = 'yes'
ORDER BY COUNT(y) DESC, job;


👤 Author
NGUYEN NGUYEN
SQL / Data Analytics Portfolio Project
