Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 9
Server version: 8.0.41 MySQL Community Server - GPL

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE ECommerceDB;
Query OK, 1 row affected (0.04 sec)

mysql> 
mysql> USE ECommerceDB;
Database changed
mysql> 
mysql> CREATE TABLE Customers (
    ->     customer_id INT PRIMARY KEY,
    ->     name VARCHAR(100) NOT NULL,
    ->     email VARCHAR(100) UNIQUE NOT NULL,
    ->     city VARCHAR(100) NOT NULL
    -> );
Query OK, 0 rows affected (0.04 sec)

mysql> 
mysql> CREATE TABLE Orders (
    ->     order_id INT PRIMARY KEY,
    ->     customer_id INT,
    ->     order_date DATE NOT NULL,
    ->     total_amount DECIMAL(10, 2) NOT NULL,
    ->     FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> 
mysql> CREATE TABLE Products (
    ->     product_id INT PRIMARY KEY,
    ->     product_name VARCHAR(100) NOT NULL,
    ->     category VARCHAR(100) NOT NULL,
    ->     price DECIMAL(10, 2) NOT NULL
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> 
mysql> CREATE TABLE Order_Items (
    ->     order_item_id INT PRIMARY KEY,
    ->     order_id INT,
    ->     product_id INT,
    ->     quantity INT NOT NULL,
    ->     subtotal DECIMAL(10, 2) NOT NULL,
    ->     FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    ->     FOREIGN KEY (product_id) REFERENCES Products(product_id)
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> 
mysql> CREATE TABLE Sellers (
    ->     seller_id INT PRIMARY KEY,
    ->     seller_name VARCHAR(100) NOT NULL,
    ->     city VARCHAR(100) NOT NULL
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> 
mysql> CREATE TABLE Product_Sellers (
    ->     product_id INT,
    ->     seller_id INT,
    ->     stock_quantity INT NOT NULL,
    ->     PRIMARY KEY (product_id, seller_id),
    ->     FOREIGN KEY (product_id) REFERENCES Products(product_id),
    ->     FOREIGN KEY (seller_id) REFERENCES Sellers(seller_id)
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> INSERT INTO Customers (customer_id, name, email, city) VALUES
    -> (1, 'Aarav Sharma', 'aarav.sharma@example.com', 'Pune'),
    -> (2, 'Ishita Verma', 'ishita.verma@example.com', 'Mumbai'),
    -> (3, 'Kabir Singh', 'kabir.singh@example.com', 'Nagpur'),
    -> (4, 'Riya Malhotra', 'riya.malhotra@example.com', 'Pune'),
    -> (5, 'Arjun Mehta', 'arjun.mehta@example.com', 'Delhi');
Query OK, 5 rows affected (0.00 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Customers;
+-------------+---------------+---------------------------+--------+
| customer_id | name          | email                     | city   |
+-------------+---------------+---------------------------+--------+
|           1 | Aarav Sharma  | aarav.sharma@example.com  | Pune   |
|           2 | Ishita Verma  | ishita.verma@example.com  | Mumbai |
|           3 | Kabir Singh   | kabir.singh@example.com   | Nagpur |
|           4 | Riya Malhotra | riya.malhotra@example.com | Pune   |
|           5 | Arjun Mehta   | arjun.mehta@example.com   | Delhi  |
+-------------+---------------+---------------------------+--------+
5 rows in set (0.00 sec)

mysql> 
mysql> INSERT INTO Orders (order_id, customer_id, order_date, total_amount) VALUES
    -> (101, 1, '2025-03-01', 500.00),
    -> (102, 2, '2025-03-05', 1200.00),
    -> (103, 3, '2025-02-20', 750.00),
    -> (104, 1, '2025-03-10', 300.00),
    -> (105, 4, '2025-01-15', 450.00);
Query OK, 5 rows affected (0.00 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Orders;
+----------+-------------+------------+--------------+
| order_id | customer_id | order_date | total_amount |
+----------+-------------+------------+--------------+
|      101 |           1 | 2025-03-01 |       500.00 |
|      102 |           2 | 2025-03-05 |      1200.00 |
|      103 |           3 | 2025-02-20 |       750.00 |
|      104 |           1 | 2025-03-10 |       300.00 |
|      105 |           4 | 2025-01-15 |       450.00 |
+----------+-------------+------------+--------------+
5 rows in set (0.00 sec)

mysql> 
mysql> INSERT INTO Products (product_id, product_name, category, price) VALUES
    -> (201, 'Gaming Laptop', 'Electronics', 85000.00),
    -> (202, 'Wireless Earbuds', 'Electronics', 3000.00),
    -> (203, 'Ergonomic Chair', 'Furniture', 7000.00),
    -> (204, 'Drawing Pad', 'Stationery', 150.00),
    -> (205, 'Smartwatch', 'Electronics', 20000.00);
Query OK, 5 rows affected (0.00 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Products;
+------------+------------------+-------------+----------+
| product_id | product_name     | category    | price    |
+------------+------------------+-------------+----------+
|        201 | Gaming Laptop    | Electronics | 85000.00 |
|        202 | Wireless Earbuds | Electronics |  3000.00 |
|        203 | Ergonomic Chair  | Furniture   |  7000.00 |
|        204 | Drawing Pad      | Stationery  |   150.00 |
|        205 | Smartwatch       | Electronics | 20000.00 |
+------------+------------------+-------------+----------+
5 rows in set (0.00 sec)

mysql> 
mysql> INSERT INTO Order_Items (order_item_id, order_id, product_id, quantity, subtotal) VALUES
    -> (301, 101, 201, 1, 85000.00),
    -> (302, 101, 202, 2, 6000.00),
    -> (303, 102, 203, 1, 7000.00),
    -> (304, 103, 204, 5, 750.00),
    -> (305, 104, 205, 1, 20000.00);
Query OK, 5 rows affected (0.00 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Order_Items;
+---------------+----------+------------+----------+----------+
| order_item_id | order_id | product_id | quantity | subtotal |
+---------------+----------+------------+----------+----------+
|           301 |      101 |        201 |        1 | 85000.00 |
|           302 |      101 |        202 |        2 |  6000.00 |
|           303 |      102 |        203 |        1 |  7000.00 |
|           304 |      103 |        204 |        5 |   750.00 |
|           305 |      104 |        205 |        1 | 20000.00 |
+---------------+----------+------------+----------+----------+
5 rows in set (0.00 sec)

mysql> 
mysql> INSERT INTO Sellers (seller_id, seller_name, city) VALUES
    -> (401, 'Tech Galaxy', 'Pune'),
    -> (402, 'Gizmo Store', 'Mumbai'),
    -> (403, 'Home Comforts', 'Delhi'),
    -> (404, 'Creative Supplies', 'Nagpur'),
    -> (405, 'Gadget Central', 'Pune');
Query OK, 5 rows affected (0.00 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Sellers;
+-----------+-------------------+--------+
| seller_id | seller_name       | city   |
+-----------+-------------------+--------+
|       401 | Tech Galaxy       | Pune   |
|       402 | Gizmo Store       | Mumbai |
|       403 | Home Comforts     | Delhi  |
|       404 | Creative Supplies | Nagpur |
|       405 | Gadget Central    | Pune   |
+-----------+-------------------+--------+
5 rows in set (0.00 sec)

mysql> 
mysql> INSERT INTO Product_Sellers (product_id, seller_id, stock_quantity) VALUES
    -> (201, 401, 4),
    -> (201, 402, 2),
    -> (202, 401, 12),
    -> (203, 403, 5),
    -> (204, 404, 20),
    -> (205, 405, 6);
Query OK, 6 rows affected (0.00 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Product_Sellers;
+------------+-----------+----------------+
| product_id | seller_id | stock_quantity |
+------------+-----------+----------------+
|        201 |       401 |              4 |
|        201 |       402 |              2 |
|        202 |       401 |             12 |
|        203 |       403 |              5 |
|        204 |       404 |             20 |
|        205 |       405 |              6 |
+------------+-----------+----------------+
6 rows in set (0.00 sec)

mysql> SELECT c.*, o.*
    -> FROM Customers c
    -> LEFT JOIN Orders o ON c.customer_id = o.customer_id;
+-------------+---------------+---------------------------+--------+----------+-------------+------------+--------------+
| customer_id | name          | email                     | city   | order_id | customer_id | order_date | total_amount |
+-------------+---------------+---------------------------+--------+----------+-------------+------------+--------------+
|           1 | Aarav Sharma  | aarav.sharma@example.com  | Pune   |      101 |           1 | 2025-03-01 |       500.00 |
|           1 | Aarav Sharma  | aarav.sharma@example.com  | Pune   |      104 |           1 | 2025-03-10 |       300.00 |
|           2 | Ishita Verma  | ishita.verma@example.com  | Mumbai |      102 |           2 | 2025-03-05 |      1200.00 |
|           3 | Kabir Singh   | kabir.singh@example.com   | Nagpur |      103 |           3 | 2025-02-20 |       750.00 |
|           4 | Riya Malhotra | riya.malhotra@example.com | Pune   |      105 |           4 | 2025-01-15 |       450.00 |
|           5 | Arjun Mehta   | arjun.mehta@example.com   | Delhi  |     NULL |        NULL | NULL       |         NULL |
+-------------+---------------+---------------------------+--------+----------+-------------+------------+--------------+
6 rows in set (0.00 sec)

mysql> 
mysql> SELECT o.order_id, p.product_name, oi.quantity
    -> FROM Orders o
    -> JOIN Order_Items oi ON o.order_id = oi.order_id
    -> JOIN Products p ON oi.product_id = p.product_id;
+----------+------------------+----------+
| order_id | product_name     | quantity |
+----------+------------------+----------+
|      101 | Gaming Laptop    |        1 |
|      101 | Wireless Earbuds |        2 |
|      104 | Smartwatch       |        1 |
|      102 | Ergonomic Chair  |        1 |
|      103 | Drawing Pad      |        5 |
+----------+------------------+----------+
5 rows in set (0.00 sec)

mysql> 
mysql> SELECT c.customer_id, COUNT(o.order_id) AS total_orders
    -> FROM Customers c
    -> LEFT JOIN Orders o ON c.customer_id = o.customer_id
    -> GROUP BY c.customer_id;
+-------------+--------------+
| customer_id | total_orders |
+-------------+--------------+
|           1 |            2 |
|           2 |            1 |
|           3 |            1 |
|           4 |            1 |
|           5 |            0 |
+-------------+--------------+
5 rows in set (0.00 sec)

mysql> 
mysql> SELECT category, COUNT(*) AS total_products
    -> FROM Products
    -> GROUP BY category;
+-------------+----------------+
| category    | total_products |
+-------------+----------------+
| Electronics |              3 |
| Furniture   |              1 |
| Stationery  |              1 |
+-------------+----------------+
3 rows in set (0.00 sec)

mysql> 
mysql> SELECT o.order_id, c.name, o.total_amount
    -> FROM Orders o
    -> JOIN Customers c ON o.customer_id = c.customer_id
    -> WHERE o.order_date >= CURDATE() - INTERVAL 30 DAY;
+----------+--------------+--------------+
| order_id | name         | total_amount |
+----------+--------------+--------------+
|      101 | Aarav Sharma |       500.00 |
|      102 | Ishita Verma |      1200.00 |
|      103 | Kabir Singh  |       750.00 |
|      104 | Aarav Sharma |       300.00 |
+----------+--------------+--------------+
4 rows in set (0.00 sec)

mysql> 
mysql> SELECT s.seller_name
    -> FROM Sellers s
    -> JOIN Products p ON s.seller_id = p.product_id
    -> WHERE p.product_name = 'Laptop';
Empty set (0.00 sec)

mysql> 
mysql> SELECT c.*
    -> FROM Customers c
    -> LEFT JOIN Orders o ON c.customer_id = o.customer_id
    -> WHERE o.order_id IS NULL;
+-------------+-------------+-------------------------+-------+
| customer_id | name        | email                   | city  |
+-------------+-------------+-------------------------+-------+
|           5 | Arjun Mehta | arjun.mehta@example.com | Delhi |
+-------------+-------------+-------------------------+-------+
1 row in set (0.00 sec)

mysql> 
mysql> SELECT *
    -> FROM Orders
    -> WHERE total_amount > (SELECT AVG(total_amount) FROM Orders);
+----------+-------------+------------+--------------+
| order_id | customer_id | order_date | total_amount |
+----------+-------------+------------+--------------+
|      102 |           2 | 2025-03-05 |      1200.00 |
|      103 |           3 | 2025-02-20 |       750.00 |
+----------+-------------+------------+--------------+
2 rows in set (0.00 sec)

mysql> 
mysql> SELECT customer_id
    -> FROM Orders
    -> GROUP BY customer_id
    -> HAVING COUNT(order_id) >= 2;
+-------------+
| customer_id |
+-------------+
|           1 |
+-------------+
1 row in set (0.00 sec)

mysql> 
mysql> SELECT p.product_name, SUM(oi.quantity) AS total_quantity
    -> FROM Products p
    -> JOIN Order_Items oi ON p.product_id = oi.product_id
    -> GROUP BY p.product_name
    -> ORDER BY total_quantity DESC
    -> LIMIT 3;
+------------------+----------------+
| product_name     | total_quantity |
+------------------+----------------+
| Drawing Pad      |              5 |
| Wireless Earbuds |              2 |
| Gaming Laptop    |              1 |
+------------------+----------------+
3 rows in set (0.00 sec)

mysql> 
mysql> SELECT p.product_name
    -> FROM Products p
    -> JOIN Sellers s ON p.product_id = s.seller_id
    -> GROUP BY p.product_name
    -> HAVING COUNT(DISTINCT s.seller_id) > 1;
Empty set (0.00 sec)

mysql> 
mysql> SELECT s.*
    -> FROM Sellers s
    -> LEFT JOIN Products p ON s.seller_id = p.product_id
    -> WHERE p.product_id IS NULL;
+-----------+-------------------+--------+
| seller_id | seller_name       | city   |
+-----------+-------------------+--------+
|       401 | Tech Galaxy       | Pune   |
|       402 | Gizmo Store       | Mumbai |
|       403 | Home Comforts     | Delhi  |
|       404 | Creative Supplies | Nagpur |
|       405 | Gadget Central    | Pune   |
+-----------+-------------------+--------+
5 rows in set (0.00 sec)

mysql> 
mysql> SELECT *
    -> FROM Products
    -> WHERE product_id NOT IN (SELECT product_id FROM Order_Items);
Empty set (0.00 sec)

mysql> 
mysql> SELECT c.name
    -> FROM Customers c
    -> JOIN Orders o ON c.customer_id = o.customer_id
    -> GROUP BY c.customer_id
    -> ORDER BY COUNT(o.order_id) DESC
    -> LIMIT 1;
+--------------+
| name         |
+--------------+
| Aarav Sharma |
+--------------+
1 row in set (0.00 sec)

mysql> 
mysql> SELECT o.customer_id
    -> FROM Orders o
    -> JOIN Order_Items oi ON o.order_id = oi.order_id
    -> GROUP BY o.customer_id
    -> HAVING COUNT(DISTINCT oi.product_id) > 5;
Empty set (0.00 sec)

mysql> 
mysql> SELECT p.product_name
    -> FROM Products p
    -> JOIN Sellers s ON p.product_id = s.seller_id
    -> GROUP BY p.product_name
    -> HAVING COUNT(DISTINCT s.seller_id) > 1
    -> AND NOT EXISTS (
    ->     SELECT 1 FROM Order_Items oi WHERE oi.product_id = p.product_id
    -> );
ERROR 1054 (42S22): Unknown column 'ecommercedb.p.product_id' in 'where clause'
mysql> 
mysql> SELECT c.name, SUM(o.total_amount) AS total_spent
    -> FROM Customers c
    -> JOIN Orders o ON c.customer_id = o.customer_id
    -> GROUP BY c.name
    -> ORDER BY total_spent DESC
    -> LIMIT 1;
+--------------+-------------+
| name         | total_spent |
+--------------+-------------+
| Ishita Verma |     1200.00 |
+--------------+-------------+
1 row in set (0.00 sec)

mysql> 
mysql> SELECT c.*
    -> FROM Customers c
    -> WHERE c.customer_id IN (SELECT customer_id FROM Orders)
    -> UNION
    -> SELECT c.*
    -> FROM Customers c
    -> WHERE c.city IN (SELECT city FROM Sellers);
+-------------+---------------+---------------------------+--------+
| customer_id | name          | email                     | city   |
+-------------+---------------+---------------------------+--------+
|           1 | Aarav Sharma  | aarav.sharma@example.com  | Pune   |
|           2 | Ishita Verma  | ishita.verma@example.com  | Mumbai |
|           3 | Kabir Singh   | kabir.singh@example.com   | Nagpur |
|           4 | Riya Malhotra | riya.malhotra@example.com | Pune   |
|           5 | Arjun Mehta   | arjun.mehta@example.com   | Delhi  |
+-------------+---------------+---------------------------+--------+
5 rows in set (0.00 sec)

mysql> 
mysql> SELECT product_id
    -> FROM Product_Sellers
    -> UNION
    -> SELECT product_id
    -> FROM Order_Items;
+------------+
| product_id |
+------------+
|        201 |
|        202 |
|        203 |
|        204 |
|        205 |
+------------+
5 rows in set (0.00 sec)

mysql> 
mysql> SELECT product_id
    -> FROM Order_Items
    -> INTERSECT
    -> SELECT product_id
    -> FROM Product_Sellers;
+------------+
| product_id |
+------------+
|        201 |
|        202 |
|        203 |
|        204 |
|        205 |
+------------+
5 rows in set (0.00 sec)

mysql> 
mysql> SELECT c.*
    -> FROM Customers c
    -> WHERE c.customer_id IN (SELECT customer_id FROM Orders)
    -> INTERSECT
    -> SELECT c.*
    -> FROM Customers c
    -> WHERE c.city IN (SELECT city FROM Sellers);
+-------------+---------------+---------------------------+--------+
| customer_id | name          | email                     | city   |
+-------------+---------------+---------------------------+--------+
|           1 | Aarav Sharma  | aarav.sharma@example.com  | Pune   |
|           2 | Ishita Verma  | ishita.verma@example.com  | Mumbai |
|           3 | Kabir Singh   | kabir.singh@example.com   | Nagpur |
|           4 | Riya Malhotra | riya.malhotra@example.com | Pune   |
+-------------+---------------+---------------------------+--------+
4 rows in set (0.00 sec)

mysql> 
mysql> SELECT customer_id
    -> FROM Orders
    -> WHERE YEAR(order_date) = 2023
    -> INTERSECT
    -> SELECT customer_id
    -> FROM Orders
    -> WHERE YEAR(order_date) = 2024;
Empty set (0.00 sec)


