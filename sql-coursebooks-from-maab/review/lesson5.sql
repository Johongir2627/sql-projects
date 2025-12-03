--MyShortNotes
select * from Testing5 where name like '%tashkent%'
select * from Testing5 where name like '% %'
select * from Testing5 where name like '%[%]%'
select * from Testing5 where name like '%/%%'
select * from Testing5 where name like '%/%%' escape '/'

--union all
select * from Numbers union all select * from Numbers2
--union
select * from Numbers union select * from Numbers2
--intersect
select * from Numbers intersect select * from Numbers2
--except
select * from Numbers except select * from Numbers2

--case
select case when @number % 2 = 0 then 'even' else 'odd' end
--iif
select *, iif(salary<10000, 'low-paid', iif(salary<15000, 'paid', 'well-paid')) from hr.Employees
-- IF
if @studentresult >70
begin
create table AverageResult(result int)
insert into AverageResult values (@studentresult)
end
else 
begin
create table LowResult(result int)
insert into LowResult values (@studentresult)
end

--Aggreagate functions: min max sum avg count
select sum(mov_time) from Movies.movie
--group by
select department_id, sum(salary), max(salary) from hr.Employees group by department_id
--having
select department_id, avg(salary) from hr.Employees group by department_id having avg(salary) > 10000
--inheritet select
select * from Employee.employees where salary = (select max(salary) from Employee.employees)
--in
select * from Employee.employees where salary in 
(select max(salary) from employee.employees group by dep_id) --not true
select * from Employee.employees e where salary in 
(select max(salary) from employee.employees where e.dep_id = dep_id group by dep_id) --true









--review of lesson4
select * from employee.employees order by salary offset 1 rows fetch next 2 rows only
select player_name, dt_of_bir from SOCCER.player_mast where dt_of_bir < '1990-01-01'
select player_name, dt_of_bir, year(getdate())-year(dt_of_bir) as age from soccer.player_mast where age > 30
select * from soccer.player_mast where player_name like 'D_v%'
select * from soccer.player_mast where player_name like 'J%[cmk]%'
--table-filter-display reult


create table Testing5 (name varchar(100))
insert into Testing5 values ('Uzbekistan Tashkent')
insert into Testing5 values ('France%Paris')
insert into Testing5 values ('UK London')
insert into Testing5 values ('Madagascar/%Antananariwu')
insert into Testing5 values ('Russia/Moscow')

select * from Testing5 where name like '%tashkent%'
select * from Testing5 where name like '% %'
select * from Testing5 where name like '%[%]%'
select * from Testing5 where name like '%/%%'
select * from Testing5 where name like '%/%%' escape '/'

--Lesson5
create table Numbers (num int)
insert into Numbers values (3), (2), (4), (1)
create table Numbers2 (num2 int)
insert into Numbers2 values (5), (3), (4), (6)

select * from Numbers
select * from Numbers2

--union all
select * from Numbers
union all
select * from Numbers2

--union
select * from Numbers
union
select * from Numbers2

--intersect
select * from Numbers
intersect
select * from Numbers2


--except
select * from Numbers
except
select * from Numbers2

select * from Numbers2
except
select * from Numbers


select null
union
select null
union all
select null

select null
union all
select null
union 
select null


Use W3Resource
select * from hr.Countries
select * from hr.Regions

select region_id,country_name from hr.Countries
union all
select * from hr.Regions


select region_id,country_name, country_id from hr.Countries
union all
select region_id, region_name, 'WL' from hr.Regions


select region_id,country_name as region_name, country_id from hr.Countries
union all
select region_id, region_name, 'WL' from hr.Regions


declare @number int = 5
select @number%2

select case when @number % 2 = 0 then 'even' else 'odd' end

select *, case when salary < 10000 then 'low-paid' else 'well-paid' end from hr.Employees

select *, case when salary < 10000 then 'low-paid'
				when salary < 15000 then 'paid' else 'well-paid' end from hr.Employees


select *, case when salary < 10000 then 'low-paid'
				when salary < 15000 then 'paid' 
				when salary < 20000 then 'middle-paid' else 'well-paid' end from hr.Employees



--iif
select *, iif(salary<10000, 'low-paid', iif(salary<15000, 'paid', 'well-paid')) from hr.Employees


select *, case when country = 'Sweden' then 'SW'
				when country = 'France' then 'FR' else null end from nobel_win

select *, case when country = 'Sweden' then 'SW'
				when country = 'France' then 'FR' end from nobel_win


select iif(year(getdate()) = 2024, 'Past Year', iif(year(getdate()) = 2025, 'Current Year', iif(year(getdate())>2025, 'New Year', 'Any Year')))


--IF
declare @studentresult as int = 90
if @studentresult >86
begin
create table HighResult(result int)
insert into HighResult values (@studentresult)
end

if @studentresult >70
begin
create table AverageResult(result int)
insert into AverageResult values (@studentresult)
end
else 
begin
create table LowResult(result int)
insert into LowResult values (@studentresult)
end

select * from HighResult
select * from AverageResult
select * from LowResult

drop table HighResult



create table Checking (col1 int, col2 int, col3 int)
insert into Checking values (40, 30, 60)
insert into Checking values (55, 45, 20)
insert into Checking values (15, 28, 72)
insert into Checking values (25, 91, 35)

select * from Checking

select case when col1>=col2 and col1>=col3 then col1
				when col2>=col1 and col2>=col3 then col2
				when col3>=col1 and col3>=col2 then col3
				end as col from Checking


--Aggregate
select max(col1) col1, max(col2) col2, max(col3) col3 from Checking

select 
(select top 1 col1 from Checking order by col1 desc) as col1,
(select top 1 col2 from Checking order by col2 desc) as col2,
(select top 1 col3 from Checking order by col3 desc) as col3


--Max
--min
--avg
--count
--sum
select sum(mov_time) from Movies.movie
select mov_title, sum(mov_time) from Movies.movie group by mov_title
select mov_lang, sum(mov_time) from Movies.movie group by mov_lang
select department_id, sum(salary) from hr.Employees group by department_id
select department_id, sum(salary), max(salary) from hr.Employees group by department_id

select distinct department_id from hr.Employees
select sum(salary) from hr.Employees where department_id = 60
select department_id from hr.employees group by department_id
select department_id, max(salary) from hr.employees group by department_id


--having
select department_id, avg(salary) from hr.Employees group by department_id having avg(salary) > 10000

--inheritet select
select * from Employee.employees where salary = (select max(salary) from Employee.employees)


--in
select * from Employee.employees where salary in 
(select max(salary) from employee.employees group by dep_id) --not true

select * from Employee.employees e where salary in 
(select max(salary) from employee.employees where e.dep_id = dep_id group by dep_id) --true


