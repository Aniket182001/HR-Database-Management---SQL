create Database Project

use Project

Create Table EmployeeDetails(EmployeeId Int,FirstName varchar(20),LastName Varchar(20),Salary Bigint,JoiningDate Date,Department Varchar(20),Gender Varchar(10))

Select * from EmployeeDetails

Insert Into EmployeeDetails Values(1,'Vikas','Ahlawat',600000,'02/12/2013','IT','Male')
Insert Into EmployeeDetails Values(2,'Nikita','Jain',530000,'02/14/2013','HR','Female')
Insert Into EmployeeDetails Values(3,'Ashish','Kumar',1000000,'02/14/2013','IT','Male')
Insert Into EmployeeDetails Values(4,'Nikhil','Shrama',480000,'02/15/2013','HR','Male')
Insert Into EmployeeDetails Values(5,'Anish','Kadian',500000,'02/16/2013','Paroll','Male');

Select FirstName From EmployeeDetails;

Select UPPER(FirstName)as 'Firstname' from EmployeeDetails;

SELECT CONCAT(FirstName, ' ', LastName) AS "Name" FROM EmployeeDetails;

select EmployeeId,FirstName,LastName,Salary,JoiningDate,Department,Gender
From EmployeeDetails
where Firstname='Vikas';

select EmployeeId,FirstName,LastName,Salary,JoiningDate,Department,Gender
From EmployeeDetails
where Firstname Like 'A%';

select EmployeeId,FirstName,LastName,Salary,JoiningDate,Department,Gender
From EmployeeDetails
where Firstname Like '%h';

SELECT * FROM EmployeeDetails WHERE FirstName Like 'a-p%';

SELECT * FROM EmployeeDetails WHERE Gender LIKE '__le';

select EmployeeId,FirstName,LastName,Salary,JoiningDate,Department,Gender
From EmployeeDetails
where Firstname Like 'A____';

SELECT * FROM EmployeeDetails WHERE FirstName LIKE 'Vik%as';

Select DISTINCT Department From EmployeeDetails;

Select MAX(Salary) From EmployeeDetails;

Select MIN(salary) From EmployeeDetails;

SELECT EmployeeId, FirstName, LastName, Salary, 
       CONVERT(varchar, JoiningDate,106) AS DATE1, 
       Department, Gender
FROM EmployeeDetails;

SELECT EmployeeId, FirstName, LastName, Salary, 
       CONVERT(varchar, JoiningDate,111) AS DATE2, 
       Department, Gender
FROM EmployeeDetails;

SELECT EmployeeId, FirstName, LastName, Salary, 
       YEAR(JoiningDate) AS JoiningYear, 
       Department, Gender
FROM EmployeeDetails;

SELECT EmployeeId, FirstName, LastName, Salary, 
       Month(JoiningDate) AS JoiningMonth, 
       Department, Gender
FROM EmployeeDetails;

Select Getdate() as CurrentDate;

SELECT GETUTCDATE() AS CurrentUTCDate;

SELECT FirstName,
       GETDATE() AS CurrentDate,
       JoiningDate,
       DATEDIFF(Month,JoiningDate,GETDATE()) AS MonthDiff
FROM EmployeeDetails;

SELECT FirstName,
       GETDATE() AS CurrentDate,
       JoiningDate,
       DATEDIFF(DAY,JoiningDate,GETDATE()) AS MonthDiff
FROM EmployeeDetails;

SELECT FirstName,LastName,JoiningDate
From EmployeeDetails
Where joiningDate like '2013%';

SELECT *
FROM EmployeeDetails
WHERE MONTH(JoiningDate) = 1;

Select Count (employeeId)
From EmployeeDetails;

SELECT TOP 1 *
FROM EmployeeDetails;

Select * from EmployeeDetails
Where FirstName IN ('Vikas','Ashish','Nikhil');

Select * from EmployeeDetails
Where FirstName Not IN ('Vikas','Ashish','Nikhil');

SELECT RTRIM(FirstName) AS TrimmedFirstName
FROM EmployeeDetails;

SELECT LTRIM(FirstName) AS TrimmedFirstName
FROM EmployeeDetails;

SELECT FirstName,
       CASE WHEN Gender = 'Male' THEN 'M'
            WHEN Gender = 'Female' THEN 'F'
            ELSE 'Unknown' END 
FROM EmployeeDetails;

SELECT 'Hello '+ FirstName 
FROM EmployeeDetails;

Select* from EmployeeDetails
Where Salary>600000;

Select* from EmployeeDetails
Where Salary<700000;

Select* from EmployeeDetails
Where Salary Between 500000 AND 600000;

Create Table ProjectDetail(ProjectDetailID Int ,EmployeeDetailID Int,ProjectName Varchar(20))

Select * From ProjectDetail;

Insert Into ProjectDetail Values(1,1,'Task Track'),
                                (2,1,'CLP'),
								(3,1,'Survey Management'),
								(4,2,'HR Management'),
								(5,3,'Task Track'),
								(6,3,'GRS'),
								(7,3,'DDS'),
								(8,4,'HR Management'),
								(9,6,'GL Management');

SELECT Department, SUM(Salary) AS TotalSalary
FROM EmployeeDetails
GROUP BY Department;

SELECT Department, SUM(Salary) AS TotalSalary
FROM EmployeeDetails
GROUP BY Department
Order BY(TOtalSalary) ASC;

SELECT Department, SUM(Salary) AS TotalSalary
FROM EmployeeDetails
GROUP BY Department
Order BY(TOtalSalary) DESC;

SELECT Department, 
       COUNT(*) AS TotalDepartments,
       SUM(Salary) AS TotalSalary
FROM EmployeeDetails
GROUP BY Department;

Select Department,
	   AVG(Salary) AS AVGSLY
From  EmployeeDetails
Group By Department
Order BY AVGSLY ASC;

Select Department,
Max(Salary) AS MAXSLY
From EmployeeDetails
Group By Department
Order By MAXSLY asc;

Select Department,
MIN(Salary) AS MINSLY
From EmployeeDetails
Group By Department
Order By MINSLY asc;

SELECT E.EmployeeId, E.FirstName, E.LastName, E.Salary, E.JoiningDate, E.Department, E.Gender, P.ProjectName
FROM EmployeeDetails E
INNER JOIN ProjectDetail P ON E.EmployeeId = P.EmployeeDetailID;

SELECT E.FirstName AS EmployeeFirstName, PD.ProjectName
FROM EmployeeDetails AS E
INNER JOIN ProjectDetail AS PD ON E.EmployeeId = PD.EmployeeDetailID
ORDER BY E.FirstName;

SELECT E.FirstName AS EmployeeFirstName, COALESCE(PD.ProjectName, 'Not Assigned') AS ProjectName
FROM EmployeeDetails AS E
LEFT JOIN ProjectDetail AS PD ON E.EmployeeId = PD.EmployeeDetailID
ORDER BY E.FirstName;

SELECT E.FirstName AS EmployeeFirstName, COALESCE(PD.ProjectName, '-No Project Assigned') AS ProjectName
FROM EmployeeDetails AS E
LEFT JOIN ProjectDetail AS PD ON E.EmployeeId = PD.EmployeeDetailID
ORDER BY E.FirstName;

SELECT E.FirstName AS EmployeeFirstName, COALESCE(PD.ProjectName, '-No Project Assigned') AS ProjectName
FROM EmployeeDetails AS E
LEFT JOIN (
    SELECT DISTINCT ProjectName
    FROM ProjectDetail
) AS PD ON 1 = 1
ORDER BY E.FirstName;

SELECT E.FirstName AS EmployeeFirstName, PD.ProjectName
FROM EmployeeDetails AS E
FULL OUTER JOIN ProjectDetail AS PD ON E.EmployeeId = PD.EmployeeDetailID;

SELECT E.FirstName AS EmployeeName, PD.ProjectName
FROM EmployeeDetails AS E
INNER JOIN ProjectDetail AS PD ON E.EmployeeId = PD.EmployeeDetailID
GROUP BY E.EmployeeId, E.FirstName, PD.ProjectName
HAVING COUNT(*) > 1;

SELECT PD.ProjectName, E.FirstName AS EmployeeName
FROM ProjectDetail AS PD
INNER JOIN EmployeeDetails AS E ON PD.EmployeeDetailID = E.EmployeeId
GROUP BY PD.ProjectName, E.FirstName
HAVING COUNT(*) > 1;

SELECT E.FirstName AS EmployeeName, PD.ProjectName
FROM EmployeeDetails AS E
CROSS JOIN ProjectDetail AS PD;

Create Table FuelDetail(ID Int,Fuel Int,Date Date)

Select * From FuelDetail;

Insert into FuelDetail
	Values(1,10,'2014-04-25'),
		  (2,9,'2014-04-25'),
		  (3,8,'2014-04-25'),
		  (4,6,'2014-04-25'),
		  (5,12,'2014-04-25'),
		  (6,11,'2014-04-25'),
		  (7,10,'2014-04-25'),
		  (8,9,'2014-04-25'),
		  (9,8,'2014-04-25'),
		  (10,10,'2014-04-25'),
		  (11,9,'2014-04-25'),
		  (12,8,'2014-04-25'),
		  (13,7,'2014-04-25'),
		  (14,15,'2014-04-25');




SELECT UPPER(LEFT(FirstName, 1)) + LOWER(SUBSTRING(FirstName,0, 5)) AS ModifiedFirstName
FROM EmployeeDetails;

SELECT STRING_AGG(FirstName, ', ') AS AllEmployeeNames
FROM EmployeeDetails;

SELECT PD.ProjectName, STRING_AGG(ED.FirstName, ', ') AS EmployeeNames
FROM ProjectDetail AS PD
INNER JOIN EmployeeDetails AS ED ON PD.EmployeeDetailID = ED.EmployeeId
GROUP BY PD.ProjectName;

SELECT Date AS PetrolFillTime
FROM (
    SELECT *,
           LAG(Fuel) OVER (ORDER BY Date) AS PreviousFuel
    FROM FuelDetail
) AS Subquery
WHERE Fuel > PreviousFuel;

