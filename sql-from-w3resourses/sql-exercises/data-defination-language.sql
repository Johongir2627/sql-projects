use W3Resource
go
-- 1. Create a Table. Write a SQL query to create a table with specific columns and constraints.
create table _NewTable (id int identity(1,1), name varchar(max) not null, age int, city text default 'Tashkent')
select * from _NewTable

--2. Add a New Column . Write a SQL query to add a new column to an existing table.   /// add
alter table _NewTable add surname varchar(max) not null
select * from _NewTable

--3. Modify a Column's Data Type. Write a SQL query to change the data type of an existing column in a table. /// alter
alter table _NewTable alter column surname text
select * from _NewTable

--4. Drop a Column. Write a SQL query to remove a column from an existing table.  ///drop
alter table _NewTable drop column surname
select * from _NewTable

--5. Add a Unique Constraint. Write a SQL query to add a unique constraint to a column in an existing table.
alter table _Newtable add constraint UC_Name UNIQUE (id)

--6. Add a Foreign Key. Write a SQL query to create a foreign key relationship between two tables.
create table _Docs (id int primary key, name varchar(max))
create table _Sheets (id int, docs_id int foreign key references _Docs(id))

--7. Drop a Table. Write a SQL query to permanently delete a table and all its data.
create table _for_dropping (id int)
drop table _for_dropping

--8. Truncate a Table. Write a SQL query to remove all rows from a table while retaining its structure.
create table _for_truncating (id int)
truncate table _for_truncating

--9. Create an Index. Write a SQL query to create an index on a column to improve query performance.
create index idn_Name on _NewTable(id)

--10. Drop an Index. Write a SQL query to remove an index from a table.
drop index idn_Name on _NewTable

--11. Rename a Table. Write a SQL query to rename an existing table.
EXEC sp_rename '_NewTable', '_NewTables';

--12. Add a Default Value. Write a SQL query to assign a default value to a column in an existing table.
alter table _Newtables add  Country varchar(max)
select * from _NewTables
ALTER TABLE _NewTables ADD CONSTRAINT DF_NewTables_Country DEFAULT 'Uzbekistan' FOR Country;

--13. Remove a Constraint. Write a SQL query to remove a constraint from an existing table.
alter table _Newtables drop constraint DF_NewTables_Country

--14. Create a Schema. Write a SQL query to create a new schema in the database.
create schema new_tables

--15. Move a Table to a Schema. Write a SQL query to move a table from one schema to another.
alter schema new_tables transfer _NewTables



