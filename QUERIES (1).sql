----------------------------------------DATABASE--------------------------------
CREATE DATABASE ecommerce 
USE ecommerce 
ALTER DATABASE RENAME DATABASE  ecommerce TO ecommerce;
SHOW DATABASES;
DROP DATABASE ecommerce;

-----------------------------------------TABLE----------------------------------

-----------------------------------------CREATE,DROP,RENAME---------------------------------
CREATE TABLE customer(  
id INT NOT NULL AUTO_INCREMENT,  
first_name VARCHAR(100) NOT NULL,  
last_name VARCHAR(100) NOT NULL,
country VARCHAR(40) NOT NULL,  
gender VARCHAR(100) NOT NULL,  
country VARCHAR(100) NOT NULL, 
PRIMARY KEY ( student_id )); 

create table products (
	product_id INT,
	product_category VARCHAR(50),
	cost VARCHAR(50),
	in_Stock VARCHAR(50)
);

drop TABLE IF EXISTS customer; 
SHOW TABLES; 
RENAME TABLE  students TO customer; 
DESC orders
DESC customer; 
TRUNCATE TABLE IF EXISTS  customer

------------------------------------------------INSERT--------------------------------

insert into products (product_id, product_category, cost, In_Stock) VALUES (20, 'Bread ', '$144.96', FALSE);


-------------------------------------------------ALTER---------------------------------

ALTER TABLE customer RENAME COLUMN student_id TO id; 
ALTER TABLE customer DROP COLUMN city; 
ALTER TABLE customer ADD COLUMN city VARCHAR(100) NOT NULL;
ALTER TABLE orders ADD COLUMN product_id int NOT NULL;
ALTER TABLE products RENAME COLUMN product_category TO product_name; 



------------------------------------------------SELECT------------------------------------------

SELECT id,first_name 
FROM customer

SELECT * 
FROM customer

SELECT * FROM products
SELECT * FROM orders

-----------------------------------------------LIMIT--------------------------------------------
SELECT ID,FIRST_NAME 
FROM customer
LIMIT 10

SELECT ORDER_ID,AMOUNT
FROM orders
LIMIT 5,2


-------------------------------------------------WHERE------------------------------------------

SELECT * 
FROM CUSTOMER
WHERE id>=10

SELECT * 
FROM products
WHERE in_stock=TRUE

-----------------------------------------------ORDER BY-----------------------------------------

SELECT * 
FROM CUSTOMER
WHERE id>=10
ORDER BY ID ASC

SELECT * 
FROM CUSTOMER
WHERE id>=10
ORDER BY ID DESC

--------------------------------------------------JOINS-----------------------------------------

SELECT CONCAT(c.first_name," ",c.last_name) AS "Full Name",o.order_id,p.product_name,o.amount AS "Cost"
FROM customer c INNER JOIN orders o
ON c.id=o.ordered_by_id INNER JOIN products p
ON o.product_id=p.product_id

SELECT CONCAT(c.first_name," ",c.last_name)AS "Full Name",o.order_id,o.amount
FROM customer c LEFT  JOIN orders o
ON c.id=o.ordered_by_id


SELECT CONCAT(c.first_name," ",c.last_name)AS "Full Name",o.order_id,o.amount
FROM customer c right  JOIN orders o
ON c.id=o.ordered_by_id



------------------------------------------------DISTINCT --------------

SELECT AMOUNT
FROM ORDERS


SELECT DISTINCT AMOUNT
FROM orders

SELECT DISTINCT ORDERED_BY_ID 
FROM ORDERS

------------------------------------------------UPDATE----------------------

UPDATE customer 
set first_name=Nagaraju
WHERE id=1;

UPDATE customer
SET  first_name=Nagaraju,
last_name=Swarna
WHERE id=1 ;

UPDATE orders
SET product_id=6
WHERE ordered_by_id=10


----------------------------------------------DELETE-------

delete FROM customer 
WHERE id =44;

----------------------------------------------BETWEEN----------------

SELECT id,CONCAT(first_name,last_name) AS FullName 
FROM customer 
WHERE id BETWEEN 40 AND 45;

SELECT ORDER_ID,AMOUNT
FROM orders
WHERE amount BETWEEN 100 AND 120

----------------------------------------------IN--------------

SELECT id,CONCAT(first_name," ",last_name) AS FullName 
FROM customer 
WHERE id IN (1,2,10,15);

----------------------------------------SUBQUERIES----------

SELECT C.first_name,O.order_id,P.product_name
FROM customer C
WHERE C.id IN (SELECT ORDERED_BY_ID
               FROM orders O 
					WHERE O.product_id IN (SELECT P.product_id
					                       FROM products P
												   ))


-----------------------------------------------GROUP BY---------------------

SELECT CONCAT(c.first_name," ",c.last_name) AS "Full Name",COUNT(o.ordered_by_id) AS "Number of Orders"
FROM customer c INNER JOIN  orders o
ON c.id=o.ordered_by_id 
GROUP BY (o.ordered_by_id)

SELECT p.product_id,p.product_name,COUNT(p.product_id) AS "Number of Orders"
FROM customer c INNER JOIN orders o
ON c.id=o.ordered_by_id INNER JOIN products p
ON o.product_id=p.product_id
GROUP BY (p.product_id)

-----------------------------------------------LIKE-------------------------

SELECT first_name 
FROM customer  
WHERE first_name LIKE '%l';


SELECT first_name 
FROM customer  
WHERE first_name not LIKE '%A%';

SELECT first_name 
FROM customer  
WHERE first_name not LIKE '%A';

SELECT first_name 
FROM customer  
WHERE first_name  LIKE 'N_______';

-------------------------------------------AGGREGATE-FUNCTIONS---------------

SELECT COUNT(order_id) AS "Total orders"
FROM orders


SELECT SUM(AMOUNT) AS "TOTAL COST"
FROM ORDERS

SELECT MIN(COST)
FROM PRODUCTS


SELECT MAX(COST)
FROM PRODUCTS

SELECT avg(amount)
FROM orders 

-------------------STRING FUNCTIONS---------
select ASCII('dc')    --GIVES ASCII VALUE OF FIRST CHARACTER
select CHAR(64)     --RETURN CHARACTER FOR ASCII VALUE

---PRINTING FROM A TO Z 
DECLARE @START INT
SET @START=65
WHILE(@START<90)
BEGIN
 SELECT CHAR(@START)
SET  @START=@START+1;
END


SELECT LTRIM('   NAGARAJU')       --REMOVES WHITE SPACES ON LEFT 
SELECT RTRIM('NAGARAJU    ')      --REMOVES WHITE SPACES ON RIGHT

SELECT UPPER('nagaraju');         --CONVERTS TO UPPER CASE
SELECT LOWER('NAGARAJU')          --CONVERTS TO LOWER CASE
SELECT REVERSE('NAGARAJU');       --REVERSES GIVEN STRING
SELECT LEN('NAGARAJU  ')          --GIVES LENGTH EXCLUDING SPACES AT THE END
SELECT LEFT('NAGARAJU',4)         --GIVES SPECIFIED NO OF CHARACTERS FROM LEFT
SELECT RIGHT('NAGARAJU',5)        --GIVES SPECIFIED NO OF CHARACTERS FROM RIGHT
SELECT CHARINDEX('@','NAGARAJU@S')  --GIVES THE INDEX OF SPECIFIED CHARACTER
SELECT SUBSTRING('NAGARAJU@S',1,CHARINDEX('@','NAGARAJU@S'))  --GIVES SUBSTRING 

--QUERY TO MASK EMAIL ID 
SELECT SUBSTRING('NAGARAJUSWARNA5@GMAIL.COM',1,2)+
REPLICATE('*',LEN(LEFT('NAGARAJUSWARNA5@GMAIL.COM',CHARINDEX('@','NAGARAJUSWARNA5@GMAIL.COM')))-2)+'@'+
RIGHT('NAGARAJUSWARNA5@GMAIL.COM',LEN('NAGARAJUSWARNA5@GMAIL.COM')-CHARINDEX('@','NAGARAJUSWARNA5@GMAIL.COM'))
AS MASKED

SELECT LEN('NAGARAJU'+SPACE(5)+'SWARNA')

SELECT REPLACE('NAGARAJU SWARNA','A','@')     --REPLACES SPECIFIED PATTERN 


-----CAST AND CONVERT 

SELECT CONVERT(NVARCHAR,GETDATE(),102)   --LAST PARAMETER IS STYLE
SELECT CAST(DATE AS VARCHAR)             --USE CAST UNLESS STYLE IS REQUIRED 



------------------------------MATHEMATICAL FUNCTIONS


--------USER DEFINED FUNCTIONS
1.SCALAR FUNCTIONS
2.INLINE TABLE VALUES FUNCTIONS
3.MULTI STATEMENT TABLE VALUED FUNCTIONS 


CREATE FUNCTION AGECALCULATOR(@DOB DATE)
RETURNS INT
AS
BEGIN
DECLARE @AGE INT
SET @AGE=DATEDIFF(YEAR,@DOB,GETDATE())-
           CASE 
             WHEN (MONTH(@DOB)>MONTH(GETDATE())) OR((MONTH(@DOB)>MONTH(GETDATE()) AND DAY(@DOB)>DAY(GETDATE())))
			 THEN 1
			 ELSE 0
			 END
RETURN @AGE
END

SELECT dbo.AGECALCULATOR('05/03/1997')              --need to specify the schema also 

DROP FUNCTION dbo.AGECALCULATOR                     --DROPPPING FNCTION 

SP_HELPTEXT AGECALCULATOR                           --GETTING FUNCTION DEF 

                                                    --TABLE VALUED FUNCTION 
--NO BEGIN AND END
alter FUNCTION UDF_FUN()
RETURNS TABLE 
AS 
RETURN (SELECT * FROM FactData)

select * from [dbo].[UDF_FUN]()

-----------------------------------MULTI STATEMENT TABLE VALUED FUNCTION 

------------DETERMINISTIC VS NON-DETERMINISTIC FUNCTIONS

SELECT RAND()


--TEMPORARY TABLES

--LOCAL(SPECIFIC TO THE CONNECTION /AUTOMATICALLY DROPS WHEN CONNECTION IS CLOSED/IN SP'S IT WILL BE AUTOMATICALLY DROPS)
--GLOBAL()

 







