-- BANKING TRANSACTION ANALYSIS
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    city VARCHAR(100),
    account_type VARCHAR(20) CHECK (account_type IN ('Savings', 'Current')),
    account_balance DECIMAL(15, 2) DEFAULT 0.00
);

CREATE TABLE transactions (
    transaction_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    amount DECIMAL(15, 2) NOT NULL,
    transaction_type VARCHAR(50), -- e.g., Deposit, Withdrawal
    transaction_mode VARCHAR(50), -- e.g., Online, ATM, Branch
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT fk_customer 
        FOREIGN KEY(customer_id) 
        REFERENCES customers(customer_id) 
        ON DELETE CASCADE
);

INSERT INTO customers (name, email, city, account_type, account_balance) VALUES
('Alice', 'alice@gmail.com', 'Hyderabad', 'Savings', 2500.00),
('Bob', 'bob@gmail.com', 'Delhi', 'Current', 1200.00),
('Charlie', 'charlie@gmail.com', 'Mumbai', 'Savings', 3000.00),
('David', 'david@gmail.com', 'Chennai', 'Current', 1800.00),
('Anjali', 'anjali@gmail.com', 'Bangalore', 'Savings', 4000.00),
('Arjun', 'arjun@gmail.com', 'Hyderabad', 'Current', 2200.00),
('Meena', 'meena@gmail.com', 'Delhi', 'Savings', 900.00),
('Rahul', 'rahul@gmail.com', 'Mumbai', 'Current', 3500.00),
('Sneha', 'sneha@gmail.com', 'Chennai', 'Savings', 2700.00),
('Kiran', 'kiran@gmail.com', 'Bangalore', 'Current', 1500.00);

INSERT INTO transactions (customer_id, amount, transaction_type, transaction_mode, transaction_date)
VALUES 
    (1, 1000, 'credit', 'UPI', '2026-04-01 10:00:00'),
    (1, 200, 'debit', 'ATM', '2026-04-02 12:00:00'),
    (2, 500, 'debit', 'NEFT', '2026-04-03 09:30:00'),
    (3, 1500, 'credit', 'IMPS', '2026-04-04 11:15:00'),
    (4, 300, 'debit', 'UPI', '2026-04-05 14:20:00'),
    (5, 2000, 'credit', 'ATM', '2026-04-06 16:45:00'),
    (6, 700, 'debit', 'NEFT', '2026-04-07 18:00:00'),
    (7, 800, 'credit', 'IMPS', '2026-04-08 05:10:00'),
    (8, 400, 'debit', 'UPI', '2026-04-08 19:00:00'),
    (9, 1200, 'credit', 'ATM', '2026-04-09 07:58:00');

-- 1. Fetch all customers whose account balance is greater than 1500.
    SELECT * FROM customers
    WHERE account_balance>1500;

-- 2. Display all transactions sorted by transaction_date in descending order.
    SELECT * FROM transactions 
    ORDER BY transaction_date DESC;

-- 3. Get unique transaction modes used by customers.
    SELECT DISTINCT transaction_mode 
    FROM transactions;

-- 4. Fetch top 5 highest t sactions (amount).
    SELECT * FROM transactions
    ORDER BY amount DESC LIMIT 5;

-- 5. Find customers whose starts with 'A' using LIKE.
    SELECT * FROM customers
    WHERE name LIKE 'A%';

-- 6. Find total transaction amount per customer.
    SELECT c.name, SUM(t.amount) AS total_spent
    FROM customers c
    JOIN transactions t ON c.customer_id = t.customer_id
    GROUP BY c.name
    ORDER BY total_spent DESC;

-- 7. Find customers whose total transaction amount is greater than 2000.
    SELECT c.name, SUM(t.amount) AS total_spent
    FROM customers c
    JOIN transactions t ON c.customer_id = t.customer_id
    GROUP BY c.name
    HAVING SUM(t.amount) > 2000;

-- 8. Display: Customer Name, Transaction Amount, Transaction Type (using JOIN between customers & transactions)
    SELECT c.name, t.amount, t.transaction_type
    FROM customers c
    JOIN transactions t ON c.customer_id = t.customer_id;

-- 9. Display: customer_id, amount, running total of transactions per customer
    SELECT customer_id, amount, 
    SUM(amount) OVER (
        PARTITION BY customer_id 
        ORDER BY transaction_date ASC
    ) AS running_total
    FROM transactions;

-- 10. Rank customers based on their account balance (highest first) using DENSE RANK.
    SELECT name, account_balance,
    DENSE_RANK() OVER (ORDER BY account_balance DESC) AS wealth_rank
    FROM customers;

-- 11. Find customers whose average transaction amount is greater than overall average
    SELECT c.name, AVG(t.amount) AS customer_avg_transaction
    FROM customers c
    JOIN transactions t ON c.customer_id = t.customer_id
    GROUP BY c.name
    HAVING AVG(t.amount) > (SELECT AVG(amount) FROM transactions);