USE Shcooldb;
GO
IF OBJECT_ID('dbo.Student', 'U') IS NOT NULL
    DROP TABLE dbo.Student;
GO

CREATE TABLE Student (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(50),
    Age INT,
    Course VARCHAR(50)
);
GO

INSERT INTO Student(Name,Age,Course) VALUES
('Ravi', 20,'ece'),
('Ariya', 20,'ece'),
('Anbu', 20,'ece'),
('Arun', 20,'ece'),
('Deepak',20,'cse'),
('Arul', 20,'cse'),
('Ravi', 20,'ece');
IF OBJECT_ID('dbo.Student1','U') IS NOT NULL
    DROP TABLE dbo.Student1;

CREATE TABLE Student1(
    ID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(50),
    Age INT,
    Course VARCHAR(50),
);
GO
INSERT INTO Student1(Name,Age,Course) VALUES
('Ravi', 20,'ece'),
('Ariya', 20,'ece'),
('Anbu', 20,'ece'),
('Arun', 20,'ece');

IF OBJECT_ID('dbo.SyncStudentToStudent1', 'P') IS NOT NULL 
DROP PROCEDURE dbo.SyncStudentToStudent1;
GO
CREATE PROCEDURE SyncStudentToStudent1
AS
BEGIN
SET NOCOUNT ON;
    INSERT INTO Student(Name,Age,Course)
    SELECT s.Name,s.Age,s.Course
    FROM Student AS s
    LEFT JOIN Student1 AS S1
        ON s.Name =s1.Name AND s.Age = s1.Age AND s.Course = s1.Course

    WHERE s1.ID IS NULL; 
    PRINT 'Student1 updated successfully!';
END;
GO


EXEC SyncStudentToStudent1;

SELECT *
FROM dbo.Student1
ORDER BY ID;








