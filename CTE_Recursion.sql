DECLARE @StartDate DATE='2017-01-01', 
		@EndDate DATE='2017-01-10';

;WITH DateCTE(DateList) AS
(
	SELECT @StartDate as Date
    UNION ALL
    SELECT DATEADD(d,1,DateList)
    FROM DateCTE WHERE DateList < @EndDate
)
SELECT DateList FROM DateCTE 