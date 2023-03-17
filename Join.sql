CREATE DATABASE Company;
CREATE TABLE Employee (
  Id INT PRIMARY KEY,
  Name VARCHAR(100) NOT NULL,
  Department VARCHAR(100) NOT NULL,
  Salary FLOAT NOT NULL,
  Gender VARCHAR(45) NOT NULL,
  Age INT NOT NULL,
  City VARCHAR(45) NOT NULL
);
INSERT INTO Employee (Id, Name, Department, Salary, Gender, Age, City) VALUES (1001, 'John Doe', 'IT', 35000, 'Male', 25, 'London');
INSERT INTO Employee (Id, Name, Department, Salary, Gender, Age, City) VALUES (1002, 'Mary Smith', 'HR', 45000, 'Female', 27, 'London');
INSERT INTO Employee (Id, Name, Department, Salary, Gender, Age, City) VALUES (1003, 'James Brown', 'Finance', 50000, 'Male', 28, 'London');
INSERT INTO Employee (Id, Name, Department, Salary, Gender, Age, City) VALUES (1004, 'Mike Walker', 'Finance', 50000, 'Male', 28, 'London');
INSERT INTO Employee (Id, Name, Department, Salary, Gender, Age, City) VALUES (1005, 'Linda Jones', 'HR', 75000, 'Female', 26, 'London');
INSERT INTO Employee (Id, Name, Department, Salary, Gender, Age, City) VALUES (1006, 'Anurag Mohanty', 'IT', 35000, 'Male', 25, 'Mumbai');
INSERT INTO Employee (Id, Name, Department, Salary, Gender, Age, City) VALUES (1007, 'Priyanla Dewangan', 'HR', 45000, 'Female', 27, 'Mumbai');
INSERT INTO Employee (Id, Name, Department, Salary, Gender, Age, City) VALUES (1008, 'Sambit Mohanty', 'IT', 50000, 'Male', 28, 'Mumbai');
INSERT INTO Employee (Id, Name, Department, Salary, Gender, Age, City) VALUES (1009, 'Pranaya Kumar', 'IT', 50000, 'Male', 28, 'Mumbai');
INSERT INTO Employee (Id, Name, Department, Salary, Gender, Age, City) VALUES (1010, 'Hina Sharma', 'HR', 75000, 'Female', 26, 'Mumbai');

CREATE TABLE Projects (
    ProjectId INT PRIMARY KEY IDENTITY(1, 1),
    Title VARCHAR(200) NOT NULL,
    ClientId INT,
    EmployeeId INT,
    StartDate DATETIME,
    EndDate DATETIME,
    FOREIGN KEY (EmployeeId) REFERENCES Employee(Id)
);

INSERT INTO Projects (Title, ClientId, EmployeeId, StartDate, EndDate) VALUES 
('Develop ecommerse website from scratch', 1, 1003, GETDATE(), (Getdate() + 35)),
('WordPress website for our company', 1, 1002, GETDATE(), (Getdate() + 45)),
('Manage our company servers', 2, 1007, GETDATE(), (Getdate() + 55)),
('Hosting account is not working', 3, 1009, GETDATE(), (Getdate() + 65)),
('MySQL database from my desktop application', 4, 1010, GETDATE(), (Getdate() + 75)),
('Develop new WordPress plugin for my business website', 2, NULL, GETDATE(), (Getdate() + 85)),
('Migrate web application and database to new server', 2, NULL, GETDATE(), (Getdate() + 95)),
('Android Application development', 4, 1004, GETDATE(), (Getdate() + 60)),
('Hosting account is not working', 3, 1001, GETDATE(), (Getdate() + 70)),
('MySQL database from my desktop application', 4, 1008, GETDATE(), (Getdate() + 80)),
('Develop new WordPress plugin for my business website', 2, NULL, GETDATE(), (Getdate() + 90));

--Our requirement is to retrieve the EmployeeId, Name, Department, City, Title as Project, and ClientId from the Employee and Projects tables. 
SELECT Id as EmployeeID, Name, Department, City, Title as Project, ClientId
FROM Employee 
INNER JOIN Projects 
ON Employee.Id = Projects.EmployeeId;

select * from employee;
select * from projects;

--using SQL Server LEFT OUTER JOIN, we can join the Employee and Projects table and display the information of the employees
--and the projects they are working on, we also get the details of employees
--who are not working on any project and in that case, the Project and ClientId column will take NULL values. 
SELECT Id as EmployeeID, Name, Department, City, Title as Project, ClientId
FROM Employee 
LEFT OUTER JOIN Projects 
ON Employee.Id = Projects.EmployeeId;


--we got all the matching records from both the Employee 
--and Projects tables as well as all non-matching rows from the right-side table i.e. the Projects Table.

SELECT Id as EmployeeID, Name, Department, City, Title as Project, ClientId
FROM Employee 
RIGHT OUTER JOIN Projects 
ON Employee.Id = Projects.EmployeeId;

--we need to write a query to retrieve the Id as EmployeeId, Name, Department, City, and Title as Project from the Employee and Projects tables.
SELECT Id as EmployeeID, Name, Department, City, Title as Project, ClientId
FROM Employee 
FULL OUTER JOIN Projects 
ON Employee.Id = Projects.EmployeeId;

--A Cross Join in SQL Server produces the Cartesian product of the tables involved in the join.
--The Cartesian product means the number of records present in the first table is multiplied by the number of records present in the second table.
SELECT Employee.Id as EmployeeId, Name, Department, City, Title as Project
FROM Employee 
CROSS JOIN Projects;

--Joining a table by itself is called self-join in SQL Server. When we have some relation between the columns within the 
--same table then we need to use the self-join mechanism.


-- Create the Employee table
CREATE TABLE EmployeeDetails
(
  EmployeeID INT Primary Key,
  Name VARCHAR(20),
  ManagerID INT
)

-- Insert the following records
INSERT INTO EmployeeDetails VALUES(1, 'Pranaya', 3)
INSERT INTO EmployeeDetails VALUES(2, 'Priyanka', 1)
INSERT INTO EmployeeDetails VALUES(3, 'Preety', NULL)
INSERT INTO EmployeeDetails VALUES(4, 'Anurag', 1)
INSERT INTO EmployeeDetails VALUES(5, 'Sambit', 1)
select * from EmployeeDetails

SELECT E.Name as Employee, M.Name as Manager
FROM Employeedetails E
INNER JOIN Employeedetails M
ON E.ManagerId = M.EmployeeId
