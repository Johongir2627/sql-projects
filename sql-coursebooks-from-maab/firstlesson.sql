
--command types

--DDL		Data Definition Language
create database homeworks_from_maab
use homeworks_from_maab
--create
create table Newtable (id int)
--alter
alter table Newtable add name varchar(50)
--insert 
insert into Newtable values (1, 'First')
insert into Newtable values (2, 'Second')
--truncate  deletes values in the table
truncate table Newtable
--drop   deletes the table
drop table Newtable
--sp_help
exec sp_help 'Newtable'	--give information, stored procedures, about table



--DML		Data Manupulation Language
insert into Newtable(id) values (3)  /*If you enter less values than the number of columns, then specify it.*/
--!!!!!!		NULL <> ''
insert into Newtable(name) values ('Jack')	--works
insert into Newtable(name) values (5)		--works
insert into Newtable(id) values ('6')		--works
insert into Newtable(id) values ('six')   --don't work
--update
update Newtable set name = 'John' where name is null   --works
update Newtable set name = 'John' where name = null    --doesn't work
update Newtable set id = 4 where name = 'Jack'
--iif
select iif(null is null, 1, 0)
select iif(null = null, 1, 0)
select iif(5=5, 1,0)
--delete
--truncate table Newtable
--drop table Newtable
delete from Newtable where id = 6


--DQL Data Query Language
select getdate()
select * from Newtable
select * from INFORMATION_SCHEMA.TABLES   --return all tables in this database
select * from sys.databases   --return all database in the system
select name from sys.databases    --return all "name" columns in the databases of the system


--TCL  Transaction Control Language
select * from Newtable
begin transaction
delete from Newtable where id = 1
rollback   --rollback and commit are used with DML, dont work with DDL
commit


--DCL Data Control Language
create login FirstLogin with password = '123Password'
create user User1 for login FirstLogin 







select * from Newtable




