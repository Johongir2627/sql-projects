use Northwind
go


select * from Customers
order by case when Country = 'Spain' then 0 else 1 end, Country, PostalCode desc


select *, NEWID() from Customers
order by NEWID()

select top 3 ShipCountry, AVG(freight) avgfreight from Orders
where /*year(OrderDate) >= (select max(year(orderdate)) - 1 from Orders) and*/ 
orderdate >= dateadd(MONTH, -12, (select max(orderdate) from Orders))
group by ShipCountry
order by avgfreight desc

--2016-02-15

select * from Employees
select * from Orders
select * from Products
select * from OrderDetails

select e.EmployeeID, LastName, o.OrderID, p.ProductName, od.Quantity from Employees e 
join Orders o on e.EmployeeID = o.EmployeeID
join OrderDetails od on o.OrderID = od.OrderID
join Products p on p.ProductID = od.ProductID
order by od.OrderID, p.ProductID

select * from Orders
where OrderDate in (select EOMONTH(orderdate) from Orders)

select * from Orders
select * from OrderDetails

select top 10 OrderID, count(quantity) cnt from OrderDetails
group by OrderID
order by cnt desc






--Inner Join
--Left Join

use W3Resource
go

select * from Employee.Employees
select * from employee.department

select * from employee.department d
join employee.employees e on d.dep_id = e.dep_id

--Cross apply
select * from employee.department d
cross apply employee.employees e
where d.dep_id = e.dep_id

select * from employee.department d
left join employee.employees e on d.dep_id = e.dep_id

--Outer apply
select * from employee.department d
outer apply employee.employees e
where d.dep_id = e.dep_id

select * from employee.department d
cross apply (select * from employee.employees e where d.dep_id = e.dep_id) a

select * from employee.department d
outer apply (select * from employee.employees e where d.dep_id = e.dep_id) a

--cross apply ~ inner join

--outer apply ~ left join

select * from employee.department d
join employee.employees e on d.dep_id = e.dep_id

select * from employee.department d
cross apply (select * from employee.employees e where d.dep_id = e.dep_id) a

select * from employee.department d
left join employee.employees e on d.dep_id = e.dep_id

select * from employee.department d
outer apply (select * from employee.employees e where d.dep_id = e.dep_id) a

select year(getdate())

create function Dep_Name(@DepID as int)
returns table
as
return(
select * from employee.department
where dep_id = @depID)

select * from Dep_Name(2001)

select * from employee.employees
join Dep_Name(dep_id) on dep_id = dep_name(dep_id)

select * from employee.employees
cross apply Dep_Name(dep_id)

CREATE TABLE Colleagues
(
 
[Workplace] [varchar] (50) NULL,
[Name] [varchar] (50) NULL,
[Roles] [varchar] (50) NULL
)
 
GO
--Insert data in the table
 
INSERT INTO Colleagues(Workplace,Name,Roles)
SELECT 'A','John','Engineer'
UNION ALL
SELECT 'A','Jack','Officer'
UNION ALL
SELECT 'B','John','Manager'
UNION ALL
SELECT 'B','Jack','Manager'
UNION ALL
SELECT 'D','John','Chairman'
UNION ALL
SELECT 'E','Jack','Department Head'

--Return people who worked at the same workplace in the same role
select c.* from Colleagues c
cross apply Colleagues c1
where c.Workplace = c1.Workplace and c.Roles = c1.Roles and c.Name <> c1.Name

CREATE TABLE #Cart1
(
Item  VARCHAR(100) PRIMARY KEY
);
GO

CREATE TABLE #Cart2
(
Item  VARCHAR(100) PRIMARY KEY
);
GO

INSERT INTO #Cart1 (Item) VALUES
('Sugar'),('Bread'),('Juice'),('Soda'),('Flour');
GO

INSERT INTO #Cart2 (Item) VALUES
('Sugar'),('Bread'),('Butter'),('Cheese'),('Fruit');
GO

select isnull(c1.Item, 'Does not match') as FirstItem, isnull(c2.Item, 'Does not match') as SecondItem from #Cart1 c1
full join #Cart2 c2 on c1.Item = c2.Item


Person1   Person2   Person3
Q1			Q2
			Q1			Q1
Q2						Q2

create table Students1(student_id int, student_name varchar(max))
create table Subjects(subject_name varchar(max))
create table Examinations(student_id int, subject_name varchar(max))

insert into Students1 values (1, 'Alice'), (2, 'Bob'), (13, 'John'), (6, 'Alex')
insert into Subjects values ('Math'), ('Physics'), ('Programming')
insert into Examinations values (1, 'Math'), (1, 'Physics'), (1, 'Programming'), (2, 'Programming'), 
                (1, 'Physics'), (1, 'Math'), (13, 'Math'), (13, 'Programming'), 
                (13, 'Physics'), (2, 'Math'), (1, 'Math')


select * from Students1
select * from Subjects
select * from Examinations

--till 21:00

