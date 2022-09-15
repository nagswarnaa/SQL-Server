--Getting all the tables in the database
select * from sysobjects where xtype='u'   --u-user table
select * from sysobjects where xtype='fn'   --fn-scalar functions
select * from sysobjects where xtype='p'   --p-sp

--Refer MSDN for xtype codes

select * from sys.tables
select * from sys.procedures


select * from INFORMATION_SCHEMA.TABLES
select * from INFORMATION_SCHEMA.ROUTINES