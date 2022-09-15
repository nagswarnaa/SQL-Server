
USE PlayGround

GO
--LOCAL(SPECIFIC TO THE CONNECTION /
--AUTOMATICALLY DROPS WHEN CONNECTION IS CLOSED/IN SP'S IT WILL BE AUTOMATICALLY DROPS)
--GLOBAL(##)



--Declaration section
DECLARE @StartDate AS DATE='2018-08-01';
DECLARE @EndDate AS DATE='2018-08-07';

--Drop Temp table if exists
--DROP TABLE #DateList

--Create Temp table
CREATE TABLE #DateList(iDate DATE,iDayName VARCHAR(10))

WHILE (@StartDate<=@EndDate)
BEGIN
	INSERT #DateList(iDate,iDayName) VALUES(@StartDate,DATENAME(DW,@StartDate))
    SET @StartDate=CAST(DATEADD(DAY,1,@StartDate) AS DATE)
END

--Select from temp table
SELECT iDate AS [Date], iDayName AS [DayName] FROM #DateList

--Drop Temp table
--DROP TABLE #DateList


--SELECT * INTO #Temp1 FROM [dbo].[FOM_ViewType]

