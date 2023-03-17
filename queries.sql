create table books(bookid char(5) constraint books_bookid_pk primary key, bookname varchar(30) not null, authorname varchar(30),price float,publishdate datetime,
publishname varchar(30) constraint books_publishname_UNQ UNIQUE
, category varchar(20), booklang varchar(20));

insert into books values
('B110','C++','Yashwant', 123.5,'12.01.2000','BPB Publication', 'Techincal', 'English'),
('B111','C++','Yashwant', 123.5,'12.01.2000','BPB Publication', 'Techincal', 'English');

select * from books where bookid='b1101';

select * from books where price > 650 and publishname= 'Tata McgrawHills';
select * from books where price > 650 or publishname= 'Tata McgrawHills';

select bookname  'Name of book',publishname  'publisher name' from books;
select bookname,publishname from books;
use nidhi_hr;
select job,mgr 'Manager' from emp;

select * from books where bookname like '[cp]%'
select * from books where bookname like '[c-p]%';
select * from emp;
select * from emp where ename like '[SA]%'

select * from emp where ename like 'SA%'  
select * from emp where ename like '%[sq]%'
select bookname from books where price is null;

select bookname, price, isnull(price,1)*.1 'Discount' from books;
select ename,sal, comm,isnull(comm,0)+sal ' Total Salary' from emp;

select distinct job from emp;

--date functions
select getDate();
select cast(getdate() as date)
select cast(getdate() as time)

select day(getdate());
select datename(month,hiredate) from emp;


select datediff(month,'12-01-2022','10-01-2023')
select dateadd(month,5,'12-01-2022')


--string functions
select * from emp;
select concat(ename,job) 'ename+job'from emp;
select lower(ename) from emp;
select lower(concat(ename,job)) 'ename+job'from emp;
--substring(columnname, startingpoition, no of characters)
select ename, left(ename,2), right(ename,2),substring(ename,2,3) from emp;


create table genetate1(p_name varchar(20), phone varchar(10));
insert into genetate1 values('Ashish', '987654329'),('Manisha', '56789056'); 
select * from genetate1

select concat(substring(p_name, 1,4),right(phone,4)) from genetate1;

select concat(reverse(p_name),right(phone,4)) from genetate1

select len(p_name) from genetate

select len('  Kavita');

select len(ltrim('  Kavita'));
select len('  Kavita   ')
select len(rtrim('  Kavita  '));

select len(ltrim('kavita'));
select * from emp;

select Upper(left(ename,1))+ lower(substring(ename,2,len(ename))) +' '+Upper(left(job,1))+ lower(substring(job,2,len(ename))) from emp;


select Upper(left(ename,1)) from emp;
select lower(substring(ename,2,len(ename))) from emp;

select Upper(left(ename,1))+lower(substring(ename,2,len(ename))) from emp;

select Upper(left(job,1))+lower(substring(job,2,len(job))) from emp;

select Upper(left(ename,1))+lower(substring(ename,2,len(ename))) +  Upper(left(job,1))+lower(substring(job,2,len(job))) from emp;

select Upper(left(ename,1))+lower(substring(ename,2,len(ename))) + ' '+ Upper(left(job,1))+lower(substring(job,2,len(job))) from emp;


----------------------------------------------------------------------------------------------------------------------------------
--DDL- Data definition language create, alter, drop, truncate,rename
-- create- columname,data types, length, constraints
--constraints  primary key, foreign key, unique, not null, check
-- we create constraints in 2 ways 1) column level, table level

create table demo( rollno int primary key identity(1,1), -- column level constraint
name varchar(20) unique, 
age int check(age>0),
city varchar(15) default 'Delhi');
-- drop remove design as well as records
drop table demo;


insert into demo(name,age)values('Arushi',12);
select * from demo;
insert into demo(name,age,city)values('Anushka',12,'Mumbai');
-- composite key - combination of 2 columns for primary key
create table stud_grade(
	rollno int ,
	course varchar(20),
	grade char(4),
	primary key(rollno,course) --table level constraint
	
	
	);


Create Table Books(BookId char(5) Primary Key check(BookId Like 'B[0-9][0-9][0-9][0-9]'),
BookName varchar(40) Not Null, AuthorName varchar(40) , Price SmallInt check( Price >0),
Publish_Date smallDateTime , Publisher_Name varchar(40) Not Null,category varchar(25) , 
BookLanguage varchar(20))

CREATE TABLE CUSTOMER (
CUSTOMERID INT NOT NULL CONSTRAINT CUSTOMER_CUSTOMERID_PK PRIMARY KEY,
CUSTOMERNAME VARCHAR(20) NOT NULL ,
CUSTOMERADDRESS VARCHAR(20) NULL CONSTRAINT CUSTOMER_CUSTOMERADDRESS_CHK 
CHECK (CUSTOMERADDRESS IN ('MUMBAI', 'DELHI','PUNE'))

CREATE TABLE ORDERS (
ORDERYEAR INT NOT NULL,
ORDERMONTH INT NOT NULL,
ORDERID INT NOT NULL,
ORDERDATE DATETIME DEFAULT GETDATE() NULL,
PRODUCTID INT NULL,
CUSTOMERID INT NULL,
ORDERQTY INT NOT NULL CONSTRAINT ORDERS_ORDERQTY_CHK
CHECK (ORDERQTY > 0),
CONSTRAINT ORDERS_YEAR_MONTH_ID_PK PRIMARY KEY (ORDERYEAR, ORDERMONTH, ORDERID),
CONSTRAINT ORDERS_PRODUCTID_FK FOREIGN KEY (PRODUCTID) REFERENCES PRODUCT (PRODUCTID) ,
CONSTRAINT ORDERS_CUSTOMERID_FK FOREIGN KEY (CUSTOMERID) REFERENCES CUSTOMER (CUSTOMERID)
)
)

----------------------------------------------------------------------
select * from demo;
-- it is used to delete all records from a table
truncate table demo;

create table demo( rollno int primary key identity(1,1), -- column level constraint
name varchar(20) unique, 
age int check(age>0),
city varchar(15) default 'Delhi');

-- add phne number in demo table
alter table demo add phone varchar(10) not null;

alter table demo alter column phone int;

alter table demo drop column age;


create table stud_grade(
	rollno int ,
	course varchar(20),
	grade char(4),
	primary key(rollno,course) --table level constraint
	
	
	);
alter table stud_grade drop column grade;
select * from emp;

alter table order drop constraint ORDERS_CUSTOMERID_FK;

----------------------------------------------------------------------------------------------------------------------
--DML - Data Manipulation Language-- 
-- insert, update, delete,
-- Dql-- select
select * from emp;
update emp set sal=sal+sal*.1;
update emp set comm=100 where ename='Blake';

delete from emp where ename='Smith';

-- Order By
select empno, ename, sal,job from emp order by job asc;
select empno, ename, sal,job from emp order by job desc;
select empno, ename, sal,job from emp order by job desc, sal asc;

--------------------------------------------------------------------------------
--rank function -- to give ranks to all records of a result

create table demo_name(
id int,
name varchar(20));

insert into demo_name values(1,'Anita'), (2,'Anita'),(3,'Nita'),(4,'Ritu'),(5,'Gagan'),(6,'Gagan');
select * from demo_name;

select name , Rank() over(order by name desc) Rank_no 
from demo_name;


SELECT Name, 
RANK () OVER (ORDER BY Name) AS Rank_no 
FROM demo_name;

select * from stud_grade;



SELECT empno, ename, job,
CASE
    WHEN job='salesman' THEN 'ST_MAN'
    WHEN job='Manager' THEN 'ST_MGR'
    ELSE 'ST_Others'
END "Job_id"
FROM emp;

select * from emp;
