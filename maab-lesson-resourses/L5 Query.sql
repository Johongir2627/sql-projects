--create database ForLesson4
--go
--use ForLesson4
--go

create table PKTest(Number1 int primary key, Number2 int)

create table PKTest2(Number1 int primary key, Number2 int primary key)

create table PKTest3(Number1 int, Number2 int, primary key(Number1, Number2))

insert into PKTest values (1, 1)
insert into PKTest values (2, 2)
insert into PKTest values (3, 1)
insert into PKTest values (1, 2)

select * from PKTest

insert into PKTest3 values (1, 4)
insert into PKTest3 values (2, 2)
insert into PKTest3 values (3, 1)
insert into PKTest3 values (1, 2)

select * from PKTest

select * from PKTest3

create table iam_policies(db_id int primary key,
id varchar(50),
name varchar(50), 
type varchar(50))

create table iam_policy_members
(member_id int,
policy_id int foreign key references iam_policies(db_id))

create table iam_members (db_id int primary key,
name varchar(50))

alter table iam_policy_members
add constraint FK_IamMembers foreign key(member_id) references iam_members(db_id)

exec sp_help 'iam_policy_members'

alter table iam_policy_members
add constraint PK_Anything primary key(member_id, policy_id)

alter table iam_policy_members
alter column member_id int not null

alter table iam_policy_members
alter column policy_id int not null

create table iam_roles(db_id int primary key,
id varchar(50), 
name varchar(50),
type varchar(50),
actions text)

create table iam_statements(db_id int primary key,
effect varchar(50),
actions text, 
resources text, 
policy_id int foreign key references iam_policies(db_id),
role_id int foreign key references iam_roles(db_id))

create table iam_projects(
db_id int primary key,
id nvarchar(50),
name varchar(50),
type text)

create table iam_role_projects(
role_id int foreign key references iam_roles(db_id),
project_id int foreign key references iam_projects(db_id),
primary key(role_id, project_id))

create table iam_project_rules(
db_id int primary key,
id text, 
name text, 
type text, 
project_id int foreign key references iam_projects(db_id))

create table staged_project_rules(
db_id int primary key,
id text,
name text,
type text,
deleted bit,
project_id int foreign key references iam_projects(db_id))

create table iam_staged_rule_conditions(
db_id int primary key,
rule_db_id int foreign key references iam_staged_rule_conditions(db_id),
value text,
attribute text,
operator text)

exec sp_help 'iam_staged_rule_conditions'

alter table iam_staged_rule_conditions
drop constraint FK__iam_stage__rule___412EB0B6

alter table iam_staged_rule_conditions
add constraint FK_RuleConditions foreign key(rule_db_id) references staged_project_rules(db_id)


create table iam_rule_conditions
(db_id int primary key,
value text,
attribute varchar(100),
operator varchar(100),
rule_db_id int foreign key references iam_project_rules(db_id))

create table iam_statement_projects(
project_id int foreign key references iam_projects(db_id),
statement_id int foreign key references iam_statements(db_id),
primary key (project_id, statement_id))


create table iam_policy_projects(
policy_id int foreign key references iam_policies(db_id),
project_id int foreign key references iam_projects(db_id),
primary key (policy_id, project_id))

create table iam_projects_graveyard(
db_id int primary key,
id varchar(50))


create table Personaddress(
fullname varchar(50),
address varchar(50) default 'Tashkent')

insert into Personaddress values ('Son Heung', 'Taegu')
insert into Personaddress values ('Luiz Felipe', 'Brazilia')
insert into Personaddress values ('Lucas Paqueta', '')

select * from Personaddress


--trigger
create trigger ForPersonAddress on personAddress
after insert
as
begin
update Personaddress
set address = 'Tashkent'
where address is null or address = ''
end

insert into Personaddress values ('Justin Cluivert', null)
insert into Personaddress values ('Max Holloway', '   ')

select * from Personaddress

use W3Resource
go

select * from sys.tables

select * from employee.employees
order by salary desc

select * from employee.employees
order by dep_id, job_name desc, hire_date

--Distinct
select distinct dep_id, job_name  from employee.employees

--Top 
select top 3 * from employee.employees
order by salary desc

--Top with ties
select top 2 with ties * from employee.employees
order by salary desc

select top 10 percent * from employee.employees
order by salary desc

select top 1 with ties * from employee.employees
order by commission

--Offset and Fetch
select * from employee.employees
order by hire_date

select * from employee.employees
order by hire_date
offset 2 rows fetch next 4 rows only

--isnull
select isnull(cast(commission as varchar(50)), 'ABc'), * from employee.employees

--coalesce
select *, coalesce(commission, manager_id, 1111111) from employee.employees


--Where
select * from nobel_win
where year = 1970

select * from nobel_win
where year = 1970 or year = 1978

select * from nobel_win
where year between 1970 and 1978

select * from nobel_win
where year >= 1970 and year <=1978

select * from nobel_win
where country = 'Germany'

select * from nobel_win
where country = 'Germany' and category = 'Scientist' and year between 1970 and 1971

select * from nobel_win
where country = 'Germany' or country = 'Sweden' or country = 'Russia'

select * from nobel_win
where country in ('Germany', 'Sweden', 'Russia')

select * from nobel_win
where (year > 1971 or country = 'USA') and category = 'Economist'

--Wildcards
select * from nobel_win
where trim(winner) like '%n'

select * from nobel_win
where trim(winner) like '%l'

select * from nobel_win
where winner = 'Hannes Alfven'

--Hannes Alfven     

select * from nobel_win
where winner like '_u__%'

select * from nobel_win
where winner like '[A-E]%'

select * from nobel_win
where winner like '[ADHM]%'

select * from nobel_win
where winner like '%zh%'

select * from sys.tables

select * from soccer.player_mast
where age >= 30

select * from soccer.player_mast
where posi_to_play = 'DF'

select * from soccer.player_mast
where age < 30 or posi_to_play = 'FD'

select * from soccer.player_mast
where player_name like '%r%' and jersey_no < 10

