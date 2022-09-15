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



