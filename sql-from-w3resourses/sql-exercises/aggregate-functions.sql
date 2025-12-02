--aggregate functions


--1. calculate Total Purchase Amount of All Orders
use W3Resource
select sum(purch_amt) from Inventory.Orders



--2. Calculate Average Purchase Amount of All Orders
select avg(purch_amt) from Inventory.Orders


--3. Count the number of Unique Salespeople
select count(distinct salesman_id) from Inventory.Orders


--4. Count the Number of Customers
select count(customer_id) from Inventory.Customer



--5. Count Customers with at least One Grade
select count(*) from Inventory.Customer where grade is not null


--6. Find Maximum Purchase Amount
select max(purch_amt) from Inventory.Orders



--7. Find Minimum Purchase Amount
select min(purch_amt) from Inventory.Orders



--8. Find Highest Customer Grade in Each City
select city, max(grade) from Inventory.Customer group by city


--9. 
select customer_id, max(purch_amt) from Inventory.Orders group by customer_id

--10. Highest Purchase by Customer on Date
select customer_id, ord_date, max(purch_amt) from Inventory.Orders group by ord_date, customer_id








