--1. Arrange the ‘Orders’ dataset in decreasing order of amount
select * from orders order by order_id desc
--2. Create a table with name ‘Employee_details1’ and comprising of these columns – ‘Emp_id’, 
--‘Emp_name’, ‘Emp_salary’. Create another table with name ‘Employee_details2’, which 
--comprises of same columns as first table.

create table employee_details1 (Emp_id int primary key,emp_name varchar(100),emp_salary money)

create table employee_details2 (Emp_id int primary key,emp_name varchar(100),emp_salary money)
--3. Apply the union operator on these two tables
select * from employee_details1

union

select * from  employee_details2
--4. Apply the intersect operator on these two tables
select * from employee_details1

intersect

select * from  employee_details2
--5. Apply the except operator on these two tables
select * from employee_details1

except

select * from  employee_details2
