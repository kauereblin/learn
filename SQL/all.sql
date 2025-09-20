CREATE DATABASE Students;
USE Students;

CREATE TABLE StudentsInfo
(
	StudentId int,
	StudentName varchar(8000),
	ParentName varchar(8000),
	PhoneNumber bigint,
	AddressofStudent varchar(8000),
	City varchar(8000),
	Country varchar(8000)
);

DROP TABLE StudentsInfo;

-- ALTER TABLE StudentsInfo ADD BloodGroup varchar(2);
-- ALTER TABLE StudentsInfo DROP COLUMN BloodGroup;

-- ALTER TABLE StudentsInfo ADD DOB Date;
-- ALTER TABLE StudentsInfo ALTER COLUMN DOB DateTime;

INSERT INTO StudentsInfo
	VALUES (7, 'Vishal', 'Maico', 9876543210, 'Boa estrada 15', 'Indaial', 'Brazil');

-- sp_rename: Rename metadata information

-- Key Types: Candidate, Super, Primary, Alternate, Foreign
/*
Candidate: Unique att that are not primary
Super: Set of att can identify uniquely
Primary: Identify data uniquely
Alternate: Candidate that are identifier sometimes
Foreign: Define relationship
*/

/* Constraints

NOT NULL: A value cant be stored null
UNIQUE: All values in a column are different
CHECK: All values in column satisfy a condition
INDEX: Grant perform in queries
*/

-- DROP TABLE StudentsInfo;

--CREATE TABLE StudentsInfo
--(
--	StudentId int PRIMARY KEY,
--	StudentName varchar(8000) NOT NULL,
--	ParentName varchar(8000),
--	PhoneNumber bigint,
--	AddressofStudent varchar(8000),
--	City varchar(8000),
--	Country varchar(8000),
--	CONSTRAINT UC_StudentsInfo UNIQUE(PhoneNumber)
--);

-- ALTER TABLE StudentsInfo ADD UNIQUE(PhoneNumber);
-- ALTER TABLE StudentsInfo DROP UC_StudentsInfo

--CREATE TABLE StudentsInfo
--(
--	StudentId int PRIMARY KEY,
--	StudentName varchar(8000) NOT NULL,
--	ParentName varchar(8000),
--	PhoneNumber bigint,
--	AddressofStudent varchar(8000),
--	City varchar(8000),
--	Country varchar(8000) CHECK (Country = 'Brazil')
--);

--INSERT INTO StudentsInfo
--	VALUES (7, 'Vishal', 'Maico', 9876543210, 'Boa estrada 15', 'Indaial', 'Jamaica');

-- ALTER TABLE StudentsInfo ADD CONSTRAINT CK_CountryIndia CHECK (Country = 'India');
-- ALTER TABLE StudentsInfo DROP CK__StudentsI__Count__3E52440B;

--CREATE TABLE StudentsInfo
--(
--	StudentId int PRIMARY KEY,
--	StudentName varchar(8000) NOT NULL,
--	ParentName varchar(8000),
--	PhoneNumber bigint,
--	AddressofStudent varchar(8000),
--	City varchar(8000),
--	Country varchar(8000) DEFAULT 'Brazil'
--);

--ALTER TABLE StudentsInfo
--DROP CONSTRAINT DF__StudentsI__Count__412EB0B6

--ALTER TABLE StudentsInfo
--ADD CONSTRAINT DF_CountryBrazil
--DEFAULT 'Brazil' FOR Country;

DROP TABLE StudentsInfo;
CREATE TABLE StudentsInfo
(
	StudentId int PRIMARY KEY,
	StudentName varchar(8000) NOT NULL,
	ParentName varchar(8000),
	PhoneNumber bigint,
	AddressofStudent varchar(8000),
	City varchar(8000),
	Country varchar(8000)
);

--CREATE INDEX IDX_StudentName
--ON StudentsInfo (StudentName);

--DROP INDEX StudentsInfo.IDX_StudentName;

-- ---------------------------------------

INSERT INTO StudentsInfo(StudentId, StudentName, ParentName, PhoneNumber, AddressofStudent, City, Country)
	VALUES (1, 'Maico', 'Robso', 1234567890, 'Rua dos Bobos', 'Blumenau', 'Argentina');

INSERT INTO StudentsInfo
	VALUES (2, 'Sergio', 'Jhonson', 0987654321, 'aaa', 'Timbo', 'USA');

INSERT INTO StudentsInfo
	VALUES (3, 'Tobias', 'Jhonson', 0987654321, 'Tche', 'Timbo', 'Tcherere');

SELECT * FROM StudentsInfo;

UPDATE StudentsInfo Set StudentName = 'Robson', AddressofStudent = 'Tilambuco'
WHERE StudentId = 2;

-- ---------------------------------------

CREATE TABLE SourceTable (StudentId int, StudentName varchar(250), Marks int);
CREATE TABLE TargetTable (StudentId int, StudentName varchar(250), Marks int);

--DROP TABLE SourceTable;
--DROP TABLE TargetTable;

INSERT INTO SourceTable VALUES (1, 'Robson', 100);
INSERT INTO SourceTable VALUES (2, 'Maico', 80);
INSERT INTO SourceTable VALUES (3, 'Jhonson', 70);

INSERT INTO TargetTable VALUES (1, 'Robson', 97);
INSERT INTO TargetTable VALUES (2, 'Maico', 78);
INSERT INTO TargetTable VALUES (3, 'Mudado', 83);

SELECT * FROM SourceTable;
SELECT * FROM TargetTable;

MERGE TargetTable TARGET USING SourceTable SOURCE ON (TARGET.StudentId = SOURCE.StudentId)
WHEN MATCHED AND TARGET.StudentName <> SOURCE.StudentName OR TARGET.Marks <> SOURCE.Marks
THEN UPDATE SET TARGET.StudentName = SOURCE.StudentName, TARGET.Marks = SOURCE.Marks
WHEN NOT MATCHED BY TARGET
THEN INSERT (StudentId, StudentName, Marks) VALUES (SOURCE.StudentId, SOURCE.StudentName, SOURCE.Marks)
WHEN NOT MATCHED BY SOURCE
THEN DELETE;

SELECT TOP 3 StudentName, City FROM StudentsInfo;

SELECT DISTINCT City FROM StudentsInfo;

SELECT * FROM StudentsInfo
ORDER BY StudentName ASC, ParentName DESC;

SELECT Count(StudentId) FROM StudentsInfo GROUP BY City;

SELECT StudentId, StudentName, Count(City) as query_result FROM StudentsInfo
GROUP BY GROUPING SETS ((StudentId, StudentName, City), (StudentId), (StudentName), (City));

SELECT Count(StudentId), City FROM StudentsInfo
GROUP BY City
HAVING Count(StudentId) = 1
ORDER BY Count(StudentId) DESC;

SELECT * INTO StudentsBackup FROM StudentsInfo;
DROP TABLE StudentsBackup;
SELECT * INTO StudentsBackup FROM StudentsInfo WHERE City = 'Timbo';
SELECT * FROM StudentsBackup;

CREATE TABLE OffsetMarks (Marks int);
INSERT INTO OffsetMarks VALUES (65);
INSERT INTO OffsetMarks VALUES (63);
INSERT INTO OffsetMarks VALUES (66);
INSERT INTO OffsetMarks VALUES (61);
INSERT INTO OffsetMarks VALUES (62);

SELECT * FROM OffsetMarks ORDER BY Marks OFFSET 1 ROWS;

SELECT * FROM OffsetMarks ORDER BY Marks OFFSET 3 ROWS FETCH NEXT 2 ROWS ONLY;

-- ---------------------------------------

CREATE TABLE Supplier
(
	Supplier int PRIMARY KEY,
	DaysofManufacture int,
	Cost int,
	CustomerId int,
	PurchaseId varchar(250)
);

INSERT INTO Supplier VALUES (1, 12, 1230, 11, 'P1');
INSERT INTO Supplier VALUES (2, 21, 1543, 22, 'P2');
INSERT INTO Supplier VALUES (3, 32, 3245, 11, 'P3');
INSERT INTO Supplier VALUES (4, 14, 3254, 22, 'P1');
INSERT INTO Supplier VALUES (5, 42, 5432, 33, 'P3');
INSERT INTO Supplier VALUES (6, 31, 3214, 33, 'P2');
INSERT INTO Supplier VALUES (7, 41, 2341, 11, 'P2');
INSERT INTO Supplier VALUES (8, 54, 6134, 22, 'P1');
INSERT INTO Supplier VALUES (9, 36, 4325, 11, 'P3');

SELECT CustomerId, AVG(Cost) as Average FROM Supplier GROUP BY CustomerId;

SELECT 'Avarage'AS Cost_According_Customers, [11], [22], [33]
FROM (
	SELECT CustomerId, Cost FROM Supplier
) AS SourceTable
PIVOT (
AVG(Cost) FOR CustomerId IN ([11], [22], [33])
) AS PivotTable;

CREATE TABLE SampleTable (SupplierId int, AAA int, BBB int, CCC int);

INSERT INTO SampleTable VALUES (1, 1, 2, 3);
INSERT INTO SampleTable VALUES (2, 9, 8, 7);
INSERT INTO SampleTable VALUES (3, 4, 5, 6);

SELECT SupplierId, Customers, Products
FROM (
	SELECT SupplierId, AAA, BBB, CCC FROM SampleTable) p
UNPIVOT (
	Products FOR Customers IN (AAA, BBB, CCC)) AS Example;

/* Operators

Arithmetic: + - * / %
Assignment: =
Bitwise: & &= | |= ^ ^= ~
Comparison: = < > <= >= <> != !< !>
Compound: All with assignment
Logical: ALL AND ANY BETWEEN EXISTS IN LIKE NOT OR SOME
Scope Resolution: ::
Set: UNION INTERSECT EXCEPT 
String Concat: + += (regex) %  [] [^] _
Aggregate: SUM COUNT AVG MIN MAX FIRST LAST
*/

DECLARE @var1 int = 30;
SET @var1 /= 16;
SELECT @var1;

CREATE TABLE OffsetMarks (Marks int);
INSERT INTO OffsetMarks VALUES (65);
INSERT INTO OffsetMarks VALUES (63);
INSERT INTO OffsetMarks VALUES (66);
INSERT INTO OffsetMarks VALUES (61);
INSERT INTO OffsetMarks VALUES (62);

SELECT * FROM OffsetMarks WHERE Marks BETWEEN 62 AND 65;

SELECT * FROM StudentsInfo WHERE StudentName LIKE 'M_%o';

DECLARE @exid hierarchyid;
SELECT @exid = hierarchyid::GetRoot();
PRINT @exid.ToString();

SELECT StudentName, ParentName FROM StudentsInfo
	WHERE AddressofStudent IN (
		SELECT AddressofStudent FROM StudentsBackup WHERE Country = 'USA');

CREATE TABLE Subjects (SubjectId int, StudentId int, SubjectName varchar(50));

INSERT INTO Subjects VALUES (1, 1, 'Math');
INSERT INTO Subjects VALUES (2, 3, 'Science');
INSERT INTO Subjects VALUES (3, 2, 'Language');

SELECT Subjects.SubjectId, StudentsInfo.StudentName FROM Subjects
INNER JOIN StudentsInfo
	ON Subjects.StudentId = StudentsInfo.StudentId;

SELECT Subjects.SubjectId, StudentsInfo.StudentName FROM StudentsInfo
FULL OUTER JOIN Subjects
	ON StudentsInfo.StudentId = Subjects.StudentId
ORDER BY StudentsInfo.StudentName;

--CREATE PROCEDURE Students_City @Pcd_City varchar(250)
--AS
--SELECT * FROM StudentsInfo
--WHERE City = @Pcd_City;

--SELECT * FROM StudentsInfo;

--EXEC Students_City @Pcd_City = 'Timbo';

CREATE TABLE TCLSample(StudentId int, StudentName varchar(250), Marks int);
INSERT INTO TCLSample VALUES (1, 'Jorge', 10);
INSERT INTO TCLSample VALUES (2, 'Robson', 8);
INSERT INTO TCLSample VALUES (3, 'Maico', 6);
INSERT INTO TCLSample VALUES (4, 'Ze', 5);

BEGIN TRY
BEGIN TRANSACTION
INSERT INTO TCLSample VALUES (5, 'Oswaldo', 9);
UPDATE TCLSample SET StudentName = 'Jhonson'
	WHERE StudentId = 5;
UPDATE TCLSample SET Marks = 3
	WHERE StudentId = 5;
COMMIT TRANSACTION
PRINT 'TRANSACTION COMPLETE'
END TRY
BEGIN CATCH
ROLLBACK TRANSACTION
PRINT 'Transaction unsuccessful and rolledback'
END CATCH

SELECT * FROM TCLSample;
