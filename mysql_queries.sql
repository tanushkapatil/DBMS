mysql> create database college ;
Query OK, 1 row affected (0.01 sec)

mysql> use college ;
Database changed
mysql> create table student(roll_num integer(10) , name varchar(10) , phone integer(10));
Query OK, 0 rows affected, 2 warnings (0.04 sec)

mysql> insert into student values(1 , 'xyz', 1234567890);
Query OK, 1 row affected (0.03 sec)

mysql>  select * from student ;
+----------+------+------------+
| roll_num | name | phone      |
+----------+------+------------+
|        1 | xyz  | 1234567890 |
+----------+------+------------+
1 row in set (0.00 sec)

mysql> insert into student values(2 , 'uvw', 0123456789);
Query OK, 1 row affected (0.01 sec)

mysql> insert into student values(3 , 'pqr', 987654321);
Query OK, 1 row affected (0.03 sec)

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
Query OK, 1 row affected (0.01 sec)
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
Query OK, 1 row affected (0.02 sec)

mysql> select * from student ;
+----------+------+-----------+
| roll_num | name | phone     |
+----------+------+-----------+
|        2 | uvw  | 123456789 |
|        3 | pqr  | 987654321 |
+----------+------+-----------+
2 rows in set (0.00 sec)

mysql> truncate table student ;
Query OK, 0 rows affected (0.18 sec)

mysql> select * from student ;
Empty set (0.00 sec)

mysql> notee;
