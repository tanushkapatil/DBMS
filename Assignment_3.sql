mysql> CREATE DATABASE StudentManagement;
Query OK, 1 row affected (0.02 sec)

mysql> USE StudentManagement;
Database changed
mysql> CREATE TABLE Courses (
    ->     CourseID INT PRIMARY KEY NOT NULL,
    ->     CourseName VARCHAR(100) NOT NULL UNIQUE,
    ->     Credits INT DEFAULT 3
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> CREATE TABLE Students (
    ->     StudentID INT PRIMARY KEY NOT NULL,
    ->     FirstName VARCHAR(50) NOT NULL,
    ->     LastName VARCHAR(50),
    ->     Email VARCHAR(100) UNIQUE,
    ->     DOB DATE NOT NULL,
    ->     CourseID INT,
    ->     FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) ON DELETE SET NULL
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> SHOW TABLES;
+-----------------------------+
| Tables_in_studentmanagement |
+-----------------------------+
| courses                     |
| students                    |
+-----------------------------+
2 rows in set (0.02 sec)

mysql> INSERT INTO Courses (CourseID, CourseName, Credits) VALUES
    -> (1, 'Computer Science', 3),
    -> (2, 'Electronics', 3),
    -> (3, 'Mechanical Engineering', 4);
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Courses;
+----------+------------------------+---------+
| CourseID | CourseName             | Credits |
+----------+------------------------+---------+
|        1 | Computer Science       |       3 |
|        2 | Electronics            |       3 |
|        3 | Mechanical Engineering |       4 |
+----------+------------------------+---------+
3 rows in set (0.00 sec)

mysql> INSERT INTO Students (StudentID, FirstName, LastName, Email, DOB, CourseID) VALUES
    -> (101, 'John', 'Doe', 'john.doe@example.com', '2002-05-14', 1),
    -> (102, 'Jane', 'Smith', 'jane.smith@example.com', '1999-08-22', 2),
    -> (103, 'Alice', 'Johnson', 'alice.johnson@example.com', '2001-11-10', 3);
Query OK, 3 rows affected (0.01 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM Students;
+-----------+-----------+----------+---------------------------+------------+----------+
| StudentID | FirstName | LastName | Email                     | DOB        | CourseID |
+-----------+-----------+----------+---------------------------+------------+----------+
|       101 | John      | Doe      | john.doe@example.com      | 2002-05-14 |        1 |
|       102 | Jane      | Smith    | jane.smith@example.com    | 1999-08-22 |        2 |
|       103 | Alice     | Johnson  | alice.johnson@example.com | 2001-11-10 |        3 |
+-----------+-----------+----------+---------------------------+------------+----------+
3 rows in set (0.00 sec)

mysql> INSERT INTO Students (StudentID, FirstName, LastName, Email, DOB, CourseID)
    -> VALUES (104, NULL, 'Brown', 'brown@example.com', '2003-07-19', 1);
ERROR 1048 (23000): Column 'FirstName' cannot be null

mysql> INSERT INTO Students (StudentID, FirstName, LastName, Email, DOB, CourseID)
    -> VALUES (105, 'Chris', 'Evans', 'john.doe@example.com', '2001-01-01', 2);
ERROR 1062 (23000): Duplicate entry 'john.doe@example.com' for key 'students.Email'

mysql> INSERT INTO Students (StudentID, FirstName, LastName, Email, DOB, CourseID)
    -> VALUES (106, 'Tom', 'Holland', 'tom.holland@example.com', '2002-06-15', 99);
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`studentmanagement`.`students`, CONSTRAINT `students_ibfk_1` FOREIGN KEY (`CourseID`) REFERENCES `courses` (`CourseID`) ON DELETE SET NULL)

mysql> SELECT FirstName, LastName, DOB FROM Students WHERE DOB > '2000-01-01';
+-----------+----------+------------+
| FirstName | LastName | DOB        |
+-----------+----------+------------+
| John      | Doe      | 2002-05-14 |
| Alice     | Johnson  | 2001-11-10 |
+-----------+----------+------------+
2 rows in set (0.00 sec)

mysql> UPDATE Courses SET Credits = 4 WHERE CourseName = 'Computer Science';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM Courses;
+----------+------------------------+---------+
| CourseID | CourseName             | Credits |
+----------+------------------------+---------+
|        1 | Computer Science       |       4 |
|        2 | Electronics            |       3 |
|        3 | Mechanical Engineering |       4 |
+----------+------------------------+---------+
3 rows in set (0.00 sec)

mysql> DELETE FROM Students WHERE Email = 'test@example.com';
Query OK, 0 rows affected (0.00 sec)

mysql> SELECT * FROM Students;
+-----------+-----------+----------+---------------------------+------------+----------+
| StudentID | FirstName | LastName | Email                     | DOB        | CourseID |
+-----------+-----------+----------+---------------------------+------------+----------+
|       101 | John      | Doe      | john.doe@example.com      | 2002-05-14 |        1 |
|       102 | Jane      | Smith    | jane.smith@example.com    | 1999-08-22 |        2 |
|       103 | Alice     | Johnson  | alice.johnson@example.com | 2001-11-10 |        3 |
+-----------+-----------+----------+---------------------------+------------+----------+
3 rows in set (0.00 sec)

mysql> SELECT FirstName, LastName FROM Students WHERE CourseID IS NULL;
Empty set (0.00 sec)

mysql> INSERT INTO Students (StudentID, FirstName, LastName, Email, DOB, CourseID)
    -> VALUES (107, 'Emma', 'Watson', 'john.doe@example.com', '2000-09-15', 1);
ERROR 1062 (23000): Duplicate entry 'john.doe@example.com' for key 'students.Email'
  
mysql> INSERT INTO Students (StudentID, FirstName, LastName, Email, DOB, CourseID)
    -> VALUES (108, 'Robert', 'Downey', 'robert.downey@example.com', '2003-04-04', 999);
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`studentmanagement`.`students`, CONSTRAINT `students_ibfk_1` FOREIGN KEY (`CourseID`) REFERENCES `courses` (`CourseID`) ON DELETE SET NULL)

