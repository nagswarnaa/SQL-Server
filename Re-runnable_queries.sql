--Creating re-runnable query
use COX_Test

select OBJECT_ID('Timeperiod');
If not exists (select * from information_schema.tables where table_name = 'tblEmployee')
Begin
 Create table tblEmployee
 (
  ID int identity primary key,
  Name nvarchar(100),
  Gender nvarchar(10),
  DateOfBirth DateTime
 )
 Print 'Table tblEmployee successfully created'
End
Else
Begin
 Print 'Table tblEmployee already exists'
End

--Creating table
IF OBJECT_ID('tblEmployee') IS NULL
Begin
   -- Create Table Script
   Print 'Table tblEmployee created'
End
Else
Begin
   Print 'Table tblEmployee already exists'
End


--Dropping 
IF OBJECT_ID('tblEmployee') IS NOT NULL
Begin
 Drop Table tblEmployee
End

--Checking for column
if not exists(Select * from INFORMATION_SCHEMA.COLUMNS where COLUMN_NAME='EmailAddress' and TABLE_NAME = 'tblEmployee' and TABLE_SCHEMA='dbo') 
Begin
 ALTER TABLE tblEmployee
 ADD EmailAddress nvarchar(50)
End
Else
BEgin
 Print 'Column EmailAddress already exists'
End

--
If col_length('tblEmployee','EmailAddress') is not null
Begin
 Print 'Column already exists'
End
Else
Begin
 Print 'Column does not exist'
End