

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

INSERT INTO Student(Name, Age, Course) VALUES
('Kishor', 20, 'cse'),
('Ravi',20,'ece');
GO

SELECT * FROM Student;

UPDATE Student SET Course ='ece' WHERE Name = 'Kishor';
GO

SELECT * FROM Student;
GO

DELETE FROM Student WHERE Name='Ravi' ;
GO

SELECT * FROM Student;





