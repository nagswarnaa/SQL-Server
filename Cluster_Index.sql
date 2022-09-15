

USE master
GO
 ------Cluster Index-----------
CREATE TABLE [CustomerRecord]
(
  [CustomerKey] [int] NOT NULL PRIMARY KEY,
  [FirstName] [varchar](50) NOT NULL ,
  [LastName] [varchar](50) NULL,
  [EmailAddress] [nvarchar](50) NULL,
  [Profession] [nvarchar](100) NULL,
  [Yearly Income] [money] NULL
)


----Check index existing or not--------

EXECUTE SP_HELPINDEX CustomerRecord
EXECUTE SP_HELP CustomerRecord


----Insert fewe records into table to check index Functionality

 
INSERT INTO [dbo].[CustomerRecord] 
VALUES (4, 'Imran', 'Khan', 'abc@abc.com', 'Skilled Professional', 15900)
      ,(2, 'Doe', 'Lara', 'xyz@abc.com', 'Management', 15000)
      ,(5, 'Ramesh', 'Kumar', 'mnop@abc.com', 'Professional', 65000)
      ,(1, 'SQL', 'Tutorial', 'sqltut@abc.com', 'CEO', 654500)
      ,(3, 'Tutorial', 'Gateway', 'tgate@abc.com', 'HR', 95000)

----to see the result set------------


select * from CustomerRecord

-- DROP Clustered Index in SQL Server
 
DROP INDEX CustomerRecord.PK__Customer__95011E647C9C5969

---Create SQL Clustered Index on Existing table----

-- Create Clustered Indexes in SQL Server 

CREATE CLUSTERED INDEX IX_CustomerRecord_YearlyIncome
ON CustomerRecord ([Yearly Income] ASC)
select * from CustomerRecord
-- Delete Clustered Indexes in SQL Server
DROP INDEX CustomerRecord.IX_CustomerRecord_YearlyIncome

-- Create Composite Clustered Indexes in SQL Server
CREATE CLUSTERED INDEX IX_CustomerRecord_YearlyIncome
ON CustomerRecord ([Profession] ASC, [Yearly Income] DESC)

Drop index customerrecord.IX_CustomerRecord_YearlyIncome 

select * from CustomerRecord













