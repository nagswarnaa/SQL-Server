-------------------------------------UNION AND UNION ALL-------------

SELECT [TimePeriodId],[MonthYearCode],[MonthYear]
FROM [Dimension].[Timeperiod]
WHERE MonthYearCode=012019
UNION                                           ---NO DUPLICATES 
SELECT [TimePeriodId],[MonthYearCode],[MonthYear]
FROM [Dimension].[Timeperiod]
WHERE MonthYearCode IN (012019,022019)


SELECT [TimePeriodId],[MonthYearCode],[MonthYear]
FROM [Dimension].[Timeperiod]
WHERE MonthYearCode=012019
UNION ALL                                         ---IT ALLOWS DUPLICATES 
SELECT [TimePeriodId],[MonthYearCode],[MonthYear]
FROM [Dimension].[Timeperiod]
WHERE MonthYearCode IN (012019,022019)