Windows PowerShell
Copyright (C) Microsoft Corporation. All rights reserved.

Install the latest PowerShell for new features and improvements! https://aka.ms/PSWindows

PS C:\Users\Admin> mysql -u root -p --tee="D:\DBMS Lab\Assignment_2.sql"
Logging to file 'D:\DBMS Lab\Assignment_2.sql'
Enter password: ****
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 13
Server version: 8.0.41 MySQL Community Server - GPL

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.


mysql> CREATE database PCCOE_036;
ERROR 1007 (HY000): Can't create database 'pccoe_036'; database exists

mysql> USE PCCOE_036 ;
Database changed

mysql> CREATE table Students_036;
ERROR 4028 (HY000): A table must have at least one visible column.

mysql> CREATE TABLE Students_036 (
    ->     PRN INT PRIMARY KEY,
    ->     FirstName VARCHAR(50) NOT NULL,
    ->     LastName VARCHAR(50) NOT NULL,
    ->     MiddleName VARCHAR(50),
    ->     Year INT NOT NULL,
    ->     Email VARCHAR(100) NOT NULL,
    ->     Age INT NOT NULL,
    ->     Department VARCHAR(100) NOT NULL
    -> );
Query OK, 0 rows affected (0.02 sec)

mysql> INSERT INTO Students_036 (PRN, FirstName, LastName, MiddleName, Year, Email, Age, Department) VALUES
    -> (101, 'John', 'Doe', 'A', 2, 'john.doe@example.com', 20, 'Computer Science'),
    -> (102, 'Jane', 'Smith', 'B', 1, 'jane.smith@example.com', 19, 'Electronics'),
    -> (103, 'Alice', 'Johnson', NULL, 3, 'alice.johnson@example.com', 21, 'Mechanical'),
    -> (104, 'brod', 'stud', 'b', 2, 'Brod.a@example.com', 20, 'Electronics');
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Students_036;
+-----+-----------+----------+------------+------+---------------------------+-----+------------------+
| PRN | FirstName | LastName | MiddleName | Year | Email                     | Age | Department       |
+-----+-----------+----------+------------+------+---------------------------+-----+------------------+
| 101 | John      | Doe      | A          |    2 | john.doe@example.com      |  20 | Computer Science |
| 102 | Jane      | Smith    | B          |    1 | jane.smith@example.com    |  19 | Electronics      |
| 103 | Alice     | Johnson  | NULL       |    3 | alice.johnson@example.com |  21 | Mechanical       |
| 104 | brod      | stud     | b          |    2 | Brod.a@example.com        |  20 | Electronics      |
+-----+-----------+----------+------------+------+---------------------------+-----+------------------+
4 rows in set (0.00 sec)

mysql> UPDATE Students_036
    -> SET Year = 2
    -> WHERE PRN = 102;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM Students_036;
+-----+-----------+----------+------------+------+---------------------------+-----+------------------+
| PRN | FirstName | LastName | MiddleName | Year | Email                     | Age | Department       |
+-----+-----------+----------+------------+------+---------------------------+-----+------------------+
| 101 | John      | Doe      | A          |    2 | john.doe@example.com      |  20 | Computer Science |
| 102 | Jane      | Smith    | B          |    2 | jane.smith@example.com    |  19 | Electronics      |
| 103 | Alice     | Johnson  | NULL       |    3 | alice.johnson@example.com |  21 | Mechanical       |
| 104 | brod      | stud     | b          |    2 | Brod.a@example.com        |  20 | Electronics      |
+-----+-----------+----------+------------+------+---------------------------+-----+------------------+
4 rows in set (0.00 sec)

mysql> DELETE FROM Students_036
    -> WHERE PRN = 103;
Query OK, 1 row affected (0.00 sec)

mysql> SELECT * FROM Students_036;
+-----+-----------+----------+------------+------+------------------------+-----+------------------+
| PRN | FirstName | LastName | MiddleName | Year | Email                  | Age | Department       |
+-----+-----------+----------+------------+------+------------------------+-----+------------------+
| 101 | John      | Doe      | A          |    2 | john.doe@example.com   |  20 | Computer Science |
| 102 | Jane      | Smith    | B          |    2 | jane.smith@example.com |  19 | Electronics      |
| 104 | brod      | stud     | b          |    2 | Brod.a@example.com     |  20 | Electronics      |
+-----+-----------+----------+------------+------+------------------------+-----+------------------+
3 rows in set (0.00 sec)

mysql> ALTER TABLE Students_036
    -> ADD PhoneNumber VARCHAR(15);
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Students_036;
+-----+-----------+----------+------------+------+------------------------+-----+------------------+-------------+
| PRN | FirstName | LastName | MiddleName | Year | Email                  | Age | Department       | PhoneNumber |
+-----+-----------+----------+------------+------+------------------------+-----+------------------+-------------+
| 101 | John      | Doe      | A          |    2 | john.doe@example.com   |  20 | Computer Science | NULL        |
| 102 | Jane      | Smith    | B          |    2 | jane.smith@example.com |  19 | Electronics      | NULL        |
| 104 | brod      | stud     | b          |    2 | Brod.a@example.com     |  20 | Electronics      | NULL        |
+-----+-----------+----------+------------+------+------------------------+-----+------------------+-------------+
3 rows in set (0.00 sec)

mysql> ALTER TABLE Students_036
    -> DROP COLUMN PhoneNumber;
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Students_036;
+-----+-----------+----------+------------+------+------------------------+-----+------------------+
| PRN | FirstName | LastName | MiddleName | Year | Email                  | Age | Department       |
+-----+-----------+----------+------------+------+------------------------+-----+------------------+
| 101 | John      | Doe      | A          |    2 | john.doe@example.com   |  20 | Computer Science |
| 102 | Jane      | Smith    | B          |    2 | jane.smith@example.com |  19 | Electronics      |
| 104 | brod      | stud     | b          |    2 | Brod.a@example.com     |  20 | Electronics      |
+-----+-----------+----------+------------+------+------------------------+-----+------------------+
3 rows in set (0.00 sec)

mysql> SELECT DISTINCT Department
    -> FROM Students_036;
+------------------+
| Department       |
+------------------+
| Computer Science |
| Electronics      |
+------------------+
2 rows in set (0.00 sec)

mysql> SELECT COUNT(DISTINCT Department) AS DistinctDepartmentCount
    -> FROM Students_036;
+-------------------------+
| DistinctDepartmentCount |
+-------------------------+
|                       2 |
+-------------------------+
1 row in set (0.00 sec)

mysql> SELECT DISTINCT Year
    -> FROM Students_036;
+------+
| Year |
+------+
|    2 |
+------+
1 row in set (0.00 sec)

mysql> SELECT DISTINCT Age
    -> FROM Students_036
    -> WHERE Department = 'Computer Science';
+-----+
| Age |
+-----+
|  20 |
+-----+
1 row in set (0.00 sec)

mysql> SELECT DISTINCT FirstName
    -> FROM Students_036
    -> WHERE Age < 21;
+-----------+
| FirstName |
+-----------+
| John      |
| Jane      |
| brod      |
+-----------+
3 rows in set (0.00 sec)

mysql> SELECT *
    -> FROM Students_036
    -> WHERE Age > 20;
Empty set (0.00 sec)

mysql> SELECT *
    -> FROM Students_036
    -> WHERE Year = 3;
Empty set (0.00 sec)

mysql> SELECT FirstName, LastName, Department
    -> FROM Students_036
    -> WHERE PRN > 101;
+-----------+----------+-------------+
| FirstName | LastName | Department  |
+-----------+----------+-------------+
| Jane      | Smith    | Electronics |
| brod      | stud     | Electronics |
+-----------+----------+-------------+
2 rows in set (0.00 sec)

mysql> SELECT FirstName, Email
    -> FROM Students_036
    -> WHERE Department = 'Electronics';
+-----------+------------------------+
| FirstName | Email                  |
+-----------+------------------------+
| Jane      | jane.smith@example.com |
| brod      | Brod.a@example.com     |
+-----------+------------------------+
2 rows in set (0.00 sec)

mysql> SELECT *
    -> FROM Students_036
    -> WHERE Department = 'Computer Science' AND Age > 19;
+-----+-----------+----------+------------+------+----------------------+-----+------------------+
| PRN | FirstName | LastName | MiddleName | Year | Email                | Age | Department       |
+-----+-----------+----------+------------+------+----------------------+-----+------------------+
| 101 | John      | Doe      | A          |    2 | john.doe@example.com |  20 | Computer Science |
+-----+-----------+----------+------------+------+----------------------+-----+------------------+
1 row in set (0.00 sec)

mysql> DELETE FROM Students_036;
Query OK, 3 rows affected (0.01 sec)

mysql> SELECT * FROM Students_036;
Empty set (0.00 sec)

mysql> DESCRIBE Students_036;
+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| PRN        | int          | NO   | PRI | NULL    |       |
| FirstName  | varchar(50)  | NO   |     | NULL    |       |
| LastName   | varchar(50)  | NO   |     | NULL    |       |
| MiddleName | varchar(50)  | YES  |     | NULL    |       |
| Year       | int          | NO   |     | NULL    |       |
| Email      | varchar(100) | NO   |     | NULL    |       |
| Age        | int          | NO   |     | NULL    |       |
| Department | varchar(100) | NO   |     | NULL    |       |
+------------+--------------+------+-----+---------+-------+
8 rows in set (0.01 sec)

mysql> DROP TABLE Students_036;
Query OK, 0 rows affected (0.01 sec)

mysql> DESCRIBE Students_036;
ERROR 1146 (42S02): Table 'pccoe_036.students_036' doesn't exist
