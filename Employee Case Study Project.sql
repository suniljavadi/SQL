create table employee_table (Employee_id int primary key,first_name varchar(100) not null,last_name varchar(100) not null,salary money, joining date,department varchar(100))
create table employee_bonus(employee_id int foreign key references employee_table,bounus_amount money,bonus_date date)
create table employee_title(employee_id int foreign key references employee_table,title varchar(100),effective_date date)


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

--1 Display the “FIRST_NAME” from Employee table using the alias name 
--as Employee_name.
select first_name As Employee_name from employee_table
--2 Display “LAST_NAME” from Employee table in upper case.
select upper(last_name) As Employee_name from employee_table
--3 Display unique values of DEPARTMENT from EMPLOYEE table.
select distinct department from employee_table
--4 Display the first three characters of LAST_NAME from EMPLOYEE table.
select last_name,substring(last_name,1,3) as first_three_char from employee_table
--5 Display the unique values of DEPARTMENT from EMPLOYEE table and 
--prints its length.
select distinct department,len(department) from employee_table
--6 Display the FIRST_NAME and LAST_NAME from EMPLOYEE table into a 
--single column AS FULL_NAME. 
-- a space char should separate them.
select first_name+' '+last_name as fullname from employee_table
--7 DISPLAY all EMPLOYEE details from the employee table 
--order by FIRST_NAME Ascending.
select * from employee_table order by first_name asc
--8. Display all EMPLOYEE details order by FIRST_NAME Ascending and 
--DEPARTMENT Descending.
select * from employee_table order by first_name asc,department desc
--9 Display details for EMPLOYEE with the first name as “VEENA” and 
--“KARAN” from EMPLOYEE table.
select * from employee_table where first_name='Veena' or first_name='karan'
--10 Display details of EMPLOYEE with DEPARTMENT name as “Admin”.
select * from employee_table where department='Admin'
--11 DISPLAY details of the EMPLOYEES whose FIRST_NAME contains ‘V’.
select * from employee_table where first_name like '%v%'
--12 DISPLAY details of the EMPLOYEES whose SALARY lies between 
--100000 and 500000.
select * from employee_table where salary between 100000 and 500000
--13 Display details of the employees who have joined in Feb-2020.
select * from employee_table where month(joining)=2 and year(joining)=2020
--14 Display employee names with salaries >= 50000 and <= 100000.
select * from employee_table where salary>=50000 and salary<= 100000
--16 DISPLAY details of the EMPLOYEES who are also Managers.
select * from  employee_table Emp join employee_title ET on Emp.Employee_id=et.employee_id where title='Manager'
--17 DISPLAY duplicate records having matching data in some fields of a table.
select department,count(*) from employee_table group by department having count(*)>1
--18 Display only odd rows from a table.
select * from employee_table where employee_id in(select Employee_id from employee_table where Employee_id%2=1)
--19 Clone a new table from EMPLOYEE table.
select * into Employee_clone from employee_table
--select * from Employee_clone
--20 DISPLAY the TOP 2 highest salary from a table.
select top 2 * from employee_table order by salary desc

--21. DISPLAY the list of employees with the same salary.
select * from employee_table where salary in(select salary from employee_table group by salary having count(salary)>1)
--22 Display the second highest salary from a table.
select top 1 * from employee_table where salary in (select top 2 salary from employee_table order by salary desc)
--23 Display the first 50% records from a table.
select top 50 percent * from Employee_table;
--24. Display the departments that have less than 4 people in it.

select * from employee_table where department in 
(select department from employee_table group by department  having count(*)<4)
--25. Display all departments along with the number of people in there.
select department,count(*) as number_of_people from employee_table group by department 
--26 Display the name of employees having the highest salary in each 
--department.

select department,max(salary) from employee_table group by department
--27 Display the names of employees who earn the highest salary.
select * from employee_table where salary in(select top 1 salary from employee_table order by salary desc )
--28 Diplay the average salaries for each department

select department,avg(salary) from employee_table group by department
--29 display the name of the employee who has got maximum bonus
select top 1 * from employee_bonus where bounus_amount in(select top 1 bounus_amount from employee_bonus order by bounus_amount desc)
--30 Display the first name and title of all the employee
select first_name,title from employee_table emp join employee_title et on emp.Employee_id=et.employee_id
