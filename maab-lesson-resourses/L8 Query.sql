select * from inventory.salesman

select * from inventory.customer

select * from inventory.orders

select * from inventory.Salesman s
left join inventory.Orders o on s.salesman_id = o.salesman_id
join inventory.Customer c on c.customer_id = o.customer_id and c.salesman_id <> s.salesman_id


--14
select * from inventory.Salesman s
left join inventory.Orders o on s.salesman_id = o.salesman_id
join inventory.Customer c on c.customer_id = o.customer_id
where grade > 0 and (o.customer_id = c.customer_id and purch_amt > 2000)



CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    ProductID INT,
    Quantity INT,
    OrderDate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Products (ProductID, ProductName, Price) VALUES
(1, 'Laptop', 1200.00),
(2, 'Mouse', 25.00),
(3, 'Keyboard', 45.00),
(4, 'Monitor', 300.00),
(5, 'Chair', 150.00);

INSERT INTO Orders (OrderID, ProductID, Quantity, OrderDate) VALUES
(1, 1, 5, '2023-01-15'),
(2, 1, 2, '2023-02-20'),
(3, 2, 10, '2023-01-25'),
(4, 5, 1, '2023-03-01'),  -- Order for non-existent product
(5, 4, 3, '2023-01-30');

select * from Products
select * from Orders

--Return all the products with total sold amount and the latest order date, if a product
--does not have any orders show 0 instead of NULL --5 min

select ProductName, isnull(SUM(Price*Quantity), 0) as [Sold Amount], max(OrderDate) as latest_date from Products p
left join Orders o on p.ProductID = o.ProductID
group by ProductName

select * from employee.employees
select * from employee.department

select * from employee.employees e
join employee.department d on e.dep_id = d.dep_id

select * from employee.employees e, employee.department d
where e.dep_id = d.dep_id

select * from employee.employees e
join employee.department d on e.dep_id = d.dep_id and dep_name = 'Marketing'

select * from employee.employees e
join employee.department d on e.dep_id = d.dep_id
where dep_name = 'Marketing'

select * from employee.employees e
right join employee.department d on e.dep_id = d.dep_id and dep_name = 'Marketing'

select * from employee.employees e
right join employee.department d on e.dep_id = d.dep_id
where dep_name = 'Marketing'



select * from employee.employees e
right join employee.department d on e.dep_id = d.dep_id or dep_name = 'Marketing'

--Running total

select * from payments

select payerid, sum(payment_amount) from payments
group by payerid

select p1.payerid, p1.payment_date, p1.payment_amount, sum(p2.payment_amount) as cumulative_payment from payments p1
join payments p2 on p1.payerid = p2.payerid and p1.payment_date >= p2.payment_date
group by p1.payerid, p1.payment_date, p1.payment_amount

select *, sum(payment_amount) over (partition by payerid order by payment_date) from payments

create table InputTbl(col1 varchar(10), col2 varchar(10))
insert into InputTbl values ('a','b'), ('a','b'), ('b','a'), ('c','d'), ('c','d'), ('m','n'), ('n','m')

select * from InputTbl

col1	col2
a		b
c		d
m		n

select * from InputTbl i1
join InputTbl i2 on i1.col1 = i2.col1

select distinct case when col1 < col2 then col1  from inputtbl


select distinct b1.col1, b2.col2 from InputTbl b1
join InputTbl b2 on b1.col1 = b2.col1 where (b1.col1 = 'a' or b1.col1 = 'c' or b1.col1 = 'm') and 
(b2.col2 = 'b' or b2.col2 = 'd' or b2.col2 = 'n')

select distinct col1, col2 from InputTbl
where col2>col1

--Question Return people who made purchases higher than 2000 --2 min
select * from inventory.Orders
select * from inventory.Customer

select * from inventory.Orders io 
join inventory.Customer ic on io.customer_id = ic.customer_id
where purch_amt > 2000
--Follow-up question how many people from each city purchased more than 2000 in a single order
select city, count(*) from inventory.Customer c
join inventory.Orders o on c.customer_id = o.customer_id
where purch_amt > 2000
group by city




CREATE TABLE #Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

CREATE TABLE #Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE
);

CREATE TABLE #Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2)
);

CREATE TABLE #OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT
);

INSERT INTO #Customers (CustomerID, CustomerName) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'David');

INSERT INTO #Orders (OrderID, CustomerID, OrderDate) VALUES
(1, 1, '2023-01-15'),
(2, 2, '2023-02-22'),
(3, 1, '2023-03-10'),
(4, 3, '2023-04-05');

INSERT INTO #Products (ProductID, ProductName, Price) VALUES
(1, 'Laptop', 1200.00),
(2, 'Mouse', 25.00),
(3, 'Keyboard', 45.00);

INSERT INTO #OrderDetails (OrderDetailID, OrderID, ProductID, Quantity) VALUES
(1, 1, 1, 1),
(2, 1, 2, 2),
(3, 3, 1, 1),
(4, 2, 2, 5);


--Question Return all customers along with their total number of orders and the total amount spent on orders

select * from #Customers
select * from #Orders
select * from #Products
select * from #OrderDetails

select customername, count(od.OrderID) as Orders, sum(price*quantity) as total from #Customers as c
left join #Orders as o on c.CustomerID = o.CustomerID
left join #OrderDetails as od on o.OrderID = od.OrderID
left join #Products as p on od.ProductID = p.ProductID
group by CustomerName

--Question 
--Bonus +3



CREATE TABLE PilotSkills
(
pilot CHAR(15) NOT NULL,
plane CHAR(15) NOT NULL,
PRIMARY KEY (pilot, plane)
);
 
INSERT INTO PilotSkills
VALUES ('Celko', 'Piper Cub'),
('Higgins', 'B-52 Bomber'),
('Higgins', 'F-14 Fighter'),
('Higgins', 'Piper Cub'),
('Jones', 'B-52 Bomber'),
('Jones', 'F-14 Fighter'),
('Smith', 'B-1 Bomber'),
('Smith', 'B-52 Bomber'),
('Smith', 'F-14 Fighter'),
('Wilson', 'B-1 Bomber'),
('Wilson', 'B-52 Bomber'),
('Wilson', 'F-14 Fighter'),
('Wilson', 'F-17 Fighter');
 
CREATE TABLE Hangar
(
plane CHAR(15) PRIMARY KEY
);
 
INSERT INTO Hangar
VALUES
('B-1 Bomber'),
('B-52 Bomber'),
('F-14 Fighter');


select * from PilotSkills
select * from Hangar

--Question Return pilots who can fly each plane in the Hangar 10 mins 21:05
--Bonus +3

select distinct pilot from PilotSkills p
join Hangar h on p.plane = h.plane
where count(p.plane) >= count(h.plane)

select pilot from PilotSkills p
join Hangar h on p.plane = h.plane
group by pilot
having count(p.plane) = (select count(*) from Hangar)

select * from PilotSkills p
join Hangar h on p.plane = h.plane