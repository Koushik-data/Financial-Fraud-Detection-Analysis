CREATE TABLE transactions_raw (
    "Transaction_ID" TEXT,
    "User_ID" TEXT,
    "Transaction_Amount" FLOAT,
    "Timestamp" TIMESTAMP,
	"Transaction_Type" TEXT,
    "Location" TEXT,
    "Fraud_Label" INT
);

COPY transactions_raw
FROM 'D:\synthetic_fraud_dataset.csv'
DELIMITER ','
CSV HEADER;


CREATE TABLE transactions (
    transaction_id INT,
    user_id INT,
    amount FLOAT,
    transaction_time TIMESTAMP,
    location TEXT,
    transaction_type TEXT,
    is_fraud INT
);

INSERT INTO transactions (
    transaction_id,
    user_id,
    amount,
    transaction_time,
    location,
    transaction_type,
    is_fraud
)
SELECT 
    "Transaction_ID",
    "User_ID",
    "Transaction_Amount",
    "Timestamp",
    "Location",
    "Transaction_Type",
    "Fraud_Label"
FROM transactions_raw;


SELECT* FROM  transactions
LIMIT 10;

--DATA CLEANING

--checking null values
SELECT 
COUNT(*) FILTER (WHERE transaction_id IS NULL) AS null_transaction_id,
COUNT(*) FILTER (WHERE user_id IS NULL) AS null_user_id,
COUNT(*) FILTER (WHERE amount IS NULL) AS null_amount,
COUNT(*) FILTER (WHERE transaction_time IS NULL) AS null_time,
COUNT(*) FILTER (WHERE location IS NULL) AS null_location,
COUNT(*) FILTER (WHERE transaction_type IS NULL) AS null_type,
COUNT(*) FILTER (WHERE is_fraud IS NULL) AS null_fraud
FROM transactions;

--removing null values
DELETE FROM transactions
WHERE transaction_id IS NULL 
   OR user_id IS NULL
   OR amount IS NULL
   OR transaction_time IS NULL;

--fill values
UPDATE transactions
SET location = 'Unknown'
WHERE location IS NULL;

--checking duplicates
SELECT transaction_id, COUNT(*)
FROM transactions
GROUP BY transaction_id
HAVING COUNT(*) > 1;

--removing duplicates
DELETE FROM transactions
WHERE ctid IN (
    SELECT ctid FROM (
        SELECT ctid,
               ROW_NUMBER() OVER (PARTITION BY transaction_id ORDER BY ctid) AS rn
        FROM transactions
    ) 
    WHERE rn > 1
);

--Negative or zero amount
SELECT * FROM transactions WHERE amount <= 0;

--Removing Negative or zero amount
DELETE FROM transactions WHERE amount <= 0;

--Invalid fraud values
SELECT DISTINCT is_fraud FROM transactions;

--Fixing case of location
UPDATE transactions
SET location = INITCAP(TRIM(location));

--Fixing case of transaction type
UPDATE transactions
SET transaction_type = UPPER(TRIM(transaction_type));

--Check outliers 
SELECT MIN(amount), MAX(amount), AVG(amount)
FROM transactions;

--DATA MANIPULATION

--KPIs 
--Fraud rate%
SELECT 
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS fraud_transactions,
    ROUND(SUM(is_fraud)*100.0 / COUNT(*)::numeric,2) AS fraud_rate_pct
FROM transactions;

--Total Fraud amount
SELECT 
    SUM(amount) FILTER (WHERE is_fraud = 1) AS total_fraud_amount
FROM transactions;

--Average Fraud amount
SELECT 
    ROUND(AVG(amount) FILTER (WHERE is_fraud = 1)::numeric,2) AS avg_fraud_amount
FROM transactions;

--Fraud rate by transaction type
SELECT 
    transaction_type,
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS fraud_transactions,
    ROUND(SUM(is_fraud)*100.0/COUNT(*)::numeric,2) AS fraud_rate
FROM transactions
GROUP BY transaction_type
ORDER BY fraud_rate DESC;

--Fraud rate by hour
SELECT 
    EXTRACT(HOUR FROM transaction_time) AS hour,
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS fraud_transactions,
    ROUND(SUM(is_fraud)*100.0/COUNT(*)::numeric,2) AS fraud_rate
FROM transactions
GROUP BY hour
ORDER BY fraud_rate DESC;


--Fraud by location %
SELECT 
    location,
    SUM(is_fraud) AS fraud_cases,
    ROUND(SUM(is_fraud)*100.0 / SUM(SUM(is_fraud)) OVER(),2) AS contribution_pct
FROM transactions
GROUP BY location
ORDER BY fraud_cases DESC;


--High risk users
SELECT 
    user_id,
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS fraud_transactions,
    ROUND(SUM(is_fraud)*100.0/COUNT(*),2) AS fraud_rate
FROM transactions
GROUP BY user_id
HAVING SUM(is_fraud) > 0
ORDER BY fraud_transactions DESC
LIMIT 20;

--Transaction velocity
SELECT 
    user_id,
    DATE(transaction_time) AS transaction_date,
    COUNT(*) AS transaction_count,
    SUM(is_fraud) AS fraud_transactions
FROM transactions
GROUP BY user_id, transaction_date
HAVING COUNT(*) > 10
ORDER BY transaction_count DESC;

--High value Fraud Rate
SELECT 
    CASE 
        WHEN amount < 1000 THEN 'Low'
        WHEN amount BETWEEN 1000 AND 50000 THEN 'Medium'
        ELSE 'High'
    END AS amount_segment,
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS fraud_transactions,
    ROUND(SUM(is_fraud)*100.0/COUNT(*)::numeric,2) AS fraud_rate
FROM transactions
GROUP BY amount_segment
ORDER BY fraud_rate DESC;

--Trend in Fraud
SELECT 
    DATE(transaction_time) AS date,
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS fraud_cases
FROM transactions
GROUP BY date
ORDER BY date;

--Fraud during Day vs Night 
SELECT 
    CASE 
        WHEN EXTRACT(HOUR FROM transaction_time) < 6 THEN 'Night'
        ELSE 'Day'
    END AS time_period,
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS fraud_transactions,
    ROUND(SUM(is_fraud)*100.0/COUNT(*)::numeric,2) AS fraud_rate
FROM transactions
GROUP BY time_period;


--Pareto analysis
SELECT 
    location,
    SUM(is_fraud) AS fraud_cases,
    SUM(SUM(is_fraud)) OVER (ORDER BY SUM(is_fraud) DESC) AS cumulative_fraud
FROM transactions
GROUP BY location;


