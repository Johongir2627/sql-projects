--boolean and relational operators

--1. 
/*From the following table, write a SQL query to locate the details of customers with grade 
values above 100. Return customer_id, cust_name, city, grade, and salesman_id.*/
select customer_id, cust_name, city, grade, salesman_id from Inventory.Customer where grade > 100



--2.
/*From the following table, write a SQL query to find all the customers in ‘New York’ city who have 
a grade value above 100. Return customer_id, cust_name, city, grade, and salesman_id*/
select customer_id, cust_name, city, grade, salesman_id from Inventory.Customer where grade > 100
and city = 'new york'



--3.
/*From the following table, write a SQL query to find customers who are from the city of New York or 
have a grade of over 100. Return customer_id, cust_name, city, grade, and salesman_id.*/
select customer_id, cust_name, city, grade, salesman_id from Inventory.Customer where grade > 100
or city = 'new york'



--4.
/*From the following table, write a SQL query to find customers who are either from the city 'New York'
or who do not have a grade greater than 100. Return customer_id, cust_name, city, grade, and salesman_id. */
select customer_id, cust_name, city, grade, salesman_id from Inventory.Customer where grade <= 100
or city = 'new york'



--5.
/*From the following table, write a SQL query to identify customers who are not from the city of 'New York'
and do not have a grade value greater than 100. Return customer_id, cust_name, city, grade, and salesman_id.*/
select customer_id, cust_name, city, grade, salesman_id from Inventory.Customer where grade <= 100
and city != 'new york'




--6.
/*From the following table, write a SQL query to find details of all orders excluding those with ord_date equal
to '2012-09-10' and salesman_id higher than 5005 or purch_amt greater than 1000.Return ord_no, purch_amt, 
ord_date, customer_id and salesman_id.*/
select ord_no, purch_amt, ord_date, customer_id, salesman_id from Inventory.Orders 
where ord_date = '2012-09-10' and salesman_id > 5005 or purch_amt > 1000




--7.
/*From the following table, write a SQL query to find the details of those salespeople whose commissions
range from 0.10 to0.12. Return salesman_id, name, city, and commission. */
select salesman_id, name, city, commission from Inventory.Salesman where commission between 0.10 and 0.12




--8. 
/*From the following table, write a SQL query to find details of all orders with a purchase amount 
less than 200 or exclude orders with an order date greater than or equal to '2012-02-10' and a customer
ID less than 3009. Return ord_no, purch_amt, ord_date, customer_id and salesman_id*/
select ord_no, purch_amt, ord_date, customer_id, salesman_id from inventory.Orders 
where purch_amt < 200 or (ord_date < '2012-02-10' and customer_id < 3009)


--9. 
/*From the following table, write a SQL query to find all orders that meet the following conditions. 
Exclude combinations of order date equal to '2012-08-17' or customer ID greater than 3005 and purchase 
amount less than 1000.*/
select * from Inventory.Orders where not ((ord_date = '2012-08-17' or customer_id > 3005) 
and purch_amt < 1000)


--10.
/*Write a  SQL query that displays order number, purchase amount, and the achieved and unachieved
percentage (%) for those orders that exceed 50% of the target value of 6000. */

select ord_no, purch_amt, (100 *purch_amt) / 6000  'Achieved %', 
100 * (6000 - purch_amt) / 6000 'Unachieved %' from Inventory.Orders
where (100 * purch_amt) / 6000 > 50



--11. 
select emp_idno, 
	emp_fname, 
	emp_lname 
from emp_details
where emp_lname in ('Dosny', 'Mardy')




--12
select emp_idno, emp_fname, emp_lname, emp_dept 
from emp_details 
where emp_dept between 47 and 63





























