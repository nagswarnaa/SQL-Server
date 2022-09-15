USE PlayGround

GO

--DROP TABLE tbl_studentcoursereg

CREATE TABLE tbl_studentcoursereg (id int IDENTITY(1,1),  studentid INT, coursename VARCHAR(100), 
Regmonth VARCHAR(50), regdate DATETIME)

INSERT INTO tbl_studentcoursereg VALUES (1, 'C#', 'JAN','01/01/2012')
INSERT INTO tbl_studentcoursereg VALUES (2, 'SQL', 'JAN','01/02/2012')
INSERT INTO tbl_studentcoursereg VALUES (3, 'SQL', 'JAN','01/03/2012')
INSERT INTO tbl_studentcoursereg VALUES (4, 'C#', 'FEB','02/02/2012')
INSERT INTO tbl_studentcoursereg VALUES (5, 'C#', 'MAR','03/03/2012')
INSERT INTO tbl_studentcoursereg VALUES (6, 'JAVA', 'APR','04/04/2012')
INSERT INTO tbl_studentcoursereg VALUES (7, 'JAVA', 'APR','04/04/2012')
INSERT INTO tbl_studentcoursereg VALUES (8, 'ORACLE', 'APR','04/04/2012')
INSERT INTO tbl_studentcoursereg VALUES (9, 'C#', 'APR','04/23/2012')
INSERT INTO tbl_studentcoursereg VALUES (10, 'C#', 'MAY','05/05/2012')

SELECT regmonth, totalstud FROM 
(
	SELECT  regmonth ,COUNT(studentid) AS totalstud
	FROM tbl_studentcoursereg
	GROUP BY regmonth 
)AS DerivedTable1  
WHERE DerivedTable1.totalstud > 2


