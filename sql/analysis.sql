-- Credit risk and customer payment behavior analysis

USE credit_risk_analysis;

-- 1. Overall customer stats

SELECT
    COUNT(*) AS total_customers
    ROUND(AVG(age), 2) AS average_age,
    ROUND(AVG(credit_limit), 2) AS average_credit_limit
FROM customers;

-- 2. Overall default rate

SELECT
    COUNT(*) AS total_customers
    SUM(default_next_month) AS total_defaults
    ROUND(AVG(default_next_month) * 100, 2) AS default_rate
FROM customers;

-- 3. Default rate by payment status

SELECT  
    pay_0,
    COUNT(*) AS customer_count,
    SUM(default_next_month) AS total_defaults,
    ROUND(AVG(default_next_month) * 100, 2) AS default_rate
FROM customers
GROUP BY pay_0
ORDER BY pay_0;

-- 4. Default rate by payment delay group

SELECT  
    CASE
        WHEN pay_0 <= 0 THEN 'No Delay'
        WHEN pay_0 = 1 THEN '1 Month Delay'
        WHEN pay_0 >= 1 THEN '2+ Month Delay'
    END AS payment_status,
    COUNT(*) AS customer_count,
    SUM(default_next_month) AS total_defaults,
    ROUND(AVG(default_next_month) * 100, 2) AS default_rate
FROM customers
GROUP BY payment_status
ORDER BY default_rate;

-- 5. Default rate by credit util

SELECT
    CASE
        WHEN (bill_amt1 / credit_limit) * 100 < 30 THEN 'Low'
        WHEN (bill_amt1 / credit_limit) * 100 < 60 THEN 'Moderate'
        WHEN (bill_amt1 / credit_limit) * 100 < 100 THEN 'High'
        ELSE 'Over Limit'
    END AS utilization_group,
    COUNT(*) AS customer_count,
    SUM(default_next_month) AS total_defaults,
    round(avg(default_next_month) * 100, 2) AS default_rate
FROM customers
WHERE credit_lmit > 0
GROUP BY utilization_group
ORDER BY default_rate;

-- 6. Default rate by age groups

SELECT 
    CASE
        WHEN age < 25 THEN 'Under 25'
        WHEN age < 35 THEN '25-34'
        WHEN age < 45 THEN '35-44'
        WHEN age < 55 THEN '45-54'
        ELSE '55+'
    END AS age_group,
    COUNT(*) AS customer_count,
    SUM(default_next_month) AS total_defaults,
    ROUND(AVG(default_next_month) * 100, 2) AS default_rate
FROM customers
GROUP BY age_group
ORDER BY age_group;

-- 7. Default rate by education

SELECT
    CASE
        WHEN education = 1 THEN 'Graduate School'
        WHEN education = 2 THEN 'University'
        WHEN education = 3 THEN 'High School'
        WHEN education = 4 THEN 'Other'
        WHEN education IN (5, 6) THEN 'Unknown'
        ELSE 'Unknown'
    END AS education_group,
    COUNT(*) AS customer_count,
    SUM(default_next_month) AS total_defaults,
    ROUND(AVG(default_next_month) * 100, 2) AS default_rate
FROM customers
GROUP BY education_group
ORDER BY default_rate DESC;

-- 8. Default rate by gender

SELECT
    CASE
        WHEN gender = 1 THEN 'Male'
        WHEN gender = 2 THEN 'Female'
        ELSE 'Unknown'
    END AS gender_group,
    COUNT(*) AS customer_count,
    SUM(default_next_month) AS total_defaults,
    ROUND(AVG(default_next_month) * 100, 2) AS default_rate
FROM customers
GROUP BY gender_group
ORDER BY default_rate DESC;

-- 9. Customer risk segmentation

SELECT
    CASE
        WHEN pay_0 >= 2
            OR (bill_amt1 / credit_limit) * 100 >= 100
            THEN 'High Risk'

        WHEN pay_0 >= 1
            OR (bill_amt1 / credit_limit) * 100 >= 30
            THEN 'Moderate Risk'
        
        ELSE 'Low Risk'
    END AS risk_category,
    COUNT(*) AS customer_count,
    SUM(default_next_month) AS total_defaults,
    ROUND(AVG(default_next_month) * 100, 2) AS default_rate
FROM customers
WHERE credit_limit > 0
GROUP BY risk_category
ORDER BY default_rate DESC;