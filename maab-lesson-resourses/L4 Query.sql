create database ForLesson3
go
use ForLesson3
go

create table Customers(name varchar(50), lastname varchar(50))
insert into Customers values ('Shawn', 'O''rieley')

select * from Customers

truncate table Customers

select * from newcustomers

--Ctrl + Shift + R

select * from students

bulk insert customers 
from 'D:\MAAB\MAAB Sql\Scholarship Holders\L3\Customers.txt'
with(
fieldterminator = ',',
rowterminator = '\n',
firstrow = 2)

select * from Customers

truncate table students

bulk insert students 
from 'D:\MAAB\MAAB Sql\Scholarship Holders\L3\Students.xlsx'
with(
fieldterminator = ',',
rowterminator = '\n',
firstrow = 2)

exec sp_configure 'show advanced options', 1
reconfigure

exec sp_configure 'Ad Hoc Distributed Queries', 1
reconfigure

insert into Students
select * from 
openrowset(
'Microsoft.ACE.OLEDB.12.0',
'Excel 12.0; Database=D:\MAAB\MAAB Sql\Scholarship Holders\L3\Students.xlsx; HDR=YES',
'Select * from [Sheet1$]')

select * from Students

--Constraints
-- create table table_name (column_name datatype constraint, column_name2 datatype constratint2, ...

create table A (id int, name varchar(20))

insert into A values (1, 'Ryan')
insert into A values (null, 'Logan')
insert into A values (2, null)

select * from A

update A
set id = 0
where id is null

alter table A
alter column id int not null
--not null
create table B (id int not null, name varchar(20))

insert into B values (1, 'Ryan')
insert into B values (null, 'Logan')
insert into B values (2, null)

select * from B

--identity

create table C(id int identity(1,1), name varchar(50))

insert into C(name) values ('Jackson')
insert into C(name) values ('Michael')
insert into C(name) values ('Maria')
insert into C(id, name) values (10, 'Alexandro')

select * from C

set identity_insert Forlesson3.dbo.C off
--An explicit value for the identity column in table 'C' can only be specified 
--when a column list is used and IDENTITY_INSERT is ON.

--Only one constraint per table

--Unique
create table D(student_id int unique, name varchar(20))

insert into D values (1, 'Kobby')
insert into D values (2, 'Mexa')
insert into D values (3, 'Alex')
insert into D values (2, 'Meixa')
insert into D values (4, 'Alex')

select * from D

exec sp_help 'D'

alter table D
drop constraint UQ__D__2A33069BD23BB3B8

alter table D
add constraint UQ_Students unique(student_id)

update D
set student_id = 20
where student_id = 2 and name = (select name from D
where LEN(name) = (
select max(len(name)) from D
where student_id = 2) and student_id = 2)

select name from D
where LEN(name) = (
select max(len(name)) from D
where student_id = 2) and student_id = 2


--Check
create table E(name varchar(20), age int, check (age >= 18))

insert into E values ('Seb' , 27)
insert into E values ('Thomas', 30)
insert into E values ('Harry', 15)

select * from E

--Default
create table F(fullname text, address text default 'Tashkent')

insert into F values ('Park Ji Sung', 'Seoul')
insert into F values ('Harry Wayne', 'Manchester')
insert into F values ('Lisandro Martinez', '')
insert into F(fullname) values ('Odil Axmedov')

insert into F values ('Andre Berchiche', null)

select * from F

--Hometask
--Whenever a user enters blank ('', '  ') or null to F(address) it should automatically change it to Tashkent

create table G(name varchar(50), address varchar(50), check(address is not null and trim(address) <> ''))

insert into G values ('Romano', 'Italy')
insert into G values ('Federico', 'Bilbao')
insert into G values ('Sergio', null)

--Primary Key
--Foreign Key

--Primary key = Unique + Not null

create table H(doc_id int primary key, doc_name varchar(50))

insert into H values (101, 'General Overview')
insert into H values (102, 'Details About Transactions')
insert into H values (103, 'Customer Details')

insert into H values (null, 'Main Information')

create table Emps_Documents (emp_id int primary key, doc_id int foreign key references H(doc_id))

insert into Emps_Documents values (1, 101)
insert into Emps_Documents values (2, 101)
insert into Emps_Documents values (3, 102)
insert into Emps_Documents values (4, 103)
insert into Emps_Documents values (5, 104)
insert into Emps_Documents values (6, null)
insert into Emps_Documents values (7, '')

select * from Emps_Documents

create table Course(Course_id int primary key, 
course_name varchar(50))

create table Lecturer(Lecturer_id int primary key,
lecturer_name varchar(50),
course_id int foreign key references Course(Course_id))

create table Subject(subject_id int primary key, 
subject_name varchar(50),
lecturer_id int foreign key references Lecturer(lecturer_id))

create table Student(student_id int primary key,
student_name varchar(50),
DOB date, 
Door# varchar(50),
Street varchar(50),
City varchar(50),
State varchar(50),
PIN int,
Course_id int foreign key references Course(Course_id))

create table Stud_Hobby(student_id int foreign key references
Student(student_id),
Hobby text)
