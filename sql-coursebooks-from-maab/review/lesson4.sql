--MyShortNotes
--trigger
create trigger ForPersonAddress on PersonAddress
after insert as begin
update PersonAddress set address = 'Tashkent' where address is null or address = ''
end


--restoring database: right click, show in folder, copy, 
--C:ProgramFiles\Microsoft SQL Server\MSSQL15...\MSSQL\Backup\Paste
--right-click on Databases, Restore database, switch Databases to Device, ... , Add, Refresh, W3Resource, Ok,ok,ok...


--order by
select * from Employee.employees order by dep_id
--distinct
select distinct dep_id, job_name from Employee.employees
--top n
select top 3 * from Employee.employees order by salary desc
-- top n with ties
select top 2 with ties * from Employee.employees order by salary desc
--top n percent 
select top 10 percent * from Employee.employees order by salary desc
--offset and fetch ///from 3 to 7
select * from Employee.employees order by hire_date
offset 2 rows fetch next 4 rows only
--isnull
select isnull(commission, 123), * from Employee.employees
--coalesce
select coalesce(commission, manager_id, 11111111111), * from Employee.employees
--where
select * from nobel_win where year = 1970
--in
select * from nobel_win where country in ('Germany', 'Sweden', 'Russia')
--wildcards
select * from nobel_win where winner like '%n%'
select * from nobel_win where winner like '_n__%'
select * from nobel_win where winner like '[A-E]%'
select * from nobel_win where winner like '[ADHM]%'









--Homework
use Review
go
create table Personaddress (fullname varchar(50), address varchar(50) default 'Tashkent')
insert into Personaddress values ('Luiz Felipe', 'Brazil')
insert into Personaddress values ('Luiz Felipe', 'Brazil')
insert into Personaddress values ('Luiz Felipe', '')
select * from Personaddress

update Personaddress set address = 'Tashkent' where address is null or address = ''

--trigger
create trigger ForPersonAddress on Personaddress
after insert
as
begin 
update Personaddress set address = 'Tashkent' where address is null or address = ''
end

insert into Personaddress values ('Luiz Felipe', '')
select * from Personaddress



--Lesson4
--restoring database: right click, show in folder, copy, 
--C:ProgramFiles\Microsoft SQL Server\MSSQL15...\MSSQL\Backup\Paste
--right-click on Databases, Restore database, switch Databases to Device, ... , Add, Refresh, W3Resource, Ok,ok,ok...

select * from sys.tables
use W3Resource
go
select * from Employee.employees
order by salary desc

--order by
select * from Employee.employees order by dep_id

select * from Employee.employees
order by dep_id, salary desc

select * from Employee.employees
order by dep_id, job_name, hire_date desc

select distinct dep_id from Employee.employees
select dep_id from Employee.employees

--distinct
select distinct dep_id, job_name from Employee.employees

--top n
select top 3 * from Employee.employees order by salary desc
select * from Employee.employees order by commission

-- top n with ties
select top 2 with ties * from Employee.employees order by salary desc

--top n percent 
select top 10 percent * from Employee.employees order by salary desc

--offset and fetch ///from 3 to 7
select * from Employee.employees order by hire_date
offset 2 rows fetch next 4 rows only


--isnull
select isnull(commission, 123), * from Employee.employees

--coalesce
select coalesce(commission, manager_id, 11111111111), * from Employee.employees

--where
select * from nobel_win where year = 1970
select * from nobel_win where year = 1970 or year = 1978
select * from nobel_win where year = 1970 and year = 1978
select * from nobel_win where year between 1970 and 1978
select * from nobel_win where year >= 1970 or year <= 1978
select * from nobel_win where year >= 1970 and year <= 1978

--in
select * from nobel_win where country in ('Germany', 'Sweden', 'Russia')

--wildcards
select * from nobel_win where winner like '%n%'
select * from nobel_win where winner like '_n__%'
select * from nobel_win where winner like '[A-E]%'
select * from nobel_win where winner like '[ADHM]%'

