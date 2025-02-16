--use L2

drop database L2

--use L_3

--drop database L_3

--drop database L4

use ForLesson1

select * from sys.tables

select * from class

delete subject_name from Class
where subject_name = 'Physics'

delete  from Class
where subject_name = 'Physics'

select * from NewTable

alter table NEWTABLE
add lastname varchar(max)

update NewTable
set lastname = 'Johnson'
where name = 'Jack' or id = 2


select * from NewTable
where lastname is null

select * from NewTable

update NewTable
set id = ''
where id = 6

exec sp_help 'Newtable'

create table ABC(number int, word varchar(max))
insert into ABC values ('7', '7')
insert into ABC values (7, 7)
insert into ABC values ('', '')

insert into ABC values (4, 'four')

select * from ABC

alter table Newtable
set column name lastname

alter table Newtable
modify column lastname 'MiddleName'

exec sp_rename 'Newtable.lastname', 'middlename'

select * from sys.objects

select * from NewTable

begin transaction
delete from NewTable
where middlename is null

rollback

commit


---------------------------------------------------

create database ForLesson2

use ForLesson2

select * from sys.master_files

--C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ForLesson1.mdf

--MDF -Master Data File

--Schemas, data, metadata

--LDF -Log Data File

--Transactional Logs, partly to recover

--NDF -Secondary Data File

--System databases

--master
--model
--msdb
--tempdb
use ForLesson1

select * from sys.tables



select * from ABC
order by number

select getdate()

delete from ABC

truncate table ABC

drop table ABC

int, varchar, nvarchar

declare @simpletext varchar(7) = 'Cambridge'
select @simpletext

insert into Universities values (@simpletext)

create table Universities(name varchar(7))

insert into Universities values ('Harvard')

insert into Universities values ('MIT')

insert into Universities values ('Cambridge')

select * from Universities


--Numeric Datatypes

--int -2,147,483,648 to 2,147,483,647
--declare @TestVar int = -2147483649
--select @TestVar

--bit 0, 1,  null
--declare @TestVar bit = null
--select @TestVar

----tinyint 0 to 255
--declare @TestVar tinyint = 0
--select @TestVar

--smallint -32768 to 32767
--declare @TestVar smallint = 35000
--select @TestVar

--bigint -9,223,372,036,854,775,808 and 9,223,372,036,854,775,807
--declare @TestVar bigint = 35000
--select @TestVar

--decimal(a,b) a - total numbers, b - decimal numbers  it is equal to numeric(a,b)
declare @TestVar decimal(4, 1) = 151.69
select @TestVar

--Text datatypes

--varchar
--nvarchar

--char
--nchar

create table TextTest(char char(20), nchar nchar(20), varchar varchar(20), nvarchar nvarchar(20))

insert into TextTest values ('Good Evening', 'Good Evening', 'Good Evening', 'Good Evening')

select * from TextTest

--Good Evening        
--Good Evening        
--Good Evening
--Good Evening

Good Evening        

Good Evening

declare @ForChar varchar(max) = 'こんばんは'
select @ForChar

declare @ForNChar nvarchar(max) = N'こんばんは'
select @ForNChar

--text 2GB

--Date and Time datatypes

--datetime  2025-01-10 20:33:08.983
--declare @ForDate datetime = getdate()
--select @ForDate

--date 2025-01-10
--declare @ForDate date = getdate()
--select @ForDate

--time 20:33:48.7833333
--declare @ForDate time = getdate()
--select @ForDate

--datetime2 2025-01-10 20:34:23.5800000
--declare @ForDate datetime2 = getdate()
--select @ForDate

--smalldatetime 1900 2079
--declare @ForDate smalldatetime = getdate()
--select @ForDate


select * from abc
go
create schema Marketing

create table Marketing.Report(id int)

select * from marketing.Report

select * from sys.databases

select * from sys.tables

-- Hometask till the next class, display all of the tables in all databases with one query

--Tools > Options > Text Editor > All Languages > Line Numbers

create table A (datecolumn date)

insert into A values ('12/21/2024')