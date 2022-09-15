

-- SQL View Example -----
USE [SQL Tutorial]
GO
CREATE VIEW EmployeesViewbyQuery
AS
SELECT  [FirstName] + ' ' + [LastName] AS Name
	,[Occupation]
	,[Education]
	,dept.DepartmentName AS Department
	,[YearlyIncome] AS Income
	,[Sales]
FROM [MyEmployees Table]
   INNER JOIN 
 	 Department AS dept ON
	    Dept.[id] = [MyEmployees Table].DeptID

GO



-- SQL View Example
USE [SQL Tutorial]
GO
SELECT * FROM [dbo].[EmployeesViewbyQuery]
----RENAME VIEW--------------
SP_RENAME View_Old_Name, View_New_Name

----VIEW EXIST OR NOT-----

IF OBJECT_ID (N’View_Name’, ‘V’) IS NOT NULL

