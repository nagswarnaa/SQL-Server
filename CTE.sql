USE PlayGround

GO

WITH CTE AS(
    SELECT *
    , RN = ROW_NUMBER()OVER(PARTITION BY UserId ORDER BY UserId)
    FROM [User] 
)
SELECT * FROM CTE
WHERE RN = 1

--DELETE FROM CTE WHERE RN > 1