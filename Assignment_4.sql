Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 11
Server version: 8.0.41 MySQL Community Server - GPL

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE E_Commerce;
Query OK, 1 row affected (0.01 sec)

mysql> USE E_Commerce;
Database changed
mysql> 
mysql> CREATE TABLE Customers (
    ->     customer_id INT PRIMARY KEY,
    ->     name VARCHAR(50),
    ->     email VARCHAR(100),
    ->     city VARCHAR(50),
    ->     age INT
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> 
mysql> CREATE TABLE Orders (
    ->     order_id INT PRIMARY KEY,
    ->     customer_id INT,
    ->     order_date DATE,
    ->     total_amount DECIMAL(10,2),
    ->     status VARCHAR(20),
    ->     FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> 
mysql> CREATE TABLE Products (
    ->     product_id INT PRIMARY KEY,
    ->     name VARCHAR(50),
    ->     category VARCHAR(50),
    ->     price DECIMAL(10,2),
    ->     stock INT
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> 
mysql> CREATE TABLE Order_Items (
    ->     order_item_id INT PRIMARY KEY,
    ->     order_id INT,
    ->     product_id INT,
    ->     quantity INT,
    ->     subtotal DECIMAL(10,2),
    ->     FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    ->     FOREIGN KEY (product_id) REFERENCES Products(product_id)
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> 
mysql> INSERT INTO Customers (customer_id, name, email, city, age) VALUES
    -> (1, 'Alice', 'alice@gmail.com', 'New York', 32),
    -> (2, 'Bob', 'bob@yahoo.com', 'Los Angeles', 28),
    -> (3, 'Charlie', 'charlie@gmail.com', 'Chicago', 40),
    -> (4, 'David', 'david@hotmail.com', 'San Francisco', 25),
    -> (5, 'Eve', 'eve@gmail.com', 'New York', 35),
    -> (6, 'Frank', 'frank@outlook.com', 'Los Angeles', 29),
    -> (7, 'Grace', 'grace@gmail.com', 'Chicago', 33);
Query OK, 7 rows affected (0.01 sec)
Records: 7  Duplicates: 0  Warnings: 0

mysql> 
mysql> SELECT * FROM Customers;
+-------------+---------+-------------------+---------------+------+
| customer_id | name    | email             | city          | age  |
+-------------+---------+-------------------+---------------+------+
|           1 | Alice   | alice@gmail.com   | New York      |   32 |
|           2 | Bob     | bob@yahoo.com     | Los Angeles   |   28 |
|           3 | Charlie | charlie@gmail.com | Chicago       |   40 |
|           4 | David   | david@hotmail.com | San Francisco |   25 |
|           5 | Eve     | eve@gmail.com     | New York      |   35 |
|           6 | Frank   | frank@outlook.com | Los Angeles   |   29 |
|           7 | Grace   | grace@gmail.com   | Chicago       |   33 |
+-------------+---------+-------------------+---------------+------+
7 rows in set (0.00 sec)

mysql> 
mysql> INSERT INTO Products (product_id, name, category, price, stock) VALUES
    -> (1, 'iPhone 13', 'Electronics', 999.99, 10),
    -> (2, 'Samsung Phone', 'Electronics', 799.99, 5),
    -> (3, 'Laptop Pro', 'Electronics', 1200.00, 3),
    -> (4, 'Gaming Mouse', 'Accessories', 45.99, 15),
    -> (5, 'T-shirt', 'Clothing', 25.00, 50),
    -> (6, 'Tablet X', 'Electronics', 500.00, 2),
    -> (7, 'Headphones', 'Accessories', 120.00, 10),
    -> (8, 'Smartwatch', 'Electronics', 200.00, 8),
    -> (9, 'Keyboard', 'Accessories', 60.00, 12),
    -> (10, 'Jacket', 'Clothing', 80.00, 20);
Query OK, 10 rows affected (0.00 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql> 
mysql> SELECT * FROM Products;
+------------+---------------+-------------+---------+-------+
| product_id | name          | category    | price   | stock |
+------------+---------------+-------------+---------+-------+
|          1 | iPhone 13     | Electronics |  999.99 |    10 |
|          2 | Samsung Phone | Electronics |  799.99 |     5 |
|          3 | Laptop Pro    | Electronics | 1200.00 |     3 |
|          4 | Gaming Mouse  | Accessories |   45.99 |    15 |
|          5 | T-shirt       | Clothing    |   25.00 |    50 |
|          6 | Tablet X      | Electronics |  500.00 |     2 |
|          7 | Headphones    | Accessories |  120.00 |    10 |
|          8 | Smartwatch    | Electronics |  200.00 |     8 |
|          9 | Keyboard      | Accessories |   60.00 |    12 |
|         10 | Jacket        | Clothing    |   80.00 |    20 |
+------------+---------------+-------------+---------+-------+
10 rows in set (0.00 sec)

mysql> 
mysql> INSERT INTO Orders (order_id, customer_id, order_date, total_amount, status) VALUES
    -> (1, 1, '2025-01-10', 1050.00, 'Completed'),
    -> (2, 2, '2025-02-05', 800.00, 'Pending'),
    -> (3, 3, '2025-02-12', 300.00, 'Completed'),
    -> (4, 4, '2025-01-20', 1250.00, 'Shipped'),
    -> (5, 5, '2025-02-10', 600.00, 'Pending'),
    -> (6, 6, '2025-01-25', 999.99, 'Completed'),
    -> (7, 3, '2025-02-08', 150.00, 'Completed');
Query OK, 7 rows affected (0.00 sec)
Records: 7  Duplicates: 0  Warnings: 0

mysql> 
mysql> SELECT * FROM Orders;
+----------+-------------+------------+--------------+-----------+
| order_id | customer_id | order_date | total_amount | status    |
+----------+-------------+------------+--------------+-----------+
|        1 |           1 | 2025-01-10 |      1050.00 | Completed |
|        2 |           2 | 2025-02-05 |       800.00 | Pending   |
|        3 |           3 | 2025-02-12 |       300.00 | Completed |
|        4 |           4 | 2025-01-20 |      1250.00 | Shipped   |
|        5 |           5 | 2025-02-10 |       600.00 | Pending   |
|        6 |           6 | 2025-01-25 |       999.99 | Completed |
|        7 |           3 | 2025-02-08 |       150.00 | Completed |
+----------+-------------+------------+--------------+-----------+
7 rows in set (0.00 sec)

mysql> 
mysql> INSERT INTO Order_Items (order_item_id, order_id, product_id, quantity, subtotal) VALUES
    -> (1, 1, 1, 1, 999.99),
    -> (2, 2, 2, 1, 799.99),
    -> (3, 3, 5, 2, 50.00),
    -> (4, 4, 3, 1, 1200.00),
    -> (5, 5, 6, 1, 500.00),
    -> (6, 6, 1, 1, 999.99),
    -> (7, 7, 4, 3, 150.00);
Query OK, 7 rows affected (0.00 sec)
Records: 7  Duplicates: 0  Warnings: 0

mysql> 
mysql> SELECT * FROM Order_Items;
+---------------+----------+------------+----------+----------+
| order_item_id | order_id | product_id | quantity | subtotal |
+---------------+----------+------------+----------+----------+
|             1 |        1 |          1 |        1 |   999.99 |
|             2 |        2 |          2 |        1 |   799.99 |
|             3 |        3 |          5 |        2 |    50.00 |
|             4 |        4 |          3 |        1 |  1200.00 |
|             5 |        5 |          6 |        1 |   500.00 |
|             6 |        6 |          1 |        1 |   999.99 |
|             7 |        7 |          4 |        3 |   150.00 |
+---------------+----------+------------+----------+----------+
7 rows in set (0.00 sec)

mysql> 
mysql> SELECT SUM(total_amount) AS total_spent FROM Orders WHERE customer_id = 3;
+-------------+
| total_spent |
+-------------+
|      450.00 |
+-------------+
1 row in set (0.00 sec)

mysql> SELECT SUM(total_amount) AS total_revenue FROM Orders;
+---------------+
| total_revenue |
+---------------+
|       5149.99 |
+---------------+
1 row in set (0.00 sec)

mysql> SELECT name, (price * stock) AS stock_value FROM Products;
+---------------+-------------+
| name          | stock_value |
+---------------+-------------+
| iPhone 13     |     9999.90 |
| Samsung Phone |     3999.95 |
| Laptop Pro    |     3600.00 |
| Gaming Mouse  |      689.85 |
| T-shirt       |     1250.00 |
| Tablet X      |     1000.00 |
| Headphones    |     1200.00 |
| Smartwatch    |     1600.00 |
| Keyboard      |      720.00 |
| Jacket        |     1600.00 |
+---------------+-------------+
10 rows in set (0.00 sec)

mysql> SELECT * FROM Customers WHERE age > 30 AND city = 'New York';
+-------------+-------+-----------------+----------+------+
| customer_id | name  | email           | city     | age  |
+-------------+-------+-----------------+----------+------+
|           1 | Alice | alice@gmail.com | New York |   32 |
|           5 | Eve   | eve@gmail.com   | New York |   35 |
+-------------+-------+-----------------+----------+------+
2 rows in set (0.00 sec)

mysql> SELECT DISTINCT Customers.* FROM Customers LEFT JOIN Orders ON Customers.customer_id = Orders.customer_id WHERE Customers.city = 'Los Angeles' OR Orders.total_amount > 500;
+-------------+-------+-------------------+---------------+------+
| customer_id | name  | email             | city          | age  |
+-------------+-------+-------------------+---------------+------+
|           1 | Alice | alice@gmail.com   | New York      |   32 |
|           2 | Bob   | bob@yahoo.com     | Los Angeles   |   28 |
|           4 | David | david@hotmail.com | San Francisco |   25 |
|           5 | Eve   | eve@gmail.com     | New York      |   35 |
|           6 | Frank | frank@outlook.com | Los Angeles   |   29 |
+-------------+-------+-------------------+---------------+------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM Products WHERE stock > 0 AND price < 50;
+------------+--------------+-------------+-------+-------+
| product_id | name         | category    | price | stock |
+------------+--------------+-------------+-------+-------+
|          4 | Gaming Mouse | Accessories | 45.99 |    15 |
|          5 | T-shirt      | Clothing    | 25.00 |    50 |
+------------+--------------+-------------+-------+-------+
2 rows in set (0.00 sec)

mysql> SELECT * FROM Products WHERE stock < 5;
+------------+------------+-------------+---------+-------+
| product_id | name       | category    | price   | stock |
+------------+------------+-------------+---------+-------+
|          3 | Laptop Pro | Electronics | 1200.00 |     3 |
|          6 | Tablet X   | Electronics |  500.00 |     2 |
+------------+------------+-------------+---------+-------+
2 rows in set (0.00 sec)

mysql> SELECT * FROM Orders WHERE status != 'Completed';
+----------+-------------+------------+--------------+---------+
| order_id | customer_id | order_date | total_amount | status  |
+----------+-------------+------------+--------------+---------+
|        2 |           2 | 2025-02-05 |       800.00 | Pending |
|        4 |           4 | 2025-01-20 |      1250.00 | Shipped |
|        5 |           5 | 2025-02-10 |       600.00 | Pending |
+----------+-------------+------------+--------------+---------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM Products WHERE stock = 0 OR category = 'Electronics';
+------------+---------------+-------------+---------+-------+
| product_id | name          | category    | price   | stock |
+------------+---------------+-------------+---------+-------+
|          1 | iPhone 13     | Electronics |  999.99 |    10 |
|          2 | Samsung Phone | Electronics |  799.99 |     5 |
|          3 | Laptop Pro    | Electronics | 1200.00 |     3 |
|          6 | Tablet X      | Electronics |  500.00 |     2 |
|          8 | Smartwatch    | Electronics |  200.00 |     8 |
+------------+---------------+-------------+---------+-------+
5 rows in set (0.00 sec)

mysql> SELECT email FROM Customers WHERE email LIKE '%@gmail.com';
+-------------------+
| email             |
+-------------------+
| alice@gmail.com   |
| charlie@gmail.com |
| eve@gmail.com     |
| grace@gmail.com   |
+-------------------+
4 rows in set (0.00 sec)

mysql> SELECT * FROM Products WHERE name LIKE '%Phone%';
+------------+---------------+-------------+--------+-------+
| product_id | name          | category    | price  | stock |
+------------+---------------+-------------+--------+-------+
|          1 | iPhone 13     | Electronics | 999.99 |    10 |
|          2 | Samsung Phone | Electronics | 799.99 |     5 |
|          7 | Headphones    | Accessories | 120.00 |    10 |
+------------+---------------+-------------+--------+-------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM Customers WHERE LENGTH(name) = 5;
+-------------+-------+-------------------+---------------+------+
| customer_id | name  | email             | city          | age  |
+-------------+-------+-------------------+---------------+------+
|           1 | Alice | alice@gmail.com   | New York      |   32 |
|           4 | David | david@hotmail.com | San Francisco |   25 |
|           6 | Frank | frank@outlook.com | Los Angeles   |   29 |
|           7 | Grace | grace@gmail.com   | Chicago       |   33 |
+-------------+-------+-------------------+---------------+------+
4 rows in set (0.00 sec)

mysql> SELECT * FROM Products WHERE name LIKE '%Laptop%' OR name LIKE '%Tablet%';
+------------+------------+-------------+---------+-------+
| product_id | name       | category    | price   | stock |
+------------+------------+-------------+---------+-------+
|          3 | Laptop Pro | Electronics | 1200.00 |     3 |
|          6 | Tablet X   | Electronics |  500.00 |     2 |
+------------+------------+-------------+---------+-------+
2 rows in set (0.00 sec)

mysql> SELECT * FROM Orders WHERE YEAR(order_date) = 2025;
+----------+-------------+------------+--------------+-----------+
| order_id | customer_id | order_date | total_amount | status    |
+----------+-------------+------------+--------------+-----------+
|        1 |           1 | 2025-01-10 |      1050.00 | Completed |
|        2 |           2 | 2025-02-05 |       800.00 | Pending   |
|        3 |           3 | 2025-02-12 |       300.00 | Completed |
|        4 |           4 | 2025-01-20 |      1250.00 | Shipped   |
|        5 |           5 | 2025-02-10 |       600.00 | Pending   |
|        6 |           6 | 2025-01-25 |       999.99 | Completed |
|        7 |           3 | 2025-02-08 |       150.00 | Completed |
+----------+-------------+------------+--------------+-----------+
7 rows in set (0.00 sec)

mysql> SELECT * FROM Customers WHERE city IN ('New York', 'Los Angeles', 'Chicago');
+-------------+---------+-------------------+-------------+------+
| customer_id | name    | email             | city        | age  |
+-------------+---------+-------------------+-------------+------+
|           1 | Alice   | alice@gmail.com   | New York    |   32 |
|           2 | Bob     | bob@yahoo.com     | Los Angeles |   28 |
|           3 | Charlie | charlie@gmail.com | Chicago     |   40 |
|           5 | Eve     | eve@gmail.com     | New York    |   35 |
|           6 | Frank   | frank@outlook.com | Los Angeles |   29 |
|           7 | Grace   | grace@gmail.com   | Chicago     |   33 |
+-------------+---------+-------------------+-------------+------+
6 rows in set (0.00 sec)

mysql> SELECT * FROM Products WHERE category NOT IN ('Electronics', 'Clothing');
+------------+--------------+-------------+--------+-------+
| product_id | name         | category    | price  | stock |
+------------+--------------+-------------+--------+-------+
|          4 | Gaming Mouse | Accessories |  45.99 |    15 |
|          7 | Headphones   | Accessories | 120.00 |    10 |
|          9 | Keyboard     | Accessories |  60.00 |    12 |
+------------+--------------+-------------+--------+-------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM Orders WHERE customer_id IN (1, 3, 5);
+----------+-------------+------------+--------------+-----------+
| order_id | customer_id | order_date | total_amount | status    |
+----------+-------------+------------+--------------+-----------+
|        1 |           1 | 2025-01-10 |      1050.00 | Completed |
|        3 |           3 | 2025-02-12 |       300.00 | Completed |
|        7 |           3 | 2025-02-08 |       150.00 | Completed |
|        5 |           5 | 2025-02-10 |       600.00 | Pending   |
+----------+-------------+------------+--------------+-----------+
4 rows in set (0.00 sec)

mysql> SELECT * FROM Customers WHERE customer_id NOT IN (SELECT DISTINCT customer_id FROM Orders);
+-------------+-------+-----------------+---------+------+
| customer_id | name  | email           | city    | age  |
+-------------+-------+-----------------+---------+------+
|           7 | Grace | grace@gmail.com | Chicago |   33 |
+-------------+-------+-----------------+---------+------+
1 row in set (0.00 sec)

mysql> SELECT * FROM Orders WHERE order_date >= DATE_SUB('2025-02-13', INTERVAL 30 DAY);
+----------+-------------+------------+--------------+-----------+
| order_id | customer_id | order_date | total_amount | status    |
+----------+-------------+------------+--------------+-----------+
|        2 |           2 | 2025-02-05 |       800.00 | Pending   |
|        3 |           3 | 2025-02-12 |       300.00 | Completed |
|        4 |           4 | 2025-01-20 |      1250.00 | Shipped   |
|        5 |           5 | 2025-02-10 |       600.00 | Pending   |
|        6 |           6 | 2025-01-25 |       999.99 | Completed |
|        7 |           3 | 2025-02-08 |       150.00 | Completed |
+----------+-------------+------------+--------------+-----------+
6 rows in set (0.00 sec)

mysql> SELECT * FROM Orders WHERE total_amount % 100 = 0;
+----------+-------------+------------+--------------+-----------+
| order_id | customer_id | order_date | total_amount | status    |
+----------+-------------+------------+--------------+-----------+
|        2 |           2 | 2025-02-05 |       800.00 | Pending   |
|        3 |           3 | 2025-02-12 |       300.00 | Completed |
|        5 |           5 | 2025-02-10 |       600.00 | Pending   |
+----------+-------------+------------+--------------+-----------+
3 rows in set (0.00 sec)

