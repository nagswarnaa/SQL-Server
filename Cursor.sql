USE PlayGround

GO

--DROP TABLE BookDetails

CREATE TABLE BookDetails
(
	[BookId] [int] IDENTITY(1,1) NOT NULL,
    [BookName] [varchar](100) NULL,
    [Author] [varchar](100) NULL,
    [Publisher] [varchar](200) NULL,
    [Price] [decimal](18, 2) NULL
) 

INSERT INTO BookDetails VALUES('Book1','Author1','Publisher1',720)
INSERT INTO BookDetails VALUES('Book2','Author2','Publisher2',650)
INSERT INTO BookDetails VALUES('Book3','Author3','Publisher3',1200)
INSERT INTO BookDetails VALUES('Book4','Author1','Publisher1',1000)
INSERT INTO BookDetails VALUES('Book5','Author1','Publisher1',999)
INSERT INTO BookDetails VALUES('Book6','Author6','Publisher6',699)

--TRUNCATE TABLE BookDetails

--DROP PROCEDURE GetBookDetails_Sp

CREATE PROCEDURE GetBookDetails_Sp
AS
BEGIN

	CREATE TABLE #temp
    (
		BookName varchar(100),
        Author varchar(100),  
        Price int,
        Discount int,
        DiscountedPrice int,
    )

	                               
    SET NOCOUNT ON        
    DECLARE @name varchar(100)
    DECLARE @auth varchar(100)
    DECLARE @prc int
               
    DECLARE curBookDetails CURSOR STATIC FOR
    SELECT BookName,Author,Price from BookDetails
    OPEN curBookDetails
           
	
	PRINT 'Cursor Rows : '+ CONVERT(VARCHAR,@@CURSOR_ROWS)
		       
    IF @@CURSOR_ROWS > 0
    BEGIN
		FETCH NEXT FROM curBookDetails INTO @name,@auth,@prc		
		WHILE @@Fetch_status = 0
        BEGIN
			PRINT 'Cursor Rows : '+ CONVERT(VARCHAR,@@CURSOR_ROWS)
			PRINT 'Fetch Status : '+ CONVERT(VARCHAR,@@Fetch_status)
			INSERT INTO #temp (BookName,Author,Price,Discount,DiscountedPrice) VALUES (@name,@auth,@prc,((@prc*10)/100),@prc-((@prc*10)/100))       
            FETCH NEXT FROM curBookDetails INTO @name,@auth,@prc
        END
		PRINT 'Cursor Rows : '+ CONVERT(VARCHAR,@@CURSOR_ROWS)
		PRINT 'Fetch Status : '+ CONVERT(VARCHAR,@@Fetch_status)
    END
    
	SELECT * FROM #temp              
    CLOSE curBookDetails
    DROP TABLE #temp
    DEALLOCATE curBookDetails
    SET NOCOUNT OFF
END


--EXEC GetBookDetails_Sp
