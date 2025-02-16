/*Puzzle 1 A value of 0 signifies the workflow failed, and a value of 1 signifies the workflow passed.
Write an SQL statement that transforms the following table into the expected output.*/

CREATE TABLE #WorkflowCases
(
Workflow  VARCHAR(100) PRIMARY KEY,
Case1     INTEGER NOT NULL DEFAULT 0,
Case2     INTEGER NOT NULL DEFAULT 0,
Case3     INTEGER NOT NULL DEFAULT 0
);
GO

INSERT INTO #WorkflowCases (Workflow, Case1, Case2, Case3) VALUES
('Alpha',0,0,0),('Bravo',0,1,1),('Charlie',1,0,0),('Delta',0,0,0);
GO

select Workflow, case1+case2+case3 as SuccessfulCases from #WorkflowCases


create table RR(Workflow varchar(50), Cases int)
insert into RR (Workflow, Cases) 
select Workflow, Case1 from #WorkflowCases
union all
select Workflow, Case2 from #WorkflowCases
union all
select Workflow, Case3 from #WorkflowCases
select Workflow, sum(cases) from RR
group by Workflow



/*Puzzle 2
Write an SQL statement given the following requirements.
For every customer that had a delivery to California, provide a result set of the customer orders that
were delivered to Texas*/

CREATE TABLE #Orders
(
CustomerID     INTEGER,
OrderID        INTEGER,
DeliveryState  VARCHAR(100) NOT NULL,
Amount         MONEY NOT NULL,
PRIMARY KEY (CustomerID, OrderID)
);
GO

INSERT INTO #Orders (CustomerID, OrderID, DeliveryState, Amount) VALUES
(1001,9,'TX',950),(1001,3,'TX',670),
(1001,4,'TX',860),(2002,5,'WA',320),(3003,6,'CA',650),
(3003,7,'CA',830),(4004,8,'TX',120);
GO

select * from #Orders

select top (select count(*) from #Orders where DeliveryState = 'CA') * from #Orders
where DeliveryState = 'TX'

select * from #Orders o1
left join #Orders o2 on o1.OrderID = o2.OrderID and o2.DeliveryState = 'CA'
where o2.DeliveryState is null and 
o1.CustomerID in (select o.customerid from #Orders o where o.DeliveryState = 'CA' and o1.DeliveryState = 'TX')

select * from #Orders
where DeliveryState = 'TX' and CustomerID in (select customerid from #Orders where DeliveryState = 'CA')


/*Puzzle 3
Your customer phone directory table allows individuals to set up a home, cellular, or work phone
number.
Write an SQL statement to transform the following table into the expected output
*/

CREATE TABLE #PhoneDirectory
(
CustomerID   INTEGER,
[Type]       VARCHAR(100),
PhoneNumber  VARCHAR(12) NOT NULL,
PRIMARY KEY (CustomerID, [Type])
);
GO

INSERT INTO #PhoneDirectory (CustomerID, [Type], PhoneNumber) VALUES
(1001,'Cellular','555-897-5421'),
(1001,'Work','555-897-6542'),
(1001,'Home','555-698-9874'),
(2002,'Cellular','555-963-6544'),
(2002,'Work','555-812-9856'),
(3003,'Cellular','555-987-6541');
GO

select * from #PhoneDirectory

select customerid, max(case when type = 'Cellular' then phonenumber end) as 'Cellular', 
					max(case when type = 'Work' then phonenumber end) as 'Work', 
					max(case when type = 'Home' then phonenumber end) as 'Home' from #PhoneDirectory as PD1
group by CustomerID


/*Puzzle 4
You work for a manufacturing company and need to track inventory adjustments from the warehouse.
Some days the inventory increases, on other days the inventory decreases.
Write an SQL statement that will provide a running balance of the inventory
*/
CREATE TABLE #Inventory
(
InventoryDate       DATE PRIMARY KEY,
QuantityAdjustment  INTEGER NOT NULL
);
GO

INSERT INTO #Inventory (InventoryDate, QuantityAdjustment) VALUES
('7/1/2018',100),('7/2/2018',75),('7/3/2018',-150),
('7/4/2018',50),('7/5/2018',-75);
GO

select * from #Inventory

select a.inventorydate, a.quantityadjustment, 
(select sum(b.quantityadjustment) from #Inventory as b where b.InventoryDate <= a.inventorydate) as runningtotal
from #Inventory a

select i.inventorydate, i.quantityadjustment, sum(ii.quantityadjustment) as runningtotal
from #Inventory as i join #Inventory as ii on i.InventoryDate >= ii.InventoryDate
group by i.QuantityAdjustment, i.InventoryDate
order by i.InventoryDate

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


select s3.student_name, s3.subject_name, count(es.subject_name) as count
from (select * from students1 as s1 cross join Subjects as s2) as s3
left join Examinations as es on s3.student_id = es.student_id and s3.subject_name = es.subject_name
group by s3.student_name, s3.subject_name


select * from students1 as s1 cross join Subjects as s2
select * from Examinations
select st.student_id, student_name, s.subject_name, 
sum(case when st.student_id = e.student_id and s.subject_name = e.subject_name then 1 else 0 end) from Students1 st
cross join Subjects as s
full join Examinations e on e.student_id = st.student_id
group by st.student_id, student_name, s.subject_name


select st.student_name, su.subject_name, count(ex.student_id) as examstaken from Students1 as st
join Subjects as su on su.subject_name = su.subject_name
left join Examinations as ex on st.student_id = ex.student_id and su.subject_name = ex.subject_name
group by st.student_name, su.subject_name
order by su.subject_name

select * from Students1, Subjects

--

Expected Output:

--5 mins

select cast(rand()*6 + 1 as int)

--4 minutes

create table #Customer1(customer_id int, customer_name varchar(max))
create table #Purchases(customer_id int,purch_amt int)
create table #Vegetables(purch_amt int, vegt_name varchar(max))

insert into #Customer1 values (1, 'Alice'), (2, 'Bob'), (13, 'John'), (6, 'Alex')
insert into #Purchases values (1001,5), (1002, 10), (1003, 15), (1004, 4)
insert into #Vegetables values (5 ,'Potato'),(15,'Carrot'),
                (1, 'Onion'), (4,'Potato'),(45,'Tomato'),(23,'Pumpkin')

select * from #Customer1
select * from #Purchases
select * from #Vegetables

select customer_Id , null Cellular ,null Work from #Customer1
        order by customer_id


use W3Resource
go
--20:30
select * from soccer.goal_details
select * from soccer.match_details
select * from soccer.asst_referee_mast
select * from soccer.team_coaches
select * from soccer.coach_mast

select distinct goal_id, goal_time, country_id, win_lose, coach_name
from
SOCCER.goal_details as gd
join 
SOCCER.match_details as md on gd.match_no = md.match_no
join
soccer.asst_referee_mast as arm on md.ass_ref = arm.ass_ref_id
join
soccer.team_coaches as tc on gd.team_id = tc.team_id
join
soccer.coach_mast as cm on cm.coach_id = tc.coach_id

where gd.goal_time > 60 and arm.ass_ref_id not in (1209,1229) and 
md.win_lose = 'D' and cm.coach_name like 'P%'
--
select cast(rand()*6 + 1 as int)
--
CREATE TABLE Production (
    ProductionID INT PRIMARY KEY identity(1,1),  -- Unique production ID
    Product VARCHAR(100) NOT NULL,               -- Product name
    UnitsProduced INT NOT NULL CHECK (UnitsProduced >= 0),  -- Number of units produced
    ProductionDate DATE NOT NULL,                -- Date of production
    FactoryLocation VARCHAR(50) NOT NULL         -- Factory where production occurred
);

INSERT INTO Production (Product, UnitsProduced, ProductionDate, FactoryLocation) 
VALUES
    ('Laptop', 100, '2024-01-05', 'Factory A'),
    ('Smartphone', 200, '2024-01-07', 'Factory B'),
    ('Tablet', 150, '2024-01-10', 'Factory C'),
    ('Smartwatch', 300, '2024-01-12', 'Factory A'),
    ('Headphones', 250, '2024-01-15', 'Factory B'),
    ('Laptop', 120, '2024-01-17', 'Factory C'),
    ('Smartphone', 180, '2024-01-20', 'Factory A'),
    ('Tablet', 140, '2024-01-22', 'Factory B'),
    ('Smartwatch', 280, '2024-01-25', 'Factory C'),
    ('Headphones', 220, '2024-01-28', 'Factory A');

select * from Production

--What is the average production quantity per factory?

--How many total units of each product were produced?

select factorylocation, avg(UnitsProduced) as avgprod
from Production
group by FactoryLocation

select Product, sum(UnitsProduced) as totalunits
from Production
group by Product

--3 minutes
--20:44

select salary, dep_id from employee.employees
where avg(salary) < (select salary from employee.employees group by dep_id)
group by dep_id

select e.emp_name, e.salary, d.dep_name
from Employee.employees e
join Employee.department d on e.dep_id = d.dep_id
where e.salary > (
    select AVG(e2.salary)
    from Employee.employees e2
    where e2.dep_id = e.dep_id
)

select cast(rand()*6 + 1 as int)

create table Competition ( Participant   varchar(50), Winner  varchar (50))
--when we insert winner like '  ' or null it automatically displays 'Group'
select * from Competition

--5 min
--20:55

create trigger Winner on competition
after insert
as begin
update Competition
set Winner = 'Group'
where winner is null or winner = ' ' end

insert into Competition values ('ABC', '')

--10
--21:07

select * from soccer.match_mast
select * from soccer.match_details
select * from soccer.soccer_venue

select smm.match_no,smm.play_date,ssv.venue_name,  sum(smd.goal_score) from
soccer.match_mast smm
left join soccer.match_details smd on smm.match_no = smd.match_no
left join soccer.soccer_venue ssv on ssv.venue_id = smm.venue_id
group by smm.match_no,smm.play_date,ssv.venue_name
order by smm.match_no
