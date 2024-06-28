Enter password: ********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 18
Server version: 8.4.0 MySQL Community Server - GPL

Copyright (c) 2000, 2024, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
4 rows in set (0.02 sec)

mysql> create database fidha;
Query OK, 1 row affected (0.01 sec)

mysql> create table customers(age int,name varchar(20));
ERROR 1046 (3D000): No database selected
mysql> use fidha;
Database changed
mysql> create table customers(age int,name varchar(20));
Query OK, 0 rows affected (0.03 sec)

mysql> insert into customers values(18,fidha);
ERROR 1054 (42S22): Unknown column 'fidha' in 'field list'
mysql> insert into customers values(18,"fidha");
Query OK, 1 row affected (0.01 sec)

mysql> alter table customers add constraint check(age=18);
Query OK, 1 row affected (0.05 sec)
Records: 1  Duplicates: 0  Warnings: 0

mysql> select * from customers;
+------+-------+
| age  | name  |
+------+-------+
|   18 | fidha |
+------+-------+
1 row in set (0.00 sec)

mysql> alter table customers add constraint chk_age check(age=18);
Query OK, 1 row affected (0.04 sec)
Records: 1  Duplicates: 0  Warnings: 0

mysql> select * from customers;
+------+-------+
| age  | name  |
+------+-------+
|   18 | fidha |
+------+-------+
1 row in set (0.00 sec)

mysql> alter table customers add constraint chk_age check(age=18 and name="fidha");
ERROR 3822 (HY000): Duplicate check constraint name 'chk_age'.
mysql> alter table customers add constraint chk_name check(age=18 and name="
fidha");
Query OK, 1 row affected (0.04 sec)
Records: 1  Duplicates: 0  Warnings: 0

mysql> select * from customers;
+------+-------+
| age  | name  |
+------+-------+
|   18 | fidha |
+------+-------+
1 row in set (0.00 sec)

mysql> insert into customers values(21,"fidha");
ERROR 3819 (HY000): Check constraint 'chk_age' is violated.
mysql> insert into customers values(21,"nafiya");
ERROR 3819 (HY000): Check constraint 'chk_age' is violated.
mysql> alter table customers drop constraint chk_name check(age=18 and name=
"fidha");
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'check(age=18 and name="fidha")' at line 1
mysql> alter table customers drop constraint chk_name;
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table customers add constraint chk_age;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> alter table customers drop constraint chk_age;
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> insert into customers values(21,"nafiya");
ERROR 3819 (HY000): Check constraint 'customers_chk_1' is violated.
mysql> alter table customers drop constraint chk_age;
ERROR 3940 (HY000): Constraint 'chk_age' does not exist.
mysql> alter table customers drop constraint;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> alter table customers drop constraint customers_chk_1;
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> insert into customers values(21,"nafiya");
Query OK, 1 row affected (0.01 sec)

mysql> select * from customers;
+------+--------+
| age  | name   |
+------+--------+
|   18 | fidha  |
|   21 | nafiya |
+------+--------+
2 rows in set (0.00 sec)

mysql> alter table customers add constraint chk_age check(age>18);
ERROR 3819 (HY000): Check constraint 'chk_age' is violated.
mysql> alter table customers drop constraint chk_age;
ERROR 3940 (HY000): Constraint 'chk_age' does not exist.
mysql> alter table customers drop constraint chk_age;
ERROR 3940 (HY000): Constraint 'chk_age' does not exist.
mysql> insert into customers values(21,"nafiya");
Query OK, 1 row affected (0.01 sec)

mysql> create table customer(int age NULL,name varchar(10) NOT NULL));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'int age NULL,name varchar(10) NOT NULL))' at line 1
mysql> create table customer(int age is NULL,name varchar(10) is NOT NULL));

ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'int age is NULL,name varchar(10) is NOT NULL))' at line 1
mysql> create table customer(int age,name varchar(10) is NOT NULL));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'int age,name varchar(10) is NOT NULL))' at line 1
mysql> create table customer(age int is NULL,name varchar(10) is NOT NULL));

ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'is NULL,name varchar(10) is NOT NULL))' at line 1
mysql> create table customer(age int  NULL,name varchar(10) is NOT NULL));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'is NOT NULL))' at line 1
mysql> create table customer(age int  NULL,name varchar(10)  NOT NULL));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ')' at line 1
mysql> create table customer(age int  NULL,name varchar(10)  NOT NULL);
Query OK, 0 rows affected (0.02 sec)

mysql> insert into customer values(null,"fidha");
Query OK, 1 row affected (0.01 sec)

mysql> select * from customers;
+------+--------+
| age  | name   |
+------+--------+
|   18 | fidha  |
|   21 | nafiya |
|   21 | nafiya |
+------+--------+
3 rows in set (0.00 sec)

mysql> select * from customer;
+------+-------+
| age  | name  |
+------+-------+
| NULL | fidha |
+------+-------+
1 row in set (0.00 sec)

mysql> select age from customer where age is null;
+------+
| age  |
+------+
| NULL |
+------+
1 row in set (0.00 sec)

mysql> create table department(dnumber int primary key,dname varchar(15) not
 null unique,dlocation varchar(15));
Query OK, 0 rows affected (0.02 sec)

mysql> insert into departmnet(5,"Reasearch","Bellaire");
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '5,"Reasearch","Bellaire")' at line 1
mysql> insert into departmnet values(5,"Reasearch","Bellaire");
ERROR 1146 (42S02): Table 'fidha.departmnet' doesn't exist
mysql> insert into department values(5,"Reasearch","Bellaire");
Query OK, 1 row affected (0.01 sec)

mysql> insert into department values(4,"Administration","Stafford");
Query OK, 1 row affected (0.00 sec)

mysql> insert into department values(1,"Headquarters","Houston");
Query OK, 1 row affected (0.02 sec)

mysql> create table employees(ssn char(9) primary key, name varchar(20) not null,age int ,check(age between 20 and 50),address varchar(30),salary float(7,2),super_ssn char(9), foreign key(super_ssn) references employees(ssn),dnumber int default 5, foreign key(dnumber) references department(dnumber));
Query OK, 0 rows affected, 1 warning (0.03 sec)

mysql> insert into employees values(888665555,"James E Borg",45,"450 Stone Houston TX",55000,null,1);
Query OK, 1 row affected (0.01 sec)

mysql> insert into employees values(333445555,"Franklin T Wong",42,"638 Voss Houston TX",40000,888665555,5);
Query OK, 1 row affected (0.01 sec)

mysql> insert into employees VALUES (123456789, "Jhon B Smith", 37, "731 Fondren Houston TX", 30000, 333445555, 5);
Query OK, 1 row affected (0.00 sec)

mysql>
mysql> select * from employees;
+-----------+--------------------+------+------------------------+----------+-----------+---------+
| ssn       | name               | age  | address                | salary   | super_ssn | dnumber |
+-----------+--------------------+------+------------------------+----------+-----------+---------+
| 123456789 | Jhon B Smith       |   37 | 731 Fondren Houston TX | 30000.00 | 333445555 |       5 |
| 333445555 | Franklin T Wong    |   42 | 638 Voss Houston TX    | 40000.00 | 888665555 |       5 |
| 453453453 | Joyce A English    |   28 | 5631 Rice Houston TX   | 25000.00 | 333445555 |       5 |
| 666884444 | Ramesh K Narayan   |   35 | 975 Fire Oak Humple TX | 38000.00 | 333445555 |       5 |
| 888665555 | James E Borg       |   45 | 450 Stone Houston TX   | 55000.00 | NULL      |       1 |
| 987654321 | Jennifer S Wallace |   25 | 291 Berry Billaire TX  | 43000.00 | 888665555 |       4 |
| 987987987 | Ahmad V Jabbar     |   22 | 980 Dallas Houston TX  | 25000.00 | 987654321 |       4 |
| 999887777 | Alicia J Zelaya    |   31 | 3321 castle Spring TX  | 25000.00 | 987654321 |       4 |
+-----------+--------------------+------+------------------------+----------+-----------+---------+
8 rows in set (0.00 sec)

mysql> select employees.ssn,employees.name,employees.salary,department.dname from employees join department where department.dnumber=employees.dnumber and (dname="Reasearch" or salary>40000.00);
+-----------+--------------------+----------+----------------+
| ssn       | name               | salary   | dname          |
+-----------+--------------------+----------+----------------+
| 987654321 | Jennifer S Wallace | 43000.00 | Administration |
| 888665555 | James E Borg       | 55000.00 | Headquarters   |
| 123456789 | Jhon B Smith       | 30000.00 | Reasearch      |
| 333445555 | Franklin T Wong    | 40000.00 | Reasearch      |
| 453453453 | Joyce A English    | 25000.00 | Reasearch      |
| 666884444 | Ramesh K Narayan   | 38000.00 | Reasearch      |
+-----------+--------------------+----------+----------------+
6 rows in set (0.00 sec)

