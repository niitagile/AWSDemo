create database Nidhi_Hr;
use nidhi_hr;
--create Department table
CREATE TABLE DEPT
(DEPTNO int not null constraint DEPT_deptno_pk1 primary key,
DNAME VARCHAR(14) CONSTRAINT DEPT_Dname_UNQ UNIQUE,
LOC VARCHAR(13) )
--insert records in department table
INSERT INTO DEPT VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPT VALUES (20, 'RESEARCH', 'NEW YORK');
INSERT INTO DEPT VALUES (30, 'SALES', 'BOSTON');
INSERT INTO DEPT VALUES (40, 'OPERATIONS', 'BOSTON');

--create table employee
CREATE TABLE EMP
(EMPNO int NOT NULL CONSTRAINT EMP_EMPNO_PK PRIMARY KEY,
ENAME VARCHAR(30),
JOB VARCHAR(9),
MGR int CONSTRAINT EMP_MGR_SK REFERENCES EMP(EMPNO),
HIREDATE DATETIME,
SAL NUmeric(7, 2),
COMM Numeric(7, 2),
DEPTNO int CONSTRAINT EMP_DEPTNO_FK REFERENCES DEPT(DEPTNO))


--insert records in employee table
INSERT INTO EMP VALUES
(7839, 'KING', 'PRESIDENT', NULL, '11/17/1981' , 5000, NULL, null)
INSERT INTO EMP VALUES
(7566, 'JONES', 'MANAGER', 7839, '04/2/1981', 2975, NULL, 20)
INSERT INTO EMP VALUES
(7698, 'BLAKE', 'MANAGER', 7839,'05/01/1985', 2975, NULL, 30)
INSERT INTO EMP VALUES
(7782, 'CLARK', 'MANAGER', 7839, '06/09/1985', 2450, NULL, 10)
INSERT INTO EMP VALUES
(7999, 'JOHN_MILLER', 'MANAGER', 7839, '01/01/2011' , 4000, NULL, 10)
INSERT INTO EMP VALUES
(7788, 'SCOTT', 'ANALYST', 7566, '12/09/1982' , 3000, NULL, 20)
INSERT INTO EMP VALUES
(7902, 'FORD', 'ANALYST', 7566, '12/03/1981' , 3000, NULL, 20)
INSERT INTO EMP VALUES
(7499, 'ALLEN', 'SALESMAN', 7698,'02/20/1985', 1600, 300, 30)
INSERT INTO EMP VALUES
(7521, 'WARD', 'SALESMAN', 7698, '02/22/1981', 1250, 500, 30)
INSERT INTO EMP VALUES
(7654, 'MARTIN', 'SALESMAN', 7698, '09/28/1991', 1250, 1400, 30)
INSERT INTO EMP VALUES
(7844, 'TURNER', 'SALESMAN', 7698, '09/08/1985' , 1500, 0, 30)
INSERT INTO EMP VALUES
(7900, 'JAMES', 'CLERK', 7698, '12/03/1981' , 950, NULL, 30)
INSERT INTO EMP VALUES
(7369, 'SMITH', 'CLERK', 7902, '12/17/1980', 800, NULL, 20)
INSERT INTO EMP VALUES
(7876, 'ADAMS', 'CLERK', 7788, ' 01/12/2003', 1100, NULL, 20)
INSERT INTO EMP VALUES
(7934, 'MILLER', 'CLERK', 7782, '01/23/2003' , 1300, NULL, 10)


SELECT * FROM DEPT;
SELECT * FROM EMP;

select ename,sal from emp where deptno=20;
select ename, min(sal) from emp where deptno=20;
--Column 'emp.ENAME' is invalid in the select list because it is not contained in either an aggregate function or the GROUP BY clause.
select ename,sal from emp where sal between 2000 and 4000;
select ename,sal from emp where sal between 2000 and 4000 and ename like 'C%';
select ename from emp where ename like '__A%';

select distinct job from emp;
select ename,sal,comm from emp;
--list of those employee who are getting commission
select ename,sal,comm from emp where comm is not null;
select ename,sal,comm from emp where comm is  null;

select ename,sal,comm, sal+comm "Total Salary" from emp;

select ename,sal,comm, sal*isnull(comm,1) "Total Salary" from emp;

select ename, sal from emp where sal<=1000;

select * from emp;


-- Aggregate functions 
select min(sal) "min sal", max(sal) "max sal",avg(sal) "avg sal",count(sal) "count sal" from emp;
select min(sal) "min sal" from emp;

select deptno,min(sal) "min sal" from emp group by DEPTNO;
select deptno,min(sal) "min sal" from emp where deptno=20 group by DEPTNO ;

-- display deptartment no which paying lesser than min sal of dept 20
select deptno,min(sal) "min sal" from emp  group by DEPTNO having min(sal)>800;


select * from emp;
--job and no of job
select job,count(job) from emp group by job;
--current date and time of my system
select getdate()
select month(getdate())
select year(getDate())

select ename,hiredate from emp where month(hiredate)=9;
select ename,hiredate from emp where year(hiredate)>2000;

select sal,sal+sal*0.1 from emp;
select sal,sal+(sal*10/100) from emp;


