mysql> select d.dnumber,d.dname,sum(e.salary) from department d join  employees e on d.dnumber=e.dnumber where e.age>30 group by d.dnumber,d.dname having sum(e.salary)>100000.00 order by d.dname desc ;
+---------+----------+---------------+
| dnumber | dname    | sum(e.salary) |
+---------+----------+---------------+
|       5 | Research |     108000.00 |
+---------+----------+---------------+
1 row in set (0.01 sec)
