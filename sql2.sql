
mysql> create database devop;
Query OK, 1 row affected (0.01 sec)

mysql> create table categories(category_id int primary key,name  varchar(50) not null,parent_category int ,foreign key (parent_category references categories(category_id));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'references categories(category_id))' at line 1
mysql> create table categories(category_id int primary key,name  varchar(50) not null,parent_category int ,foreign key (parent_category) references categories(category_id));
ERROR 1046 (3D000): No database selected
mysql> use devop;
Database changed
mysql> create table categories(category_id int primary key,name  varchar(50) not null,parent_category int ,foreign key (parent_category) references categories(category_id));
Query OK, 0 rows affected (0.03 sec)

mysql> create table products(product_id int primary key,name varchar(50) not null unique,price float(6,2) default 100.00,category_id int,foreign key(category_id) references categories(category_id),quantity int);
Query OK, 0 rows affected, 1 warning (0.03 sec)

mysql> insert into categories values(1,"phones",NULL);
Query OK, 1 row affected (0.01 sec)

mysql> insert into categories values(2,"laptops",NULL);
Query OK, 1 row affected (0.01 sec)

mysql> insert into categories values(3,"consoles",NULL);
Query OK, 1 row affected (0.01 sec)

mysql> insert into categories values(4,"iphones",1);
Query OK, 1 row affected (0.00 sec)

mysql> insert into categories values(5,"windows",2);
Query OK, 1 row affected (0.01 sec)

mysql> insert into categories values(6,"xbox",3);
Query OK, 1 row affected (0.01 sec)

mysql> isert into products values(1,"iphone 12",999.99,4,10);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'isert into products values(1,"iphone 12",999.99,4,10)' at line 1
mysql> insert into products values(1,"iphone 12",999.99,4,10);
Query OK, 1 row affected (0.01 sec)

mysql> insert into products values(2,"mac book pro",1999.99,2,5);
Query OK, 1 row affected (0.01 sec)

mysql> insert into products values(3,"dell xps 15",1599.99,5,8);
Query OK, 1 row affected (0.01 sec)

mysql> insert into products values(4,"sony play station 5",499.99,3,20);
Query OK, 1 row affected (0.01 sec)

mysql> insert into products values(5,"nintendo",149.99,3,12);
Query OK, 1 row affected (0.01 sec)

mysql> insert into products values(6,"xbox series x",499.99,6);
ERROR 1136 (21S01): Column count doesn't match value count at row 1
mysql> insert into products values(6,"xbox series x",499.99,6,NULL);
Query OK, 1 row affected (0.01 sec)

mysql> alter table products add constraint chk_price where price between (0 and 3000)
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'where price between (0 and 3000)' at line 1
mysql> alter table products add constraint "chk_price" where price between (0 and 3000);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '"chk_price" where price between (0 and 3000)' at line 1
mysql> alter table products add constraint chk_price check (price between 0 and 3000);
Query OK, 6 rows affected (0.06 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> select *from products where name like "%o%";
+------------+---------------------+---------+-------------+----------+
| product_id | name                | price   | category_id | quantity |
+------------+---------------------+---------+-------------+----------+
|          1 | iphone 12           |  999.99 |           4 |       10 |
|          2 | mac book pro        | 1999.99 |           2 |        5 |
|          4 | sony play station 5 |  499.99 |           3 |       20 |
|          5 | nintendo            |  149.99 |           3 |       12 |
|          6 | xbox series x       |  499.99 |           6 |     NULL |
+------------+---------------------+---------+-------------+----------+
5 rows in set (0.00 sec)

mysql> select name from products where (select consoles from categories) order by name desc;
ERROR 1054 (42S22): Unknown column 'consoles' in 'field list'
mysql> select name from products where category_id=(select category_id from categories where name="consoles") order by name desc;
+---------------------+
| name                |
+---------------------+
| sony play station 5 |
| nintendo            |
+---------------------+
2 rows in set (0.00 sec)

mysql> select p.name from products p join categories c on p.category_id=c.category_id where c.name="consoles";
+---------------------+
| name                |
+---------------------+
| sony play station 5 |
| nintendo            |
+---------------------+
2 rows in set (0.00 sec)

mysql> select c.category_id,c.name,count(p.name) as totalcount from categories c join products p on c.category_id=p.category_id ;
ERROR 1140 (42000): In aggregated query without GROUP BY, expression #1 of SELECT list contains nonaggregated column 'devop.c.category_id'; this is incompatible with sql_mode=only_full_group_by
mysql> select c.category_id,c.name,count(p.name) as totalcount from categories c join products p on c.category_id=p.category_id group by c.name;
ERROR 1055 (42000): Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'devop.c.category_id' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by
mysql> select c.category_id,c.name,count(p.name) as totalcount from categories c join products p on c.category_id=p.category_id group by c.name having count(p.name);
ERROR 1055 (42000): Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'devop.c.category_id' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by
mysql> select c.category_id,c.name,count(p.product_id) as totalcount from categories c join products p on c.category_id=p.category_id group by c.category_id,c.name;
+-------------+----------+------------+
| category_id | name     | totalcount |
+-------------+----------+------------+
|           2 | laptops  |          1 |
|           3 | consoles |          2 |
|           4 | iphones  |          1 |
|           5 | windows  |          1 |
|           6 | xbox     |          1 |
+-------------+----------+------------+
5 rows in set (0.00 sec)

mysql> select c.category_id,c.name,count(p.product_id) as totalcount from categories c join products p on c.category_id=p.category_id group by c.category_id;
+-------------+----------+------------+
| category_id | name     | totalcount |
+-------------+----------+------------+
|           2 | laptops  |          1 |
|           3 | consoles |          2 |
|           4 | iphones  |          1 |
|           5 | windows  |          1 |
|           6 | xbox     |          1 |
+-------------+----------+------------+
5 rows in set (0.00 sec)

mysql> select c.name,sum(p.quatity) as total_qty from categories c join products p on c.category_id=p.category_id group by c.category_id having sum(p.quatity)>15;
ERROR 1054 (42S22): Unknown column 'p.quatity' in 'field list'
mysql> select c.name,sum(p.quatity) as total_qty from categories c join products p on c.category_id=p.category_id group by c.category_id having sum(p.quanti
ty)>15;
ERROR 1054 (42S22): Unknown column 'p.quatity' in 'field list'
mysql> select c.name,sum(p.quantity) as total_qty from categories c join products p on c.category_id=p.category_id group by c.category_id having sum(p.quant
ity)>15;
+----------+-----------+
| name     | total_qty |
+----------+-----------+
| consoles |        32 |
+----------+-----------+
1 row in set (0.00 sec)

mysql> select p.product_id,p.name from categories c join products p on c.category_id=p.category_id where c.parent_category is null;
+------------+---------------------+
| product_id | name                |
+------------+---------------------+
|          2 | mac book pro        |
|          4 | sony play station 5 |
|          5 | nintendo            |
+------------+---------------------+
3 rows in set (0.00 sec)

mysql> select p.product_id,p.name from categories c left join products p on c.category_id=p.category_id where c.parent_category is null;
+------------+---------------------+
| product_id | name                |
+------------+---------------------+
|       NULL | NULL                |
|          2 | mac book pro        |
|          4 | sony play station 5 |
|          5 | nintendo            |
+------------+---------------------+
4 rows in set (0.00 sec)

mysql> select p.product_id,p.name from categories c join products p on c.category_id=p.category_id where c.parent_category is null;
+------------+---------------------+
| product_id | name                |
+------------+---------------------+
|          2 | mac book pro        |
|          4 | sony play station 5 |
|          5 | nintendo            |
+------------+---------------------+
3 rows in set (0.00 sec)

mysql> create view as viewproductslist select as p.products_id,p.name,c.name as category,p.price,p.quantity from products p join categories c on p.category_
id=c.category_id;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'as viewproductslist select as p.products_id,p.name,c.name as category,p.price,p.' at line 1
mysql> create view  viewproductslist select as p.products_id,p.name,c.name as category,p.price,p.quantity from products p join categories c on p.category_id
=c.category_id;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'select as p.products_id,p.name,c.name as category,p.price,p.quantity from produc' at line 1
mysql> create view  viewproductslist as select p.products_id,p.name,c.name as category,p.price,p.quantity from products p join categories c on p.category_id
=c.category_id;
ERROR 1054 (42S22): Unknown column 'p.products_id' in 'field list'
mysql> create view  viewproductslist as select p.product_id,p.name,c.name as category,p.price,p.quantity from products p join categories c on p.category_id=
c.category_id;
Query OK, 0 rows affected (0.01 sec)

mysql> select * from viewproductslist;
+------------+---------------------+----------+---------+----------+
| product_id | name                | category | price   | quantity |
+------------+---------------------+----------+---------+----------+
|          1 | iphone 12           | iphones  |  999.99 |       10 |
|          2 | mac book pro        | laptops  | 1999.99 |        5 |
|          3 | dell xps 15         | windows  | 1599.99 |        8 |
|          4 | sony play station 5 | consoles |  499.99 |       20 |
|          5 | nintendo            | consoles |  149.99 |       12 |
|          6 | xbox series x       | xbox     |  499.99 |     NULL |
+------------+---------------------+----------+---------+----------+
6 rows in set (0.00 sec)

mysql> create procedure updateproductprices(in consolename varchar,percentage float)
    -> begin
    -> update products set price=price*(1+percentage/100)
    -> where category_id=(select category_id from categories where name=consolename);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ',percentage float)
begin
update products set price=price*(1+percentage/100)
wher' at line 1
mysql> delimiter //
mysql> create procedure updateproductprices(in consolename varchar(50),percentage float)
    -> begin
    -> update products set price=price*(1+percentage/100)
    -> where category_id=(select category_id from categories where name=consolename);
    -> delimiter //
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 5
mysql> delimiter //
mysql> create procedure updateproductprices(in consolename varchar(50),percentage float)
    -> begin
    -> update products set price=price*(1+percentage/100)
    -> where category_id=(select category_id from categories where name=consolename);
    -> end;
    -> //
Query OK, 0 rows affected (0.02 sec)

mysql> call updateproductprices("consoles",2.5);
    -> //
Query OK, 2 rows affected (0.03 sec)

mysql> select * updateproductprices;
    -> //
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'updateproductprices' at line 1
mysql> select * from updateproductprices;
    -> //
ERROR 1146 (42S02): Table 'devop.updateproductprices' doesn't exist
mysql> select updateproductprices;
    -> //
ERROR 1054 (42S22): Unknown column 'updateproductprices' in 'field list'
mysql> exec updateproductprices "consoles",2.5;
    -> //
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'exec updateproductprices "consoles",2.5' at line 1
mysql> select * from categories;
    -> //
+-------------+----------+-----------------+
| category_id | name     | parent_category |
+-------------+----------+-----------------+
|           1 | phones   |            NULL |
|           2 | laptops  |            NULL |
|           3 | consoles |            NULL |
|           4 | iphones  |               1 |
|           5 | windows  |               2 |
|           6 | xbox     |               3 |
+-------------+----------+-----------------+
6 rows in set (0.00 sec)

mysql> select * from products;
    -> //
+------------+---------------------+---------+-------------+----------+
| product_id | name                | price   | category_id | quantity |
+------------+---------------------+---------+-------------+----------+
|          1 | iphone 12           |  999.99 |           4 |       10 |
|          2 | mac book pro        | 1999.99 |           2 |        5 |
|          3 | dell xps 15         | 1599.99 |           5 |        8 |
|          4 | sony play station 5 |  512.49 |           3 |       20 |
|          5 | nintendo            |  153.74 |           3 |       12 |
|          6 | xbox series x       |  499.99 |           6 |     NULL |
+------------+---------------------+---------+-------------+----------+
6 rows in set (0.00 sec)

mysql> select * from categories;
    -> delimiter;
    -> //
+-------------+----------+-----------------+
| category_id | name     | parent_category |
+-------------+----------+-----------------+
|           1 | phones   |            NULL |
|           2 | laptops  |            NULL |
|           3 | consoles |            NULL |
|           4 | iphones  |               1 |
|           5 | windows  |               2 |
|           6 | xbox     |               3 |
+-------------+----------+-----------------+
6 rows in set (0.00 sec)

ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'delimiter' at line 1
mysql> select * from products;
    -> //
+------------+---------------------+---------+-------------+----------+
| product_id | name                | price   | category_id | quantity |
+------------+---------------------+---------+-------------+----------+
|          1 | iphone 12           |  999.99 |           4 |       10 |
|          2 | mac book pro        | 1999.99 |           2 |        5 |
|          3 | dell xps 15         | 1599.99 |           5 |        8 |
|          4 | sony play station 5 |  512.49 |           3 |       20 |
|          5 | nintendo            |  153.74 |           3 |       12 |
|          6 | xbox series x       |  499.99 |           6 |     NULL |
+------------+---------------------+---------+-------------+----------+
6 rows in set (0.00 sec)

mysql>
