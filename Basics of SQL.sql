

--installed MS sql Server
select @@version
--Microsoft SQL Server 2019 (RTM-CU18-GDR) (KB5021124) - 15.0.4280.7 (X64)   Jan 23 2023 12:37:13   Copyright (C) 2019 Microsoft Corporation  Developer Edition (64-bit) on Windows 10 Enterprise 10.0 <X64> (Build 22621: ) (Hypervisor) 
--create database
create database practice
--use database
use practice
--creating tables
create table employee_table (Employee_id int primary key,first_name varchar(100) not null,last_name varchar(100) not null,salary money, joining date,department varchar(100))
create table employee_bonus(employee_id int foreign key references employee_table,bounus_amount money,bonus_date date)
create table employee_title(employee_id int foreign key references employee_table,title varchar(100),effective_date date)

--insering data
insert into employee_table values(1,'Anika','Arora',100000,'2022-02-14','HR')
insert into employee_table values(2,'veena','verma',80000,'2011-06-15','Admin')
insert into employee_table values(3,'vishal','singhal',300000,'2022-02-14','HR')
insert into employee_table values(4,'sushanth','singh',500000,'2022-02-14','Admin')
insert into employee_table values(5,'bhupal','bhati',500000,'2022-02-14','Admin')
insert into employee_table values(6,'dheeraj','diwan',200000,'2022-02-14','Account')
insert into employee_table values(7,'karan','kumar',75000,'2022-02-14','Account')
insert into employee_table values(8,'chandrika','chauhan',90000,'2022-02-14','HR')

insert into employee_bonus values(1,5000,'2022-02-16')
insert into employee_bonus values(2,3000,'2011-06-16')
insert into employee_bonus values(3,4000,'2020-02-16')
insert into employee_bonus values(1,4500,'2020-02-16')
insert into employee_bonus values(2,3500,'2011-06-16')


insert into employee_title values(1,'Manager','2016-02-20')
insert into employee_title values(2,'Executve','2016-06-11')
insert into employee_title values(8,'Executve','2016-06-11')
insert into employee_title values(5,'Manager','2016-06-11')
insert into employee_title values(4,'Assi.Manager','2016-06-11')
insert into employee_title values(7,'Executve','2016-06-11')
insert into employee_title values(6,'Lead','2016-06-11')
insert into employee_title values(3,'Lead','2016-06-11')

--retrive data

select * from employee_table
select * from employee_bonus
select * from employee_title
