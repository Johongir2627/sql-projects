use W3Resource
go

--Joins

select *, case when 
month(getdate()) < month(hire_date) then 
	cast(year(getdate()) - year(hire_date) - 1 as varchar(50)) + ' years ' +
		cast(month(getdate())+12 - month(hire_date) as varchar(50)) + ' mon ' + ....
			end
from employee.employees
where manager_id = 68319

select * from employee.employees
where dateadd(year, 8, hire_date) < '1999-12-31'

select * from employee.employees
where salary >= 100 and salary <= 999

--Joins
--Inner join
--Outer join (left join, right join, full join)
--Cross join
--Self join

create table UzbNumbers(Number int, Name varchar(50))
insert into UzbNumbers values (1, 'Bir'), (2, 'Ikki'), (3, 'Uch')

create table RusNumbers(Number int, Name nvarchar(50))
insert into RusNumbers values (1, N'Один'), (2, N'Два'), (4, N'Четыре')

create table EngNumbers(Number int, Name varchar(50))
insert into EngNumbers values (1, 'One'), (2, 'Two'), (5, 'Five')


select * from UzbNumbers
select * from RusNumbers

--Inner join     inner join = join
select uzbnumbers.*, rusnumbers.Name from UzbNumbers
inner join RusNumbers on UzbNumbers.Number = RusNumbers.Number

--Left join
select uzbnumbers.*, rusnumbers.Name from UzbNumbers left join RusNumbers on UzbNumbers.Number = RusNumbers.Number

--Right join
select uzbnumbers.Name, rusnumbers.* from UzbNumbers right join RusNumbers on UzbNumbers.Number = RusNumbers.Number

--Full join
select * from UzbNumbers full join RusNumbers on UzbNumbers.Number = RusNumbers.Number

--Cross join
select * from UzbNumbers
cross join RusNumbers

--select ... from table1 join table2 on table1.column = table2.column

select * from UzbNumbers
select * from RusNumbers
select * from EngNumbers

select * from UzbNumbers
join RusNumbers on UzbNumbers.Number = RusNumbers.Number
join EngNumbers on EngNumbers.Number = UzbNumbers.Number

select * from hr.Employees
select * from hr.Departments

select hr.Employees.*, hr.Departments.department_name from hr.Employees
join hr.Departments on hr.Employees.department_id = hr.Departments.department_id

select e.*, d.department_name from hr.Employees as e
join hr.Departments as d on e.department_id = d.department_id

select e.*, d.department_name from hr.Employees as e
left join hr.Departments as d on e.department_id = d.department_id

select e.*, d.department_name from hr.Employees as e
right join hr.Departments as d on e.department_id = d.department_id

select distinct department_id from hr.Employees

--27 actual departments
--people work in 6 of them
--1 person is not assigned to any
--overall 100 employees

--27
--99
--26
--error
--161
--100
--21

select * from employee.employees
select * from employee.department

select emp_name, job_name, e.dep_id, dep_name from employee.employees as e
join employee.department d on e.dep_id = d.dep_id

select dep_name, emp_name, job_name, e.dep_id from employee.department as d
left join employee.employees e on d.dep_id = e.dep_id

select * from soccer.match_details
select * from soccer.soccer_country

select md.*, sc.country_name from soccer.match_details  md
join soccer.soccer_country sc on md.team_id = sc.country_id


select * from hospital.Patient
select * from hospital.Procedures

select pa.name as [patient name], pr.name as [procedure name] from hospital.patient pa
join hospital.Procedures pr on pa.pcp = pr.code

select * from movies.Movie
select * from movies.Movie_cast

select * from movies.Movie mm
left join movies.Movie_cast mc on mm.mov_id = mc.mov_id
where role is null

select * from movies.Actor

select * from movies.Movie_cast

select * from movies.Movie

select mov_title, trim(act_fname) + ' ' + act_lname as fullname from movies.Actor a
join movies.Movie_cast mc on a.act_id = mc.act_id
join movies.Movie m on m.mov_id = mc.mov_id


--2 min
--Question 1 Return the winners from Russia or USA after the year 1971 including 
select winner from nobel_win
where year >= 1971 and (country = 'Russia' or country = 'USA')

--Question 2 Return how many winners were from France or Germany
select country, count(*) as numberofwinners from nobel_win
where country in ('France', 'Germany')
group by country

--Question 3 Return top 5 movies which got the highest rev_stars in ascending order
select * from (
select top 5 * from movies.Rating
order by rev_stars desc) a
order by rev_stars, mov_id desc
/*
903
922
912
901
908
*/

--Question 4 Return movies and their genres
select * from movies.Movie
select * from movies.Movie_Genres
select * from movies.Genres

select mov_title, gen_title from movies.Movie as m
join movies.Movie_Genres as mg on m.mov_id = mg.mov_id
join movies.Genres as g on g.gen_id = mg.gen_id

--Question 5 Return reviewers who reviewed more than 1 movie 
select * from movies.Reviewer
select * from movies.Rating

select rev_name, count(rev_stars) from movies.Reviewer re
join movies.Rating ra on re.rev_id = ra.rev_id
where rev_name is not null
group by rev_name
having count(rev_stars) > 1

--Question 6 How many goals did France score?
select * from soccer.goal_details
select * from soccer.soccer_country

select count(goal_half), country_name from soccer.goal_details as sd
join soccer.soccer_country as sc on sd.team_id = sc.country_id
where country_name = 'France'
group by country_name

--Cross join

create table Children(name varchar(20))

create table Gifts(gift varchar(20))

insert into Children values ('Ross'), ('Jack'), ('Sandra'), ('Ana'), ('Reina')

insert into Gifts values ('Bag'), ('Flower'), ('Pen')

select * from Children
select * from Gifts

--select ... from table1 cross join table2
select * from Children
cross join Gifts
order by name

select * from UzbNumbers
select * from EngNumbers

select * from UzbNumbers cross join
EngNumbers
where UzbNumbers.Number = EngNumbers.Number

--Self join
--select * from table1 join table1

select * from hr.Employees

select e1.*, e.first_name + ' ' + e.last_name, e.employee_id from hr.Employees e
left join hr.Employees e1 on e.employee_id = e1.manager_id

--Question 7 +3
create table Family(ParentId int, ChildID int)
insert into Family values (1, 2), (2, 3), (3, 4)

select * from Family 

--1 Oldest person in the family --grandfather
--2 Father
--3 Son
--4 Grandson

/*
1 2
1 3
1 4
2 3
2 4
3 4
*/

select f.ParentId, f1.ChildID from Family f
cross join Family f1
where f.ParentId < f1.ChildID
order by f.ParentId

select f1.ParentId, f.ChildID from Family f
join Family f1 on f.ChildID > f1.ParentId

