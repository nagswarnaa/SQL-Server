
USE PlayGround

GO


--Declaration section
DECLARE @StartDate DATE='2018-08-01';
DECLARE @EndDate DATE='2018-08-07';


--Create table variable
DECLARE @DateList TABLE(iDate DATE,iDayName VARCHAR(10))

WHILE (@StartDate<=@EndDate)
BEGIN
	INSERT @DateList(iDate,iDayName) VALUES(@StartDate,DATENAME(DW,@StartDate))
    SET @StartDate=CAST(DATEADD(DAY,1,@StartDate) AS DATE)
END

--Select from table variable
SELECT iDate AS [Date], iDayName AS [DayName] FROM @DateList



