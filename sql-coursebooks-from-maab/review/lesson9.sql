-- Notes
select *, NEWID() from Orders order by NEWID()											--NEWID() function
select * from orders where OrderDate in (select EOMONTH(orderdate) from Orders)			--EOMONTH() function

--Cross Apply, Outer Apply vs Joins
/* inner join */select * from Employee.department d inner join Employee.employees e on e.dep_id = d.dep_id   /* 14 rows */
/* left join */select * from Employee.department d left join Employee.employees e on e.dep_id = d.dep_id   /* 15 rows */

/* cross apply */select * from Employee.department d cross apply Employee.employees e where e.dep_id = d.dep_id   /* 14 rows */
/* outer apply */select * from Employee.department d outer apply Employee.employees e where e.dep_id = d.dep_id   /* 14 rows */

/* cross apply */select * from Employee.department d cross apply (select * from Employee.employees e where e.dep_id = d.dep_id) a   /* 14 rows */
/* outer apply */select * from Employee.department d outer apply (select * from Employee.employees e where e.dep_id = d.dep_id) a   /* 14 rows */

/* table functions dont work in joins*/ select * from Employee.employees join dep_name(dep_id) on dep_id = dep_name(dep_id)
/* table functions work in cross apply*/ select * from Employee.employees cross apply dep_name(dep_id)

--CREATING FUNCTIONS
create function Dep_Name(@DepID as int)			--creating function: name and variable
returns table									--what it returns
as												--as 
return(											--return part
select * from Employee.department
where dep_id = @DepID)

select * from Dep_Name(1001)






--review
--Northwind
-- sort by region but null vakues in the last
select *  from Customers order by coalesce(region, 'zzzzzzzzz'), CustomerID
select * from Customers order by case when region is not null then 0 else 1 end, Region, CustomerID

-- select top 3 avg frieght by shipped countries in the last 12 months
select top 3 ShipCountry, AVG(Freight) from orders 
where OrderDate >= dateadd(month, -12, (select max(orderdate) from orders))
group by ShipCountry order by AVG(Freight) desc

--NEWID() function
select *, NEWID() from Orders order by NEWID()

--EOMONTH() function
select * from orders where OrderDate in (select EOMONTH(orderdate) from Orders)

----------------------------------------
/* inner join */select * from Employee.department d inner join Employee.employees e on e.dep_id = d.dep_id   /* 14 rows */
/* left join */select * from Employee.department d left join Employee.employees e on e.dep_id = d.dep_id   /* 15 rows */

/* cross apply */select * from Employee.department d cross apply Employee.employees e where e.dep_id = d.dep_id   /* 14 rows */
/* outer apply */select * from Employee.department d outer apply Employee.employees e where e.dep_id = d.dep_id   /* 14 rows */

/* cross apply */select * from Employee.department d cross apply (select * from Employee.employees e where e.dep_id = d.dep_id) a   /* 14 rows */
/* outer apply */select * from Employee.department d outer apply (select * from Employee.employees e where e.dep_id = d.dep_id) a   /* 14 rows */

/* table functions dont work in joins*/ select * from Employee.employees join dep_name(dep_id) on dep_id = dep_name(dep_id)
/* table functions work in cross apply*/ select * from Employee.employees cross apply dep_name(dep_id)
-------------------------------------
--CREATING FUNCTIONS
create function Dep_Name(@DepID as int)
returns table
as
return(
select * from Employee.department
where dep_id = @DepID)

select * from Dep_Name(1001)


--Task 1. Return people works in the same workplace and role
CREATE TABLE #Colleagues
(
[Workplace] [varchar] (50) NULL,
[Name] [varchar] (50) NULL,
[Roles] [varchar] (50) NULL
)
 
GO
--Insert data in the table
INSERT INTO #Colleagues(Workplace,Name,Roles)
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

---Answer
select c1.* from #Colleagues c1 cross apply #Colleagues c2
where c1.Workplace = c2.Workplace and c1.Roles = c2.Roles and c1.Name <> c2.Name


--Task 2. 
CREATE TABLE #Cart1 (Item  VARCHAR(100) PRIMARY KEY);
GO
CREATE TABLE #Cart2 (Item  VARCHAR(100) PRIMARY KEY);
GO
INSERT INTO #Cart1 (Item) VALUES('Sugar'),('Bread'),('Juice'),('Soda'),('Flour');
GO
INSERT INTO #Cart2 (Item) VALUES('Sugar'),('Bread'),('Butter'),('Cheese'),('Fruit');
GO

--Answer
select coalesce(c1.Item, 'Does not match') FirstItem, 
	coalesce(c2.Item, 'Does not match') Seconditem 
from #Cart1 c1 full join #Cart2 c2 on c1.Item = c2.Item



--Game
