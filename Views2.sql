

--------Views------------

CREATE TABLE PRODUCTS
(ProductID INT PRIMARY KEY CLUSTERED,
ProductDesc VARCHAR(50) NOT NULL,
ManufacturingDate DATETIME,
ExpiryDate DATETIME,
IsSalable BIT,--1 Salable/Active FOR 0 For NonSalable/Passive Product
Price MONEY NOT NULL
)


CREATE TABLE Customer
(CustID INT IDENTITY(1002,2)PRIMARY KEY CLUSTERED,
 FName VARCHAR(50) NOT NULL,
 LNme VARCHAR(50) NOT NULL,
 UserID VARCHAR(100) NOT NULL,
 Pswd NVARCHAR(100) NOT NULL DEFAULT 'password123'
)


CREATE TABLE BOOKING
( BookingID INT IDENTITY(10,2) PRIMARY KEY CLUSTERED,
  ProductID INT REFERENCES dbo.Products(ProductID),
  CustID INT REFERENCES dbo.Customer(CustID),
  DateOfBooking DATETIME NOT NULL,
  QTY INT
)


INSERT INTO PRODUCTS VALUES
(1,'Biscuits','2011-09-01 00:00:00.000','2012-09-01 00:00:00.000',1,20),
(2,'Butter','2010-09-01 00:00:00.000','2011-09-01 00:00:00.000',1,30),
(3,'Milk','2011-10-01 00:00:00.000','2011-11-01 00:00:00.000',1,46)

INSERT INTO Customer (FName,LNme,UserID,Pswd)
 VALUES
('Sara','Verma','S.Verma@abc.com','S123'),
('Rick','Singh','G.Singh@xyz.com','G311'),
('Micky','Khera','M.Khera@mno.com','M222')

INSERT INTO BOOKING (ProductID,CustID,DateOfBooking,QTY)
VALUES
(1,1002,'2011-11-01 00:00:00.000',3),
(2,1004,GETDATE(),4),
(3,1006,'2011-10-01 00:00:00.000',2)


select * from PRODUCTS
select * from Customer
select * from BOOKING

CREATE VIEW Bill_V
AS
SELECT C.FName
      ,C.LNme
      ,P.ProductDesc
      ,B.DateOfBooking
      ,P.Price
      ,B.QTY
      ,(B.QTY*P.Price) AS TotalAmountPayable
FROM BOOKING B
INNER JOIN PRODUCTS P
ON B.ProductID=P.ProductID
INNER JOIN Customer C
ON B.CustID=C.CustID;


select * from Bill_V



CREATE VIEW dbo.CustomerInfo_V
AS
Select CustID
      ,FNAME AS [FIRST NAME]
      ,LNME AS [LAST NAME]
      ,UserID
FROM dbo.Customer



select * from Customer
select * from CustomerInfo_V




ALTER VIEW Bill_V
WITH SCHEMABINDING
AS
SELECT C.FName
      ,C.LNme
      ,P.ProductDesc
      ,B.DateOfBooking
      ,P.Price
      ,B.QTY
      ,(B.QTY*P.Price) AS TotalAmountPayable
FROM dbo.BOOKING B
INNER JOIN dbo.PRODUCTS P
ON B.ProductID=P.ProductID
INNER JOIN dbo.Customer C
ON B.CustID=C.CustID;


ALTER VIEW Bill_V
WITH Encryption
AS
SELECT C.FName
      ,C.LNme
      ,P.ProductDesc
      ,B.DateOfBooking
      ,P.Price
      ,B.QTY
      ,(B.QTY*P.Price) AS TotalAmountPayable
FROM dbo.BOOKING B
INNER JOIN dbo.PRODUCTS P
ON B.ProductID=P.ProductID
INNER JOIN dbo.Customer C
ON B.CustID=C.CustID;


CREATE UNIQUE CLUSTERED INDEX Bill_View_Indx
ON dbo.Bill_V(Fname,LNme);


select * from BOOKING 

exec sp_helptext 'Bill_V'

