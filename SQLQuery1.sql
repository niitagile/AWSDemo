create database StudentManagement;
use StudentManagement;
create table StudentInfo(
rollno int primary key,
studname varchar(20),
dob datetime
);

create table result(
rollno int foreign key references studentinfo(rollno),
month varchar(15),
marks decimal(5,2)
);

drop database appintmentsystem;

insert into studentinfo(rollno,studname,dob) values(1,'Anisha Mishra','01-21-2000');
insert into studentinfo(rollno,studname,dob) values(2,'Anil','03-15-2000');
insert into studentinfo(rollno,studname,dob) values(3,'Monica','04-17-2001');
insert into studentinfo(rollno,studname,dob) values(4,'Kavita','03-21-1999');

select * from studentinfo;

insert into studentinfo(rollno,studname,dob) values(5,'Mohit','01-21-2000'),
 (6,'Anik','02-15-2001'),
(7,'Moni','04-17-2001'),
(8,'Kavi','06-12-1999');
insert into studentinfo(rollno,studname,dob) values(4,'Kavita','03-21-1999');

insert into result (rollno,month,marks)values(1,'Jan',78.8),(2,'Jan',56.9),(3,'Jan',28.8),(4,'Jan',78.8);
insert into result (rollno,month,marks)values(1,'Feb',70.8),(2,'Feb',50.9),(3,'Feb',89.8),(4,'Feb',23.8);
select * from result;

-- show rollno, name, month,marks of all students
select studentinfo.rollno,studname,month, marks from studentinfo inner join result on studentinfo.rollno=result.rollno; 
select s.rollno,studname,month, marks from studentinfo s inner join result r on s.rollno=r.rollno;

select * from studentinfo;

select rollno,studname from studentinfo;
select * from studentinfo where studname='moni';
select * from studentinfo where studname='moni' or studname='Anil';
select * from studentinfo where studname in('moni','Anil');

create table flight(
flightid int not null constraint flight_flightid_pk primary key,
company varchar(20) constraint flight_company_unq  unique

);