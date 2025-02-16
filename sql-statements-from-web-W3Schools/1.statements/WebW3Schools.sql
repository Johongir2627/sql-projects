

SELECT * FROM Customers;




SELECT CustomerName,City FROM Customers;




SELECT DISTINCT Country FROM Customers;




SELECT COUNT(DISTINCT Country) FROM Customers;




--distinct in ms access
SELECT Count(*) AS DistinctCountries
FROM (SELECT DISTINCT Country FROM Customers);


--WHERE
SELECT * FROM Customers WHERE Country='Mexico';
SELECT * FROM Customers WHERE CustomerID=1;



--ORDER BY
SELECT * FROM Products ORDER BY Price;
SELECT * FROM Products ORDER BY Price DESC;


--For string values the ORDER BY keyword will order alphabetically:
SELECT * FROM Products ORDER BY ProductName;
SELECT * FROM Products ORDER BY ProductName DESC;



--ORDERING SEVERAL COLUMNS
SELECT * FROM Customers ORDER BY Country, CustomerName;


--Using Both ASC and DESC
SELECT * FROM Customers ORDER BY Country ASC, CustomerName DESC;



--Select all customers from Spain that starts with the letter 'G':
SELECT * FROM Customers WHERE Country = 'Spain' AND CustomerName LIKE 'G%';



--selects all fields from Customers where Country is "Germany" AND City is "Berlin" AND PostalCode is higher than 12000:
SELECT * FROM Customers WHERE Country = 'Germany' AND City = 'Berlin' AND PostalCode > 12000;



--Select all Spanish customers that starts with either "G" or "R":
SELECT * FROM Customers WHERE Country = 'Spain' AND (CustomerName LIKE 'G%' OR CustomerName LIKE 'R%');



--Select all customers that either: are from Spain and starts with either "G", or starts with the letter "R":
SELECT * FROM Customers WHERE Country = 'Spain' AND CustomerName LIKE 'G%' OR CustomerName LIKE 'R%';



--Select all customers from Germany or Spain:
SELECT * FROM Customers WHERE Country = 'Germany' OR Country = 'Spain';



--The following SQL statement selects all fields from Customers where either City is "Berlin", CustomerName starts with the letter "G" or Country is "Norway":
SELECT * FROM Customers WHERE City = 'Berlin' OR CustomerName LIKE 'G%' OR Country = 'Norway';


--The following SQL statement selects all customers from Spain that starts with a "G" or an "R".
SELECT * FROM Customers WHERE Country = 'Spain' AND (CustomerName LIKE 'G%' OR CustomerName LIKE 'R%');


--Without parenthesis, the select statement will return all customers from Spain that starts with a "G", plus all customers that starts with an "R", regardless of the country value:
SELECT * FROM Customers WHERE Country = 'Spain' AND CustomerName LIKE 'G%' OR CustomerName LIKE 'R%';


--Select only the customers that are NOT from Spain:
SELECT * FROM Customers WHERE NOT Country = 'Spain';



--Select customers that does not start with the letter 'A':
SELECT * FROM Customers WHERE CustomerName NOT LIKE 'A%';



--Select customers with a customerID not between 10 and 60:
SELECT * FROM Customers WHERE CustomerID NOT BETWEEN 10 AND 60;



--Select customers that are not from Paris or London:
SELECT * FROM Customers WHERE City NOT IN ('Paris', 'London');



--Select customers with a CustomerId not greater than 50:
SELECT * FROM Customers WHERE NOT CustomerID > 50;
--Note: There is a not-greater-than operator: !> that would give you the same result.



--Select customers with a CustomerID not less than 50:
SELECT * FROM Customers WHERE NOT CustomerId < 50;
--Note: There is a not-less-than operator: !< that would give you the same result.



--INSERT INTO 
INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES ('Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway');


--Insert Data Only in Specified Columns
INSERT INTO Customers (CustomerName, City, Country) VALUES ('Cardinal', 'Stavanger', 'Norway');



--Insert Multiple Rows
INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES
('Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway'),
('Greasy Burger', 'Per Olsen', 'Gateveien 15', 'Sandnes', '4306', 'Norway'),
('Tasty Tee', 'Finn Egan', 'Streetroad 19B', 'Liverpool', 'L1 0AA', 'UK');




--The IS NULL operator is used to test for empty values (NULL values).
SELECT CustomerName, ContactName, Address FROM Customers WHERE Address IS NULL;



--The IS NOT NULL operator is used to test for non-empty values (NOT NULL values).
SELECT CustomerName, ContactName, Address FROM Customers WHERE Address IS NOT NULL;


--The following SQL statement updates the first customer (CustomerID = 1) with a new contact person and a new city.
UPDATE Customers SET ContactName = 'Alfred Schmidt', City= 'Frankfurt' WHERE CustomerID = 1;


--The following SQL statement will update the ContactName to "Juan" for all records where country is "Mexico":
UPDATE Customers SET ContactName='Juan' WHERE Country='Mexico';


--Be careful when updating records. If you omit the WHERE clause, ALL records will be updated!
UPDATE Customers SET ContactName='Juan';


--The following SQL statement deletes the customer "Alfreds Futterkiste" from the "Customers" table:
DELETE FROM Customers WHERE CustomerName='Alfreds Futterkiste';


--The following SQL statement deletes all rows in the "Customers" table, without deleting the table:
delete from customers


--To delete the table completely, use the DROP TABLE statement:
drop table customers


--Select only the first 3 records of the Customers table:
select top 3 from customers


--The following SQL statement shows the equivalent example for MySQL:
SELECT * FROM Customers LIMIT 3;


--fetch first
select * from Customers fetch first 3 rows only


--select top percent of 
select top 50 percent * from Customers



--in oracle
fetch first 50 percent rows only



-- top + where
select top 3 * from Customers where Country = 'Germany'



-- top + where in mysql
select * from Customers where Country = 'Germany' limit 3;




-- top + where in oracle
select * from Customers where Country = 'Germany' fetch first 3 rows only




--top + order by
select top 3 * from Customers order by CustomerName desc


--top + order by in mysql
select * from Customers order by CustomerName desc limit 3



--top + order by in oracle
select * from Customers order by CustomerName desc fetch first 3 rows only




--agg func min
select MIN(Price) from Products




--agg func max
select MAX(price) from Products




--alias
select MIN(Price) as Smallest from Products



--use min with group by
select min(Price) as smallest, CategoryId from Products
group by CategoryId



---COUNT
SELECT COUNT(*) FROM Products



--Find the number of products where the ProductName is not null:
select count(ProductName) from products


--Find the number of products where Price is higher than 20:
select count(ProductID) from Products where Price > 20



--How many different prices are there in the Products table:
select count(distinct Price) from Products


--Name the column "Number of records":
SELECT COUNT(*) AS [Number of records] FROM Products;











