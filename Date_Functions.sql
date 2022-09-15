----------------------------------------DATE FUNCTIONS ------------------------------------

SELECT GETDATE()              --GIVES DATE AND TIME 
SELECT ISDATE(GETDATE())      --CHECKS WHETHER DATE IS VALID OR NOT (RETURNS 1 IF VALID )
SELECT SYSDATETIME()          --The SYSDATETIME() function returns a value of DATETIME2 that represents the current system date and time of the server
SELECT DAY(GETDATE())         --DATE NUMBER OF THE CURRENT DATE
SELECT MONTH(GETDATE())       --MONTH NUMBER OF THE CURRENT DATE
SELECT YEAR(GETDATE())        --YEAR NUMBER OF THE CURRENT DATE
SELECT DATENAME(DAY,GETDATE())  --RETURNS SPECIFIED DATE AS STRING
SELECT DATENAME(MONTH,GETDATE())
SELECT DATENAME(WEEKDAY,GETDATE())
SELECT DATENAME(YEAR,GETDATE())
SELECT DATENAME(WEEK,GETDATE())
SELECT DATEPART(WEEK,GETDATE())     --RETURNS INTEGER
SELECT DATEADD(DAY,10000,'05/03/1996')   -- ADDS THE SPECIFIED VALUE TO THE GIVEN DATE
SELECT  DATEDIFF(YEAR,'05/03/1996',GETDATE())   --GIVES DIFFERENCE BETWEEN 2 DATES