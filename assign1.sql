pccoe@pc-15:~$ sudo mysql
[sudo] password for pccoe: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.40-0ubuntu0.22.04.1 (Ubuntu)

Copyright (c) 2000, 2024, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> create database college ;
Query OK, 1 row affected (0.11 sec)

mysql> use college ;
Database changed
mysql> create table student(roll_num integer(10) , name varchar(10) , phone integer(10));
Query OK, 0 rows affected, 2 warnings (0.52 sec)

mysql> insert into student values(1 , 'xyz', 1234567890);
Query OK, 1 row affected (0.11 sec)

mysql> select * from student ;
+----------+------+------------+
| roll_num | name | phone      |
+----------+------+------------+
|        1 | xyz  | 1234567890 |
+----------+------+------------+
1 row in set (0.00 sec)

mysql> insert into student values(2 , 'uvw', 0123456789);
Query OK, 1 row affected (0.11 sec)

mysql> insert into student values(2 , 'pqr', 9876543210);
ERROR 1264 (22003): Out of range value for column 'phone' at row 1
mysql> select * from student ;
+----------+------+------------+
| roll_num | name | phone      |
+----------+------+------------+
|        1 | xyz  | 1234567890 |
|        2 | uvw  |  123456789 |
+----------+------+------------+
2 rows in set (0.00 sec)

mysql> insert into student values(3 , 'pqr', 987654321);
Query OK, 1 row affected (0.08 sec)

mysql> select * from student ;
+----------+------+------------+
| roll_num | name | phone      |
+----------+------+------------+
|        1 | xyz  | 1234567890 |
|        2 | uvw  |  123456789 |
|        3 | pqr  |  987654321 |
+----------+------+------------+
3 rows in set (0.00 sec)

mysql> update student set name = 'abc' where roll_num = 1 ;
Query OK, 1 row affected (0.12 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from student ;
+----------+------+------------+
| roll_num | name | phone      |
+----------+------+------------+
|        1 | abc  | 1234567890 |
|        2 | uvw  |  123456789 |
|        3 | pqr  |  987654321 |
+----------+------+------------+
3 rows in set (0.00 sec)

mysql> select roll_num from student;
+----------+
| roll_num |
+----------+
|        1 |
|        2 |
|        3 |
+----------+
3 rows in set (0.00 sec)

mysql> delete from student  where roll_num = 1 ;
Query OK, 1 row affected (0.10 sec)

mysql> select * from student ;
+----------+------+-----------+
| roll_num | name | phone     |
+----------+------+-----------+
|        2 | uvw  | 123456789 |
|        3 | pqr  | 987654321 |
+----------+------+-----------+
2 rows in set (0.00 sec)

mysql> truncate table student ;
Query OK, 0 rows affected (1.15 sec)

mysql> select * from student ;
Empty set (0.00 sec)

