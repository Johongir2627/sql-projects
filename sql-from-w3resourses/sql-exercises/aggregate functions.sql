--Aggregate functions

--1. Calculate Total Purchase Amount of All Orders
--From the following table, write a SQL query to calculate total purchase amount of all orders. Return total purchase amount.
--Sample table: orders
select sum(purch_amt) from Inventory.Orders

--2. Calculate Average Purchase Amount of All Orders
--From the following table, write a SQL query to calculate the average purchase amount of all orders. Return average purchase amount. 
--Sample table: orders
select avg(purch_amt) from Inventory.Orders

--3. Count the Number of Unique Salespeople
--From the following table, write a SQL query that counts the number of unique salespeople. Return number of salespeople.  
--Sample table: orders
select count(salesman_id) from Inventory.Orders

--4. Count the Number of Customers
--From the following table, write a SQL query to count the number of customers. Return number of customers.  
--Sample table: customer
select count(customer_id) from Inventory.Customer

--5. Count Customers with at Least One Grade
--From the following table, write a SQL query to determine the number of customers who received at least one grade for their activity.  
--Sample table: customer
select count(customer_id) from Inventory.Customer
where grade is not null

--6. Find Maximum Purchase Amount
--From the following table, write a SQL query to find the maximum purchase amount.  
--Sample table: orders
select max(purch_amt) from Inventory.Orders

--7. Find Minimum Purchase Amount
--From the following table, write a SQL query to find the minimum purchase amount. 
--Sample table: orders
select min(purch_amt) from Inventory.Orders

--8. Find Highest Customer Grade in Each City
--From the following table, write a SQL query to find the highest grade of the customers in each city. Return city, maximum grade.  
--Sample table: customer
select city, max(grade) from inventory.customer group by city

--9. Find Highest Purchase Amount Ordered by Each Customer
--From the following table, write a SQL query to find the highest purchase amount ordered by each customer. Return customer ID, maximum purchase amount. 
--Sample table: orders
select customer_id, max(purch_amt)  from Inventory.Orders group by customer_id

--10. Highest Purchase by Customer on Date
--From the following table, write a SQL query to find the highest purchase amount ordered by each customer on a particular date. Return, order date and highest purchase amount.
--Sample table: orders
select ord_date, max(purch_amt)  from Inventory.Orders group by ord_date

--11. Highest Purchase Amount by Salesperson on '2012-08-17'
--From the following table, write a SQL query to determine the highest purchase amount made by each salesperson on '2012-08-17'. 
--Return salesperson ID, purchase amount 
--Sample table: orders
select salesman_id, max(purch_amt) from Inventory.Orders
where ord_date = '2012-08-17'
group by salesman_id

--12. Highest Purchase Amount by Customer on Specific Date
--From the following table, write a SQL query to find the highest order (purchase) amount by each customer on a particular order date. 
--Filter the result by highest order (purchase) amount above 2000.00. Return customer id, order date and maximum purchase amount.
--Sample table: orders
select customer_id, ord_date, MAX(purch_amt)
from inventory.orders
group by customer_id, ord_date
having MAX(purch_amt) > 2000.00

--
