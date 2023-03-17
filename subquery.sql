select * from emp;
select deptno from emp where ename='FORD';
select ename from emp where deptno=20;

select ename from emp where deptno=(select deptno from emp where ename='FORD');
-- display name and salary of those employee who are getting more salary than Blake
select ename,sal from emp where sal>(select sal from emp where ename='Blake');
--display name of those employees who are having same job like Allen
Select ename from emp where job = (select job from emp where ename = 'allen')
--Write a query to display the name , salary, department id for those employees who earn such amount of salary
--which is the smallest salary of any of the departments. 
select ename, sal,deptno from emp where sal in
(select min(sal) from emp group by deptno)

-- Write a query to display the employee id, employee name for all employees who earn more than the average salary
select ename,sal from emp where avg(sal)> sal;
select ename from emp where sal>(select AVG(sal) from EMP)

--Write a query to display the employee name , employee id and salary of all employees who report to Blake.

Select ename, empno, sal from emp where mgr = (select empno from emp where ename = 'Blake')

-- Write a query to display all the information of the employees whose salary is within the range of smallest salary and 2500.

select * from emp where sal between (select min(sal) from emp) and 2500

--Write a query to display the employee name  and hire date for all employees in the same department as Blake. Exclude Blake
select ename,hiredate from emp where deptno=
(select deptno from emp where ename='Blake') and
ename <> 'Blake'

--Write a query to display the employee number, name  and job title for all employees whose 
--salary is smaller than any salary of those employees whose job title is saleman
select empno,ename,job from emp where sal< any
(select sal from emp where job='salesman')

--Write a query to display the employee number, name  and job title for all employees whose 
--salary is smaller than all salary of those employees whose job title is saleman

select empno,ename,job from emp where sal< all
(select sal from emp where job='salesman')

--Write a query to display the employee name and department for 
--all employees for any existence of those employees whose salary is more than 3700.
--exists means if subquery give output then only outer query executes
select ename, deptno from emp where exists
(select * from emp where sal>3700)

--Write a query to display the department id and the total salary for those departments which contains at least one employee.
SELECT deptno,SUM(sal)
  FROM emp
  WHERE deptno IN (SELECT deptno
                            FROM dept)
  GROUP BY deptno
  HAVING COUNT(deptno) >= 1;

 