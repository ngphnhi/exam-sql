CREATE DATABASE EmployeeDB
GO

USE EmployeeDB
GO

CREATE TABLE Department(
DepartId INT PRIMARY KEY,
DepartName VARCHAR(50) NOT NULL,
Description VARCHAR(100) NOT NULL
)
GO

CREATE TABLE Employee(
EmpCode CHAR(6) PRIMARY KEY,
FirstName VARCHAR(30) NOT NULL,
LastName VARCHAR(30) NOT NULL,
Birthday SMALLDATETIME NOT NULL,
Gender BIT DEFAULT 1,
Address VARCHAR(100),
DepartID INT,
CONSTRAINT FK_Department FOREIGN KEY (DepartId) REFERENCES Department(DepartId),
Salary MONEY
)
GO

INSERT INTO Department (DepartId, DepartName, Description)
VALUES
(1, 'HR', 'Human Resources Department'),
(2,'IT','Information Technology Department'),
(3, 'Finance', 'Finance Department'),
(4, 'Marketing', 'Marketing and Sales Department')
GO

INSERT INTO Employee(EmpCode, FirstName, LastName, Birthday, Gender, Address, DepartID, Salary)
VALUES
('E001', 'Charlie', 'Sampson', '1999-09-28',1,'134 Linien St',1, 6000.00),
('E002','Wes','Bennet','1990-06-22',1,'235 Friedrich St', 2, 6500.00),
('E003', 'Bailey', 'Mitchell', '1990-10-12',0,'98 Ostsee St', 2, 6300.00),
('E004', 'Elizabeth', 'Buxbaum', '1996-10-28',0,'112 Gensler St',4, 5500.00),
('E005', 'Daniella', 'Grande', '1995-08-03',0,'66 Lubecker St',3,7000.00)
GO


UPDATE Employee
SET Salary = Salary *1.10
GO

ALTER TABLE Employee
ADD CONSTRAINT sp CHECK (Salary > 0);
GO