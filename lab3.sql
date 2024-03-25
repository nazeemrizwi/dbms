
alter table orders add primary key (orderid);
desc orders;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| orderid   | int         | NO   | PRI | NULL    |       |
| custid    | int         | YES  |     | NULL    |       |
| custname  | varchar(25) | YES  |     | NULL    |       |
| orderdate | date        | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+

alter table product add primary key (pid);
desc product;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| pid     | int         | NO   | PRI | NULL    |       |
| pname   | varchar(25) | YES  |     | NULL    |       |
| orderid | int         | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+

alter table product add foreign key(orderid)references orders(orderid);
desc product;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| pid     | int         | NO   | PRI | NULL    |       |
| pname   | varchar(25) | YES  |     | NULL    |       |
| orderid | int         | YES  | MUL | NULL    |       |
+---------+-------------+------+-----+---------+-------+
select product .pname,orders.orderid from product join orders on product.orderid=orders.orderid;
+----------+---------+
| pname    | orderid |
+----------+---------+
| laptop   |       1 |
| lipstick |       5 |
| book     |       6 |
| glass    |       7 |
| pen      |       9 |
+----------+---------+
