create database sales;
use  sales;
create table salespeople
(snum varchar(10) Primary key  ,sname varchar(20), city varchar(30),comm varchar(20),unique(sname));
insert into salespeople
values
(1001,'Peel','London',12),
(1002 ,'Serres',' Sanjose',13),
(1004,' Motika' ,'London ',11),
(1007 ,'Rifkin' ,'Barcelona' ,15),
(1003 ,'Axelrod', 'Newyork',10);
select * from salespeople;

create table customers( cnum varchar(20) primary key,cname varchar(30), 
city varchar(20) not null, snum varchar(30),
foreign key(snum) references salespeople(snum));
insert into customers
values
(2001 ,' Hoffman',' London',1001),
(2002  ,'Giovanni' ,'Rome' ,1003),
(2003 ,' Liu', 'Sanjose', 1002),
(2004 , 'Grass', 'Berlin', 1002),
(2006 ,'Clemens' ,'London' ,1001),
(2008 ,'Cisneros', 'Sanjose', 1007),
(2007 ,'Pereira', 'Rome' ,1004);
select * from customers;

create table orders(onum varchar(30) primary key, amt varchar(30),odate date, 
cnum varchar(30), foreign key(cnum) references customers(cnum), snum varchar(30),
foreign key(snum) references salespeople(snum));
insert into orders 
values
(3001,18.69,'1990-10-3',2008,1007),
(3003,767.19,'1990-10-3',2001,1001),
(3002,1900.10,'1990-10-3',2007,1004),
(3005,5160.45,'1990-10-3',2003,1002),
(3006,1098.16,'1990-10-3',2008,1007),
(3009,1713.23,'1990-10-4',2002,1003),
(3007,75.75,'1990-10-4',2004,1002),
(3008,4273.00,'1990-10-5',2006,1001),
(3010,1309.95,'1990-10-6',2004,1002),
(3011,9891.88,'1990-10-6',2006,1001);
select * from orders;

select count(sname) from salespeople where sname like 'a%' or 'A%';
/*Display all the Salesperson whose all orders worth is more than Rs. 2000.*/
select sname from salespeople inner join orders on salespeople.snum=orders.snum where amt>2000;
 /*Count the number of Salesperson belonging to Newyork.*/
select count(sname) from salespeople where city='newyork';
select count(sname) from salespeople where city='london' or city='paris';
/*Display the number of orders taken by each Salesperson and their date of orders.*/
select Sname, count(odate) AS number_of_orders_taken, Odate from Orders
RIGHT JOIN salespeople
ON orders.Snum = SalesPeople.Snum
group by Sname;
