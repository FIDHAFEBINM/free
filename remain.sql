mysql> select d.dnumber,d.dname,sum(e.salary) from department d join  employees e on d.dnumber=e.dnumber where e.age>30 group by d.dnumber,d.dname having sum(e.salary)>100000.00 order by d.dname desc ;
+---------+----------+---------------+
| dnumber | dname    | sum(e.salary) |
+---------+----------+---------------+
|       5 | Research |     108000.00 |
+---------+----------+---------------+
1 row in set (0.01 sec)
mysql> create view empdept as select e.ssn,e.name,e.dnumber,d.dname,e.super_ssn,e.salary from employees e join department d on e.dnumber=d.dnumber;
Query OK, 0 rows affected (0.01 sec)

mysql> select * from empdept;
+-----------+--------------------+---------+----------------+-----------+----------+
| ssn       | name               | dnumber | dname          | super_ssn | salary   |
+-----------+--------------------+---------+----------------+-----------+----------+
| 987654321 | Jennifer S Wallace |       4 | Administration | 888665555 | 43000.00 |
| 987987987 | Ahmad V Jabbar     |       4 | Administration | 987654321 | 25000.00 |
| 999887777 | Alicia J Zelaya    |       4 | Administration | 987654321 | 25000.00 |
| 888665555 | James E Borg       |       1 | Headquarters   | NULL      | 55000.00 |
| 123456789 | Jhon B Smith       |       5 | Research       | 333445555 | 30000.00 |
| 333445555 | Franklin T Wong    |       5 | Research       | 888665555 | 40000.00 |
| 453453453 | Joyce A English    |       5 | Research       | 333445555 | 25000.00 |
| 666884444 | Ramesh K Narayan   |       5 | Research       | 333445555 | 38000.00 |
+-----------+--------------------+---------+----------------+-----------+----------+
8 rows in set (0.00 sec)

mysql> create view empdept as select e.ssn,e.name,e.dnumber,d.dname,s.name as super_ssn_name,e.salary from employees e join department d on e.dnumber=d.
dnumber left join employees s on e.super_ssn=s.ssn;
ERROR 1050 (42S01): Table 'empdept' already exists
mysql> create view empdepts as select e.ssn,e.name,e.dnumber,d.dname,s.name as super_ssn_name,e.salary from employees e join department d on e.dnumber=d.dnumber left join employees s on e.super_ssn=s.ssn;
Query OK, 0 rows affected (0.01 sec)

mysql> select * from empdepts;
+-----------+--------------------+---------+----------------+--------------------+----------+
| ssn       | name               | dnumber | dname          | super_ssn_name     | salary   |
+-----------+--------------------+---------+----------------+--------------------+----------+
| 987654321 | Jennifer S Wallace |       4 | Administration | James E Borg       | 43000.00 |
| 987987987 | Ahmad V Jabbar     |       4 | Administration | Jennifer S Wallace | 25000.00 |
| 999887777 | Alicia J Zelaya    |       4 | Administration | Jennifer S Wallace | 25000.00 |
| 888665555 | James E Borg       |       1 | Headquarters   | NULL
     | 55000.00 |
| 123456789 | Jhon B Smith       |       5 | Research       | Franklin T Wong    | 30000.00 |
| 333445555 | Franklin T Wong    |       5 | Research       | James E Borg       | 40000.00 |
| 453453453 | Joyce A English    |       5 | Research       | Franklin T Wong    | 25000.00 |
| 666884444 | Ramesh K Narayan   |       5 | Research       | Franklin T Wong    | 38000.00 |
+-----------+--------------------+---------+----------------+--------------------+----------+
8 rows in set (0.00 sec)

