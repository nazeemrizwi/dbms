
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

create table course(staffid int,cusno int,cusname varchar(25),primary key(staffid));
insert into course values(101,991,"manu");
insert into course values(102,221,"marya");
insert into course values(103,333,"maya");
insert into course values(104,343,"riya");
insert into course values(105,443,"kiran");
CREATE TABLE facuality (fno INT PRIMARY KEY,fname VARCHAR(25),staffid INT,FOREIGN KEY (staffid) REFERENCES course(staffid));
insert into facuality values(201,"rony",101);
insert into facuality values(202,"sunny",102);
insert into facuality values(203,"saya",103);
insert into facuality values(204,"saya",104); 
insert into facuality values(205,"saya",105);
SELECT staffid, cusname FROM course o WHERE EXISTS (SELECT 1 FROM facuality p WHERE p.staffid = o.staffid);

