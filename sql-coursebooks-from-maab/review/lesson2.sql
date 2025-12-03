--My Shortcuts notes
exec sp_rename 'Lesson2.lastname', 'middlename'    --reanming column name
select * from sys.objects							--objects
select * from sys.databases
select * from sys.tables

select * from sys.master_files
--C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Review.mdf

--MDF master data file: schemas, data, metadata
--LDF log data file: transactional logs, partly to recover
--NDF secondary data file: backup for master data file

--System databases
--master: configurations, logs, settings, 
--model: created databases are template from model database
--msdb: SQL Server agent, XEvent Profiler -> for scheduling
--tempdb: temporary files: order by, 


delete from abc       --DML--erase data only--slower than truncate cuz of specification, 
truncate table abc    --DDL--erase-data only
drop table abc        --DDL--erase fully


declare @simpletext varchar(50) = 'Cambridge'

--int: -2 147 483 648 to 2 147 483 647
--bit +/- is 1, 0 is 0, null is null
--tinyint 0 to 255
--smallint: -32768 to 32767
--bigint: -9 223 372 036 854 775 808 to 9 223 372 036 854 775 807
--decimal(a, b) -- a-overall number of number, b is after comma

--varchar		flexible number of units		nonunicode
--nvarchar		flexible number of units		unicode
--char			solid number of units			nonunicode
--nchar			solid number of units			unicode
--text: can take 2GB of data, others above take data according to specified

--datetime:		2025-10-15 12:01:15.140
--date:		2025-10-15
--time:		12:03:25.8033333
--datetime2:		2025-10-15 12:03:45.4100000
--smalldatetime:		2025-10-15 12:05:00      1900 to 2079

----Schemas
create schema Marketing
create table Marketing.Report(id int)




--reviewing lesson 1
use Review

create table Lesson2 (id int, name varchar(50), lastname varchar(50))
select * from Lesson2


insert into Lesson2 values (1, 'Jack', 'Johnson'), (2, 'Joe', 'Johnson') 
select * from Lesson2

insert into Lesson2 (id, name) values (3, 'Lia'), (6, 'Ross')
select * from Lesson2

update Lesson2 set id = '' where id = 6
select * from lesson2

exec sp_help 'Lesson2'

create table ABC (number int, word varchar(max))
insert into ABC values ('7','7')
insert into ABC values (7,7)
insert into ABC values ('','')
select * from ABC


exec sp_rename 'Lesson2.lastname', 'middlename'    --reanming column name
select * from Lesson2

select * from sys.objects							--objects

begin tran
delete from Lesson2 where middlename is null
rollback
select * from Lesson2
commit


--lesson2
select * from sys.master_files
--C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Review.mdf

--MDF master data file: schemas, data, metadata
--LDF log data file: transactional logs, partly to recover
--NDF secondary data file: backup for master data file

--System databases
--master: configurations, logs, settings, 
--model: created databases are template from model database
--msdb: SQL Server agent, XEvent Profiler -> for scheduling
--tempdb: temporary files: order by, 


select * from abc
delete from abc       --DML--erase data only--slower than truncate cuz of specification, 
truncate table abc    --DDL--erase-data only
drop table abc        --DDL--erase fully


--Data Types: int, varchar, nvarchar

declare @simpletext varchar(50) = 'Cambridge'
select @simpletext


create table Universities(name varchar(7))
insert into Universities values ('Harvard')       --works
select * from Universities
insert into Universities values ('MIT')           --works
select * from Universities
insert into Universities values ('Cambridge')     --doesnt work cuz Cambridge is 9 letters
select * from Universities

declare @simpletext varchar(50) = 'Cambridge'     -- doesnt work
insert into Universities values (@simpletext)
select * from Universities

declare @simpletext varchar(7) = 'Cambridge'      --works
insert into Universities values (@simpletext)
select * from Universities


--Numeric Data Types
declare @Testvar int = 300					--works
select @Testvar
declare @Testvar int = 300000000			--works
select @Testvar
declare @Testvar int = 300000000000			--doesnt work
select @Testvar


--int: -2 147 483 648 to 2 147 483 647
declare @int int = 2147483647			-- work
select @int


--bit +/- is 1, 0 is 0, null is null
declare @bit bit = -234
select @bit


--tinyint 0 to 255
declare @tinyint int = 225
select @tinyint


--smallint: -32768 to 32767
declare @smallint int = 225
select @smallint


--bigint: -9 223 372 036 854 775 808 to 9 223 372 036 854 775 807
declare @bigint int = 225
select @bigint

--decimal(a, b) -- a-overall number of number, b is after comma
declare @decimal decimal(2,2) = 42.25    --doesnt work
select @decimal
declare @decimal decimal(3,2) = 4.25    --works
select @decimal
declare @decimal decimal(4,2) = 4.25    --works
select @decimal
declare @decimal decimal(4,2) = 14.25    --works
select @decimal
declare @decimal decimal(4,2) = 14.252    --works
select @decimal
declare @decimal decimal(4,2) = 114.25    --doesnt work
select @decimal



--Text data types
--varchar		flexible number of units		nonunicode
--nvarchar		flexible number of units		unicode
--char			solid number of units			nonunicode
--nchar			solid number of units			unicode

create table TextTest (char char(20), nchar nchar(20), varchar varchar(20), nvarchar nvarchar(20))
insert into TextTest values ('Good Evening', 'Good Evening', 'Good Evening', 'Good Evening')
select * from TextTest


--text: can take 2GB of data, others above take data according to specified


--Date and time datatypes

--datetime:		2025-10-15 12:01:15.140
declare @datetime datetime = getdate()
select @datetime

--date:		2025-10-15
declare @date date = getdate()
select @date

--time:		12:03:25.8033333
declare @time time = getdate()
select @time

--datetime2:		2025-10-15 12:03:45.4100000
declare @datetime2 datetime2 = getdate()
select @datetime2

--smalldatetime:		2025-10-15 12:05:00      1900 to 2079
declare @smalldatetime smalldatetime = getdate()
select @smalldatetime



----Schemas
select * from Lesson2
go
create schema Marketing
create table Marketing.Report(id int)

select * from Marketing.Report --works
select * from Report		   --doesnot work




select * from sys.databases
select * from sys.tables






