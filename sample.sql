USE Shcooldb;
GO
/* for renaming */

/* EXEC sp_rename 'Student.Program', 'Course', 'COLUMN'; */


/* SELECT Name, Course
FROM Student
WHERE Age > 18; */

/* INSERT INTO Student
VALUES ('Ariya', 20, 'ECE'); */

/* UPDATE Student
SET Course = 'CSE'
WHERE Name = 'Ravi'; */

/* DELETE FROM Student
WHERE Course = 'ECE'; */


-- Run this in the master database creating new login server

/* USE master;
GO

CREATE LOGIN MyLogin
WITH PASSWORD = 'Kishor@123'; */

--creating new user in mylogin

/* CREATE USER MyUser FOR LOGIN MyLogin; */

--grant permission

/* GRANT DELETE
ON Student
TO MyUser; */

/* -- swicth to my login
EXECUTE AS USER = 'MyUser';
GO

USE Shcooldb;
GO

SELECT * 
FROM Student;

--This will fail DELETE was not granted
DELETE FROM Student
WHERE Name = 'Anbu';

GO

-- Return to original login
REVERT;  */

-- last granted permision is get removed

/* REVOKE INSERT ON Student FROM MyUser; */

/*  DENY DELETE ON Student to MyUser;  */

-- transaction start
BEGIN TRANSACTION

UPDATE Student
SET Course='ece'
WHERE Name='Anbu';
SAVE TRAN sp1; -- changes stored in the sp1 not permatly changed
DELETE FROM Student WHERE Age=18;
ROLLBACK TRAN sp1;  --roll back except spi
COMMIT --end of transation


SELECT * FROM Student