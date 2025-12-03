--MyShortNotes
--Loading data

--ImportFlatFile
--1)right click on name of database 2) Tasks 3) Import Flat files
--1)click Next and it goes "Specified Input file" 2) Browse 3) choose file and cilick next until end

--Import File
--RightClick -> Import-> SQL Server Import and Export Wizard -> FlatFileSource -> SQLServerNativeClient11.0.

--Bulk insert
bulk insert Customers
from 'C:\SQL-projects\sql-projects\maab-lesson-resourses\Review\Customers.txt'
with (fieldterminator = ',', rowterminator = '\n', firstrow = 2)

--Excel
exec sp_configure 'show advanced options', 1 
reconfigure
exec sp_configure 'Ad Hoc Distributed Queries', 1
reconfigure

Create table students (name varchar(max), mark int)
insert into Students
select * from 
openrowset (
'Microsoft.ACE.OLEDB.12.0',
'Excel 12.0; Database=C:\SQL-projects\sql-projects\maab-lesson-resourses\Review\Students.xls; HDR=YES',
'select * from [Students$]'
)

--Constraints
--not null
create table B  (id int not null, name varchar(50))
--updating not null
update A set id = 0 where id is null
alter table A alter column id int not null
--identity       creating auto increase
create table C (id int identity(1,1), name varchar(50))
--turning on/off identity
set identity_insert Review.dbo.C on
insert into C (id, name) values (10, 'Jonathan')
set identity_insert Review.dbo.C off
--Notes: only one constraint per table
--Unique
create table D (student_id int unique, name varchar(50))
--removing unique contraint
exec sp_help 'D'  -- UQ__D__2A33069B357831AF
alter table D drop constraint UQ__D__2A33069B357831AF
--adding unique constraint
delete from D where student_id = 2
alter table D add constraint UQ_Students unique(student_id)
--Check
create table E (name varchar(20), age int, check (age >= 18))
--Default
create table F (fullname text, address text default 'Tashkent')
insert into F(fullname) values ('Son')


--Promary key = Unique + not null
create table H (doc_id int primary key, doc_name varchar(50))
--Foreign key   = referencing only primary key and null
create table Emps_docs(emp_id int primary key, doc_id int foreign key references H(doc_id))
--opening primary/secondary key window
--right click, properties, files, Owner='sa', right click on Database diagramm, yes




--Lesson 3
use Review
go 
create table Lesson3 (name varchar(50), lastname varchar(50))
insert into Lesson3 values ('Shawn', 'O''riely')
select * from lesson3

--1)right click on name of database 2) Tasks 3) Import Flat files
--1)click Next and it goes "Specified Input file" 2) Browse 3) choose file and cilick next until end

select * from Customers


--RightClick -> Import-> SQL Server Import and Export Wizard -> FlatFileSource -> SQLServerNativeClient11.0.

select * from Customers1

--bulk insert

select * from Customers
truncate table Customers
select * from Customers

bulk insert Customers
from 'C:\SQL-projects\sql-projects\maab-lesson-resourses\Review\Customers.txt'
with (
	fieldterminator = ',',
	rowterminator = '\n',
	firstrow = 2
)
select * from Customers
truncate table Customers
select * from Customers

--by excel
exec sp_configure 'show advanced options', 1
reconfigure

exec sp_configure 'Ad Hoc Distributed Queries', 1
reconfigure

Create table students (name varchar(max), mark int)
insert into Students
select * from 
openrowset (
'Microsoft.ACE.OLEDB.12.0',
'Excel 12.0; Database=C:\SQL-projects\sql-projects\maab-lesson-resourses\Review\Students.xls; HDR=YES',
'select * from [Students$]'
)

--Contraints
--create table table_name (column_name datatype constraint....
create table A (id int, name varchar(50))
insert into A values (1, 'Ryan')
insert into A values (null, 'Logan')
insert into A values (2, null)
select * from A

--not null
create table B  (id int not null, name varchar(50))
insert into  B values (1, 'Ryan')				--works
insert into  B values (null, 'Logan')			--doesnt work
insert into  B values (2, null)					--work
select * from B

--updating contraint
select * from A
update A set id = 0 where id is null
select * from A
alter table A alter column id int not null

--identity       creating auto increase
create table C (id int identity(1,1), name varchar(50))
insert into C (name) values ('Sarah')
insert into C (name) values ('John')
insert into C (name) values ('Aiden')
select * from C

--turning on/off identity
set identity_insert Review.dbo.C on
insert into C (id, name) values (10, 'Jonathan')
set identity_insert Review.dbo.C off
select * from C


--Notes: only one constraint per table

--Unique
create table D (student_id int unique, name varchar(50))
insert into D values (1, 'John')
insert into D values (2, 'Sarah')
insert into D values (3, 'Aiden')
insert into D values (2, 'Kyle')
select * from D

--removing unique contraint
exec sp_help 'D'  -- UQ__D__2A33069B357831AF
alter table D drop constraint UQ__D__2A33069B357831AF

--adding unique constraint
delete from D where student_id = 2
select * from D
alter table D add constraint UQ_Students unique(student_id)

--Check
create table E (name varchar(20), age int, check (age >= 18))
insert into E values ('John',32)
insert into E values ('John',42)
insert into E values ('John',12)
select * from E

--Default
create table F (fullname text, address text default 'Tashkent')
insert into F values ('Son', 'Seoul')
insert into F values ('Son', '')
insert into F values ('Son', null)
insert into F values ('Son', '   ')
insert into F(fullname) values ('Son')
select * from F



--Promary key = Unique + not null
create table H (doc_id int primary key, doc_name varchar(50))
insert into H values (101, 'General Informatio page')  --works
insert into H values (102, 'General Informatio page')  --works
insert into H values (103, 'General Informatio page')  --works
insert into H values (101, 'General Informatio page')  --doesnot work cuz duplicating
insert into H values (null, 'General Informatio page') --doesnot work cuz null
select * from H


--Foreign key   = referencing only primary key and null
create table Emps_docs(emp_id int primary key, doc_id int foreign key references H(doc_id))
insert into Emps_docs values (1, 101)  --works
insert into Emps_docs values (2, 101)  --works
insert into Emps_docs values (3, 102)  --works
insert into Emps_docs values (4, 104)  --doesnot work cuz not in H 
insert into Emps_docs values (5, null) --works
insert into Emps_docs values (5, '')   --doesnot work cuz not in 0

select * from Emps_docs


--opening primary/secondary key window
--right click, properties, files, Owner='sa', right click on Database diagramm, yes
