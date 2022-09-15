

-----Non Clustered Index in SQL Server-------------

-- Create Non Clustered Indexes in SQL Server

CREATE NONCLUSTERED INDEX IX_CustomerRecord_YearlyIncome
ON CustomerRecord ([Yearly Income] ASC)


---Checking -----------

EXECUTE SP_HELPINDEX CustomerRecord

-- Create Composite Non Clustered Indexes in SQL Server
CREATE NONCLUSTERED INDEX IX_CustomerRecord_ProfessionIncome
ON CustomerRecord ([Profession] DESC, [Yearly Income] ASC)

-- Create Multiple Non Clustered Indexes in SQL Server
CREATE NONCLUSTERED INDEX IX_CustomerRecord_Profession
ON CustomerRecord ([Profession] ASC)
 
CREATE NONCLUSTERED INDEX IX_CustomerRecord_Income
ON CustomerRecord ([Yearly Income] DESC)

-- DROP Non Clustered Index in SQL Server
 
DROP INDEX CustomerRecord.IX_CustomerRecord_Profession

-----Filtered Indexes is a new feature introduced in SQL Server 2008 ------


select * from Customerrecord
where [yearly income]  > 15000.00

CREATE NONCLUSTERED INDEX IX_Employee2_yearlyincome
ON Customerrecord ([yearly income]) 

select * from Customerrecord
where [yearly income]  > 15000.00


-- Create Non Clustered Indexes in SQL Server
CREATE NONCLUSTERED INDEX IX_Employee3_SalesAmount
ON Customerrecord ([yearly income]) 
WHERE [yearly income] > 1500 














