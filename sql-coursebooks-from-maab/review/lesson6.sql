--MyShortNotes
--any
--all

--pivot: column_names: name, fruit
select  name, [Apple], [Orange], [Banana] from 
(select name, fruit from Fruits) as sourcetable
pivot(count(fruit) for fruit IN ([Apple], [Orange], [Banana])) as pivottable




use W3Resource
go
--Question1. Return fullname of employees who get commissions and whose managers are Gerald Cambrault and/or Eleni Zlotkey
select first_name + ' ' + last_name from hr.Employees where commission_pct > 0 and manager_id in (select employee_id from hr.Employees 
where (first_name = 'Gerald' and last_name = 'Cambrault') or (first_name = 'Eleni' and last_name = 'Zlotkey'))

--Question2. Return employees who get more than the average salary in the company
select * from hr.Employees where salary > (select avg(salary) from hr.Employees)

--Question 2.2 Find the number of employees in each department who get more than the average salary
select department_id, count(*) from  (select * from hr.employees where salary > (select avg(salary) from hr.Employees)) a  group by department_id

--Question 3. Return those rows where at least one column contains a value other than 0
create table TestMultipleZero(A int, B int, C int, D int)
insert into TestMultipleZero values (0,0,0,1), (0,0,1,0), (0,1,0,0), (1,0,0,0), (0,0,0,0), (1,1,1,0)
select * from TestMultipleZero
select * from TestMultipleZero where A != 0 or B != 0 or C != 0 or D != 0
select * from TestMultipleZero where A+B+C+D>0

--Question 4 For each department, return the highest salary, the number of employees, and the number of distinct managers
select dep_id, max(salary), count(*), count(distinct manager_id) from Employee.Employees group by dep_id

--Question 5.1 Return English movies which were released after 1990
select * from movies.Movie
where mov_lang = 'English' and year(mov_dt_rel) >= 1990

--Question 5.2 Return those movies which were released after Chinatown in the same country
select * from movies.Movie
where mov_rel_country in (select mov_rel_country from movies.Movie
where mov_title = 'Chinatown')
and mov_dt_rel > all(select mov_dt_rel from movies.Movie
where mov_title = 'Chinatown')

--any
--all

--Question 6. Return the names of employees whose salary is greater than any employee in the 3001 department
select * from employee.employees
where salary > any(select salary from employee.employees where dep_id = 3001)

--Question 7. Return how many fruits does each person have in individual fruit level

create table Fruits(Name varchar(50), Fruit varchar(50))
insert into Fruits values ('Francesko', 'Apple'), ('Francesko', 'Apple'), ('Francesko', 'Apple'), ('Francesko', 'Orange'),
							('Francesko', 'Banana'), ('Francesko', 'Orange'), ('Li', 'Apple'), 
							('Li', 'Orange'), ('Li', 'Apple'), ('Li', 'Banana'), ('Mario', 'Apple'), ('Mario', 'Apple'), 
							('Mario', 'Apple'), ('Mario', 'Banana'), ('Mario', 'Banana'), 
							('Mario', 'Orange')

select * from Fruits

select  Name, [Apple], [Orange], [Banana] from 
(select name, fruit from Fruits) as sourcetable
pivot(count(fruit) for fruit IN ([Apple], [Orange], [Banana])) as pivottable

select name, count(case when fruit = 'Apple' then fruit else null end) as Apple,
				count(case when fruit = 'Orange' then fruit else null end) as Orange,
				count(case when fruit = 'Banana' then fruit else null end) as Banana from Fruits
group by Name

select Name, sum(case when fruit = 'Apple' then 1 else null end) as Apple,
				sum(case when fruit = 'Orange' then 1 else null end) as Orange,
				sum(case when fruit = 'Banana' then 1 else null end) as Banana from Fruits
group by Name
