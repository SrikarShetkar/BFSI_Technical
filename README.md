# Banking Transaction Analysis

## Overview
This project is a SQL-based banking transaction analysis system designed to store customer and transaction data, and perform common analytical queries using SQL.

It includes:
- Customer table creation
- Transaction table creation
- Sample data insertion
- Analytical SQL queries for reporting and insights

## Objectives
The main objectives of this project are:
- To manage customer banking details
- To record transaction history
- To analyze transaction patterns
- To practice SQL queries using `JOIN`, `GROUP BY`, `HAVING`, `LIKE`, `DISTINCT`, and window functions

## Database Tables

### 1. customers
Stores customer information such as:
- customer ID
- name
- email
- city
- account type
- account balance

### 2. transactions
Stores transaction details such as:
- transaction ID
- customer ID
- amount
- transaction type
- transaction mode
- transaction date

## Features
- Insert customer and transaction records
- Display customers with high balances
- Sort transactions by date
- Find unique transaction modes
- Retrieve top transactions by amount
- Search customers by name pattern
- Calculate total transaction amount per customer
- Filter customers by total transaction amount
- Use joins to combine customer and transaction data
- Compute running totals using window functions
- Rank customers by account balance
- Compare customer average transaction amount with overall average

## SQL Concepts Used
- `CREATE TABLE`
- `INSERT INTO`
- `SELECT`
- `WHERE`
- `ORDER BY`
- `DISTINCT`
- `LIMIT`
- `LIKE`
- `JOIN`
- `GROUP BY`
- `HAVING`
- `SUM()`
- `AVG()`
- `DENSE_RANK() OVER()`
- `SUM() OVER()`

## Sample Queries Included
Some of the queries covered in this project are:
1. Fetch customers whose account balance is greater than 1500
2. Display transactions in descending order of date
3. Get unique transaction modes
4. Fetch top 5 highest transactions
5. Find customers whose name starts with `A`
6. Calculate total transaction amount per customer
7. Find customers with total transaction amount greater than 2000
8. Show customer name with transaction amount and type
9. Display running total of transactions per customer
10. Rank customers based on account balance
11. Find customers whose average transaction amount is greater than the overall average

## How to Run
1. Open your SQL client or database tool.
2. Create a new database.
3. Run the SQL file containing:
   - table creation queries
   - insert queries
   - analytical queries
4. Execute each query to view the results.

## Expected Output
The output will show:
- Customer records
- Transaction records
- Filtered results based on conditions
- Aggregated reports
- Ranked customer data
- Running totals and averages

## File Structure
```bash
banking-transaction-analysis/
│
├── banking_transaction_analysis.sql
└── README.md
