--Notes
--DDL data defination language
CREATE TABLE Lesson1 (id INT);               -- Create table
ALTER TABLE Lesson1 ADD name VARCHAR(50);    -- Add column
TRUNCATE TABLE Lesson1;                      -- Delete all rows (reset identity)
DROP TABLE Lesson1;                          -- Delete table
--DML data manipulation language
INSERT INTO Lesson1 VALUES (1, 'Jack'), (2, 'Joe');     -- Insert multiple rows
UPDATE Lesson1 SET name = 'Lia' WHERE id = 3;           -- Update specific row
DELETE FROM Lesson1 WHERE id = 5;                       -- Delete specific row
--DQL data query language
SELECT GETDATE();                           -- Current date/time
SELECT * FROM Lesson1;                       -- View table data
SELECT * FROM INFORMATION_SCHEMA.TABLES;     -- All system tables
SELECT * FROM sys.databases;                 -- All databases
SELECT name FROM sys.databases;              -- Only database names
EXEC sp_help 'Lesson1';                      -- View table structure
--TCL transaction control language
BEGIN TRANSACTION;                                      -- Start transaction
DELETE FROM Lesson1 WHERE id = 4 AND name = 'Ross';     -- Make change
ROLLBACK;												-- Undo changes
COMMIT;													-- Save changes
--DCL data control language
CREATE LOGIN FirstLogin WITH PASSWORD = '123Password';   -- Create login
CREATE USER User1 FOR LOGIN FirstLogin;                  -- Create user
CREATE ROLE UserRole;                                    -- Create role
ALTER ROLE UserRole ADD MEMBER User1;                    -- Add user to role
GRANT SELECT ON Newtable TO UserRole;                    -- Grant permission
REVOKE INSERT ON DCL_Test FROM DemoUser;				 -- Remove INSERT permission from the user
DENY SELECT ON DCL_Test TO DemoUser;					 -- Explicitly deny SELECT permission
--Shortcuts
--F5+fn
--Ctrl+Shift+R



create database Review

use Review

--DDL data defination language

create table Lesson1 (id int)

select * from Lesson1

alter table Lesson1 add name varchar(50)

exec sp_help 'Lesson1'

insert into Lesson1 values (1, 'Jack'), (2, 'Joe')

truncate table Lesson1

select * from Lesson1

drop table Lesson1

select * from Lesson1

--DML data manipulation language

select * from Lesson1

--Comment
/*Comment
*/

insert into Lesson1 (id)  values (3)
select * from Lesson1

NULL <> ''

insert into Lesson1 (name) values ('Ross')
select * from Lesson1

insert into lesson1 (name) values (4)
select * from lesson1

insert into lesson1 (id) values ('5')
select * from lesson1

insert into lesson1 (id) values ('sex')  --didnt work

--update
update Lesson1 set name='Lia' where id = 3
select * from lesson1

update lesson1 set id = 4 where id is null
select * from lesson1


select iif(null = null, 1, 0)
select iif(5 = 5, 1, 0)


delete from lesson1  where id = 5
select * from lesson1


--DQL 
select getdate()
select * from lesson1
select * from INFORMATION_SCHEMA.TABLES --all system tables
select * from sys.databases  -- all databases

select name from sys.databases  -- names of databases


-- TCL Transaction Control language
select * from lesson1

begin transaction
delete from lesson1 where id =4 and name = 'Ross'
select * from lesson1


rollback
commit

delete 

--Data Control Language

create login FirstLogin with password  = '123Password'
create user User1 for login FirstLogin

create role UserRole
alter role UserRole add member User1

grant select on Newtable to UserRole




--tasks
create table Class (student_name varchar(50), "overall capacity" int)
select * from Class

alter table Class add subject_name nvarchar(50)
select * from Class

insert into Class (student_name, subject_name) values
('Abdurahmon', 'Matematika'),
('John', 'Physics'),
('손흥민','기예')
select * from Class

truncate table Class

exec sp_help 'Class'


insert into Class (student_name, subject_name) values
(N'Abdurahmon', N'Matematika'),
(N'John', N'Physics'),
(N'손흥민',N'기예')
select * from Class

insert into Class (student_name, subject_name) values
(N'Abdurahmon🚗', N'🚗Matematika')
select * from Class


update Class set "overall capacity" = 30 where subject_name in ('Physics', 'Matematika')
select * from Class













