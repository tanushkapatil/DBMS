mysql> CREATE DATABASE Banking_System;
Query OK, 1 row affected (0.00 sec)

mysql> USE Banking_System;
Database changed
mysql> 
mysql> CREATE TABLE Customers (
    ->     customer_id INT PRIMARY KEY,
    ->     name VARCHAR(100),
    ->     dob DATE,
    ->     city VARCHAR(100),
    ->     account_type VARCHAR(50)
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> 
mysql> CREATE TABLE Branches (
    ->     branch_id INT PRIMARY KEY,
    ->     branch_name VARCHAR(100),
    ->     city VARCHAR(100)
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql> 
mysql> CREATE TABLE Accounts (
    ->     account_id INT PRIMARY KEY,
    ->     customer_id INT,
    ->     balance DECIMAL(15,2),
    ->     account_type VARCHAR(50),
    ->     branch_id INT,
    ->     FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    ->     FOREIGN KEY (branch_id) REFERENCES Branches(branch_id)
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> 
mysql> CREATE TABLE Transactions (
    ->     transaction_id INT PRIMARY KEY,
    ->     account_id INT,
    ->     amount DECIMAL(15,2),
    ->     transaction_type VARCHAR(50),
    ->     transaction_date DATE,
    ->     FOREIGN KEY (account_id) REFERENCES Accounts(account_id)
    -> );
Query OK, 0 rows affected (0.01 sec)

mysql> 
mysql> CREATE TABLE Loans (
    ->     loan_id INT PRIMARY KEY,
    ->     customer_id INT,
    ->     amount DECIMAL(15,2),
    ->     loan_type VARCHAR(50),
    ->     status VARCHAR(50),
    ->     FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> 
mysql> INSERT INTO Customers (customer_id, name, dob, city, account_type) VALUES
    ->     (1, 'Alice', '1990-05-14', 'Mumbai', 'Savings'),
    ->     (2, 'Bob', '1985-09-23', 'Pune', 'Current'),
    ->     (3, 'Charlie', '1992-07-08', 'Delhi', 'Savings'),
    ->     (4, 'David', '1988-12-01', 'Mumbai', 'Current'),
    ->     (5, 'Eve', '1995-03-19', 'Pune', 'Savings');
Query OK, 5 rows affected (0.00 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> 
mysql> INSERT INTO Branches (branch_id, branch_name, city) VALUES
    ->     (1, 'Mumbai Central', 'Mumbai'),
    ->     (2, 'Pune Nagar', 'Pune'),
    ->     (3, 'Delhi Metro', 'Delhi');
Query OK, 3 rows affected (0.00 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> 
mysql> INSERT INTO Accounts (account_id, customer_id, balance, account_type, branch_id) VALUES
    ->     (101, 1, 50000, 'Savings', 1),
    ->     (102, 2, 75000, 'Current', 2),
    ->     (103, 3, 10000, 'Savings', 3),
    ->     (104, 4, 30000, 'Current', 1),
    ->     (105, 5, 20000, 'Savings', 2);
Query OK, 5 rows affected (0.00 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> 
mysql> INSERT INTO Transactions (transaction_id, account_id, amount, transaction_type, transaction_date) VALUES
    ->     (1001, 101, 2000, 'Deposit', '2024-11-01'),
    ->     (1002, 102, 5000, 'Withdrawal', '2024-10-20'),
    ->     (1003, 103, 1500, 'Deposit', '2024-09-15'),
    ->     (1004, 104, 3000, 'Transfer', '2024-08-05'),
    ->     (1005, 105, 1000, 'Deposit', '2024-07-25');
Query OK, 5 rows affected (0.00 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> 
mysql> INSERT INTO Loans (loan_id, customer_id, amount, loan_type, status) VALUES
    ->     (201, 1, 500000, 'Home', 'Approved'),
    ->     (202, 2, 300000, 'Car', 'Pending'),
    ->     (203, 3, 200000, 'Personal', 'Approved'),
    ->     (204, 4, 100000, 'Car', 'Rejected'),
    ->     (205, 5, 250000, 'Home', 'Approved');
Query OK, 5 rows affected (0.00 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> 
mysql> SELECT 
    ->     account_type, 
    ->     SUM(balance) AS total_balance 
    -> FROM Accounts 
    -> GROUP BY account_type;
+--------------+---------------+
| account_type | total_balance |
+--------------+---------------+
| Savings      |      80000.00 |
| Current      |     105000.00 |
+--------------+---------------+
2 rows in set (0.00 sec)

mysql> 
mysql> SELECT 
    ->     branch_id, 
    ->     COUNT(account_id) AS account_count 
    -> FROM Accounts 
    -> GROUP BY branch_id;
+-----------+---------------+
| branch_id | account_count |
+-----------+---------------+
|         1 |             2 |
|         2 |             2 |
|         3 |             1 |
+-----------+---------------+
3 rows in set (0.00 sec)

mysql> 
mysql> SELECT 
    ->     city, 
    ->     COUNT(customer_id) AS customer_count 
    -> FROM Customers 
    -> GROUP BY city;
+--------+----------------+
| city   | customer_count |
+--------+----------------+
| Mumbai |              2 |
| Pune   |              2 |
| Delhi  |              1 |
+--------+----------------+
3 rows in set (0.00 sec)

mysql> 
mysql> SELECT 
    ->     loan_type, 
    ->     COUNT(loan_id) AS approved_loans 
    -> FROM Loans 
    -> WHERE status = 'Approved' 
    -> GROUP BY loan_type;
+-----------+----------------+
| loan_type | approved_loans |
+-----------+----------------+
| Home      |              2 |
| Personal  |              1 |
+-----------+----------------+
2 rows in set (0.00 sec)

mysql> 
mysql> SELECT 
    ->     transaction_type, 
    ->     COUNT(transaction_id) AS total_transactions 
    -> FROM Transactions 
    -> GROUP BY transaction_type;
+------------------+--------------------+
| transaction_type | total_transactions |
+------------------+--------------------+
| Deposit          |                  3 |
| Withdrawal       |                  1 |
| Transfer         |                  1 |
+------------------+--------------------+
3 rows in set (0.00 sec)

mysql> 
mysql> SELECT 
    ->     c.customer_id, 
    ->     c.name 
    -> FROM Customers c 
    -> LEFT JOIN Loans l ON c.customer_id = l.customer_id 
    -> WHERE l.customer_id IS NULL;
Empty set (0.00 sec)

mysql> 
mysql> SELECT 
    ->     a.customer_id 
    -> FROM Accounts a 
    -> GROUP BY a.customer_id 
    -> HAVING COUNT(DISTINCT a.branch_id) > 1;
Empty set (0.00 sec)

mysql> 
mysql> SELECT 
    ->     a.account_id 
    -> FROM Accounts a 
    -> LEFT JOIN Transactions t 
    ->     ON a.account_id = t.account_id 
    ->     AND t.transaction_type = 'Deposit' 
    ->     AND t.transaction_date >= CURDATE() - INTERVAL 3 MONTH 
    -> WHERE t.transaction_id IS NULL;
+------------+
| account_id |
+------------+
|        101 |
|        102 |
|        103 |
|        104 |
|        105 |
+------------+
5 rows in set (0.00 sec)

mysql> 
mysql> SELECT 
    ->     account_type 
    -> FROM Accounts 
    -> GROUP BY account_type 
    -> HAVING SUM(balance) < 25000;
Empty set (0.00 sec)

mysql> 
mysql> SELECT 
    ->     account_type, 
    ->     SUM(balance) AS total_balance 
    -> FROM Accounts 
    -> GROUP BY account_type 
    -> HAVING total_balance > 50000;
+--------------+---------------+
| account_type | total_balance |
+--------------+---------------+
| Savings      |      80000.00 |
| Current      |     105000.00 |
+--------------+---------------+
2 rows in set (0.00 sec)

mysql> 
mysql> SELECT 
    ->     transaction_date, 
    ->     COUNT(transaction_id) AS transaction_count 
    -> FROM Transactions 
    -> GROUP BY transaction_date 
    -> HAVING transaction_count > 5;
Empty set (0.00 sec)

mysql> 
mysql> SELECT 
    ->     transaction_date, 
    ->     SUM(amount) AS total_amount 
    -> FROM Transactions 
    -> GROUP BY transaction_date 
    -> ORDER BY total_amount DESC 
    -> LIMIT 3;
+------------------+--------------+
| transaction_date | total_amount |
+------------------+--------------+
| 2024-10-20       |      5000.00 |
| 2024-08-05       |      3000.00 |
| 2024-11-01       |      2000.00 |
+------------------+--------------+
3 rows in set (0.00 sec)

mysql> 
mysql> SELECT 
    ->     c.customer_id, 
    ->     c.name 
    -> FROM Customers c 
    -> LEFT JOIN Accounts a ON c.customer_id = a.customer_id 
    -> INNER JOIN Loans l ON c.customer_id = l.customer_id 
    -> WHERE a.customer_id IS NULL;
Empty set (0.00 sec)

mysql> Terminal close -- exit!
