# Credit Risk and Customer Payment Behavior Analysis
## Project Overview

This project analyzes credit card customer payment behavior and default risk using SQL and Power BI.

The goal of the analysis was to identify patterns associated with credit card default and create a rule-based customer risk segmentation.

The project uses a dataset of 30,000 credit card customers and focuses on specific categories: payment history, credit utilization, age, education, and gender.

## Tools Used

- MySQL
- SQL
- Power BI
- Git and GitHub

## Business Questions

The analysis focused on the following questions:

1. What is the overall credit card default rate?
2. How does payment history relate to default?
3. How does default rate change based on credit utilization?
4. How does default rate vary across age groups?
5. How do education and gender relate to default rates?
6. Which types of customers fall into higher-risk categories?

## Dataset

The dataset used for this project is the **Default of Credit Card Clients** dataset from the UCI Machine Learning Repository.

The dataset contains 30,000 anonymous credit card customer records from Taiwan, and originally includes information about:

- Credit limit
- Demographic information
- Payment history
- Bill amounts
- Previous payment amounts
- Whether the customer defaulted on their payment the following month or not

## SQL Was Used For:

- Creating the MySQL database and customer table
- Importing and analyzing the customer data
- Calculating the overall default rate
- Analyzing default rates by payment status
- Grouping customers by payment delay
- Calculating credit utilization
- Analyzing default rates by age group
- Comparing default rates by education and gender
- Creating a customer risk segmentation

## Key Findings

The overall default rate in the dataset is **22.12%**.

### Payment Behavior

Payment history showed the strongest relationship with observed default rates in the analysis:

Customers with no payment delay had a default rate of **13.83%**.

Customers with a 1-month payment delay had a default rate of **33.95%**.

Customers with a 2+ month payment delay had a default rate of **69.55%**.

### Credit Utilization

Default rates increased as credit utilization increased. 
Low utilization -> 18.31% default rate
Moderate utilization -> 23.19% default rate
High utilization -> 26.10% default rate
Over limit utilization -> 30.05% default rate

### Risk Segmentation

A simple rule-based risk segmentation was created using payment delay and credit utilization. 

The High Risk group had a substantially higher observed default rate than the Low Risk group. 

## Power BI Dashboard

The Power BI dashboard provides an interactive view of the analysis, including:

- Total customer count
- Overall default rate
- Average credit limit
- Default rate by risk category
- Default rate by credit utilization
- Default rate by age group
- Filters for risk category, age group, and payment status