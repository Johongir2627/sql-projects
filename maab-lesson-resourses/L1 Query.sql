--SQL -Structured Query Language

--MAAB
--MAAB2024
--2
--select * from AdventureWorks2019.HumanResources.employee

--Command Types

create database ForLesson1

use ForLesson1

--DDL Data Definition Language

--create
create table NewTable(id int)

--Comment
/*
select getdate()
select 'abc'
*/

--alter
alter table Newtable
add name varchar(50)

exec sp_help 'Newtable'

--insert into NewTable values (1, 'Jack'), (2, 'Joe')

--select * from NewTable
--truncate
--truncate table Newtable
----drop
--drop table NewTable

--DML Data Manipulation Language

insert into NewTable values (1, 'Jack'), (2, 'Joe')

select * from NewTable

insert into NewTable(id) values (3)

NULL <> ''

insert into NewTable(name) values ('Ross')

insert into NewTable(name) values (4)

insert into Newtable(id) values ('5')

select * from newtable

--update
update NewTable
set name = 'Lia'
where id = 3

update NewTable
set id = 4
where id = null

update NewTable
set id = 4
where id is null

select iif(null is null, 1, 0)

select * from NewTable

--delete
delete from NewTable
where id = 5


--DQL
select getdate()

select * from NewTable

select * from INFORMATION_SCHEMA.TABLES

select * from sys.databases

select name from sys.databases

--TCL Transaction Control Language

select * from NewTable

begin transaction
delete from NewTable
where id = 4 and name = 'Ross'

rollback
commit

delete from NewTable
where id = 4 and name = '4'

rollback

begin tran
truncate table Newtable

select * from NewTable
rollback

begin tran 
drop table NewTable

rollback

--DCL Data Control Language

create login FirstLogin with password = '123Password'

create user User1 for login FirstLogin

create role UserRole
alter role UserRole add member User1

grant select on Newtable to UserRole

select * from newtable

--alter
--update

update Newtable
set id = 5
where id = 4

use ForLesson1

create table Class(student_name varchar(50), "overall capacity" int)

--create table Table_name(column_name datatype, column_name2 datatype,...

select * from class

alter table Class
add subject_name nvarchar(50)

--varchar(50)
--nvarchar(50)

insert into Class(student_name, subject_name) values 
('Abdurahmon Odilov', 'Matematika'),
('Иван Иванов', 'Химия'),
('John Johnson', 'Physics'),
('손흥민', '드라마')

select * from Class

insert into Class(student_name, subject_name) values 
(N'Abdurahmon Odilov', N'Matematika'),
(N'Иван Иванов', N'Химия'),
(N'John Johnson', N'Physics'),
(N'손흥민', N'드라마')

truncate table Class

exec sp_help 'Class'

insert into Class(student_name, subject_name) values 
(N'Kimdir Palonchiev🗽', N'🗽Liberty')

select * from Class

update Class
set [overall capacity] = 30
where subject_name = 'Physics' or subject_name = 'Matematika'

select * from Class
where subject_name = 'Physics' or subject_name = 'Matematika'

--F5 + fn
--Ctrl + Shift + R

--You will create a database first
--Create 10 tables in it
--Create a user for this database and grant only select and update commands for this user
--for random 5 tables
