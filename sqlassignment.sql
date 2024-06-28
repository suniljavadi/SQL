-- Studies Table
CREATE TABLE Studies (PNAME varchar(20), INSTITUTE varchar(20), COURSE varchar(20), COURSE_FEE int )
-- Insertion
INSERT INTO Studies
SELECT 'ANAND','SABHARI','PGDCA',4500 UNION ALL
SELECT 'ALTAF','COIT','DCA',7200 UNION ALL
SELECT 'JULIANA','BDPS','MCA',22000 UNION ALL
SELECT 'KAMALA','PRAGATHI','DCA',5000 UNION ALL
SELECT 'MARY','SABHARI','PGDCA ',4500 UNION ALL
SELECT 'NELSON','PRAGATHI','DAP',6200 UNION ALL
SELECT 'PATRICK','PRAGATHI','DCAP',5200 UNION ALL
SELECT 'QADIR','APPLE','HDCA',14000 UNION ALL
SELECT 'RAMESH','SABHARI','PGDCA',4500 UNION ALL
SELECT 'REBECCA','BRILLIANT','DCAP',11000 UNION ALL
SELECT 'REMITHA','BDPS','DCS',6000 UNION ALL
SELECT 'REVATHI','SABHARI','DAP',5000 UNION ALL
SELECT 'VIJAYA','BDPS','DCA',48000
-- View
select * from Studies

-- Software Table
CREATE TABLE Software (PNAME varchar(20), TITLE varchar(20), DEVELOPIN varchar(20), SCOST decimal(10,2),  DCOST int, SOLD int)

-- Insertion
INSERT INTO Software (PNAME, TITLE, DEVELOPIN, SCOST, DCOST, SOLD) Values
 ('MARY','README','CPP',300, 1200, 84),
 ('ANAND','PARACHUTES','BASIC',399.95, 6000, 43),
 ('ANAND','VIDEO TITLING','PASCAL',7500, 16000, 9),
 ('JULIANA','INVENTORY','COBOL',3000, 3500, 0),
 ('KAMALA','PAYROLL PKG.','DBASE',9000, 20000, 7),
 ( 'MARY','FINANCIAL ACCT.','ORACLE',18000, 85000, 4),
 ('MARY','CODE GENERATOR','C',4500, 20000, 23 ),
 ('PATTRICK','README','CPP',300, 1200, 84),
 ('QADIR','BOMBS AWAY','ASSEMBLY',750, 3000, 11),
 ('QADIR','VACCINES','C',1900, 3100, 21 ),
 ('RAMESH','HOTEL MGMT.','DBASE',13000, 35000, 4 ),
 ('RAMESH','DEAD LEE','PASCAL',599.95, 4500, 73 ),
 ('REMITHA','PC UTILITIES','C',725, 5000, 51),
 ('REMITHA','TSR HELP PKG.','ASSEMBLY',2500, 6000, 7 ),
 ('REVATHI','HOSPITAL MGMT.','PASCAL',1100, 75000, 2 ),
 ('VIJAYA','TSR EDITOR','C',900, 700, 6);

 -- View
 select * from Software

 -- Programmer Table
 CREATE TABLE Programmer (PNAME varchar(20), DOB date, DOJ date, GENDER varchar(2), PROF1 varchar(20), PROF2 varchar(20), SALARY int)
 -- Insert
INSERT INTO Programmer
SELECT 'ANAND','12-Apr-66','21-Apr-92','M','PASCAL','BASIC',3200 UNION ALL
SELECT 'ALTAF','02-Jul-64','13-Nov-90','M','CLIPPER','COBOL',2800 UNION ALL
SELECT 'JULIANA','31-Jan-60','21-Apr-90','F','COBOL','DBASE',3000 UNION ALL
SELECT 'KAMALA','30-Oct-68','02-Jan-92','F','C','DBASE',2900 UNION ALL
SELECT 'MARY','24-Jun-70','01-Feb-91','F','CPP','ORACLE',4500 UNION ALL
SELECT 'NELSON','11-Sep-85','11-Oct-89','M','COBOL','DBASE',2500 UNION ALL
SELECT 'PATTRICK','10-Nov-65','21-Apr-90','M','PASCAL','CLIPPER',2800 UNION ALL
SELECT 'QADIR','31-Aug-65','21-Apr-91','M','ASSEMBLY','C',3000 UNION ALL
SELECT 'RAMESH','03-May-67','28-Feb-91','M','PASCAL','DBASE',3200 UNION ALL
SELECT 'REBECCA','01-Jan-67','01-Dec-90','F','BASIC','COBOL',2500 UNION ALL
SELECT 'REMITHA','19-Apr-70','20-Apr-93','F','C','ASSEMBLY',3600 UNION ALL
SELECT 'REVATHI','02-Dec-69','02-Jan-92','F','PASCAL','BASIC',3700 UNION ALL
SELECT 'VIJAYA','14-Dec-65','02-May-92','F','FOXPRO','C',3500
-- View
select * from Programmer
-----------------------------------------------------Retrive 3 tables----------------------------------
select * from studies
select * from software
select * from Programmer
------------------------------------------QUERIES-------------------------------------------------------------------------------------------------

--1. Find out the selling cost AVG for packages developed in Pascal. 
select AVG(SCOST) as average_selling_cost from software where DEVELOPIN='Pascal'
--2. Display Names, Ages of all Programmers. 
select  pname,dob,DATEDIFF(year,dob,getdate()) as years from programmer
--3. Display the Names of those who have done the DAP Course.
select pname,course from Studies where course='DAP'
--4. Display the Names and Date of Births of all Programmers Born in January. 
select pname,dob,datename(month,dob) as month_of_born from programmer where datepart(month,dob)=1
--5. What is the Highest Number of copies sold by a Package? 
select * from software where sold=(select max(sold) from software)
--6. Display lowest course Fee. 
select * from studies where course_fee=(select min(COURSE_FEE) from studies)
--7. How many programmers done the PGDCA Course? 
select course,count(*) as NO_of_programmers from Studies group by course having course='pgdca'
--8. How much revenue has been earned thru sales of Packages Developed in C.
select sum(scost*sold) as scost from Software where DEVELOPIN='c'
--9. Display the Details of the Software Developed by Ramesh. 
select * from Software where pname='ramesh'
--10. How many Programmers Studied at Sabhari?
select count(*) as NO_of_programmers from Studies where INSTITUTE='sabhari'
--11. Display details of Packages whose sales crossed the 2000 Mark. 
select * from Software where scost>2000
--12. Display the Details of Packages for which Development Cost have been recovered. 
select * from Software where scost>=dcost and sold>1
--13. What is the cost of the costliest software development in Basic? 
select * from Software where scost =(select max(scost) from Software)
--14. How many Packages Developed in DBASE? 
select count(*) as no_of_packages from Software where DEVELOPIN='Dbase'
--15. How many programmers studied in Pragathi? 
select count(*) as no_of_programmers from Studies where INSTITUTE='PRAGATHI'
--16. How many Programmers Paid 5000 to 10000 for their course?
select * from Studies where COURSE_FEE between 5000 and 10000 
--17. What is AVG Course Fee 
select avg(COURSE_FEE) as avg_course_fee from Studies
--18. Display the details of the Programmers Knowing C.
select * from Programmer where prof1='c' or prof2='c'
--19. How many Programmers know either COBOL or PASCAL. 
select * from Programmer where prof1 in('COBOL','Pascal') or prof2 in('COBOL','Pascal')
--20. How many Programmers Don’t know PASCAL and C 
select * from Programmer where prof1 not in('COBOL','Pascal') and prof2 not in('COBOL','Pascal')
--21. How old is the Oldest Male Programmer. 
select max(datediff(year,dob,getdate())) as oldest_programmer from Programmer 
--22. What is the AVG age of Female Programmers? 
select  avg(datediff(year,dob,getdate())) as average_age_of_female from Programmer where gender='f'
--23. Calculate the Experience in Years for each Programmer and Display with their names in Descending order. 
select pname,datediff(year,doj,getdate()) as oldest_programmer from Programmer order by pname desc
--24. Who are the Programmers who celebrate their Birthday’s During the CurrentMonth? 
select * from Programmer where datepart(month,doj)=datepart(month,getdate())
--25. How many Female Programmers are there? 
select count(*) as no_of_female from Programmer where gender='f'
--26. What are the Languages studied by Male Programmers. 
select prof1,PROF2 from Programmer where gender='m'
--27. What is the AVG Salary? 
select avg(salary) as average_salary from programmer
--28. How many people draw salary 2000 to 4000? 
select count(*) as no_of_people from Programmer where salary between 2000 and 4000
--29. Display the details of those who don’t know Clipper, COBOL or PASCAL. 
select * from Programmer where prof1 not in('clipper','cobol','pascal') and prof2 not  in('clipper','cobol','pascal')
--30. Display the Cost of Package Developed By each Programmer. 
select pname,DEVELOPIN,DCOST as cost_of_package from Software
--31. Display the sales values of the Packages Developed by the each Programmer. 
select pname,DEVELOPIN,scost as cost_of_package from Software
--32. Display the Number of Packages sold by Each Programmer. 
select pname,DEVELOPIN,sold as cost_of_package from Software
--33. Display the sales cost of the packages Developed by each Programmer Language wise. 
select DEVELOPIN,sum(scost) as cost_of_package from Software group by DEVELOPIN
--34. Display each language name with AVG Development Cost, AVG Selling Cost andAVG Price per Copy. 
select DEVELOPIN,avg(dcost) as avearage_dev_cost,avg(scost) as average_sell_cost,avg(scost) as average_price from Software group by DEVELOPIN
--35. Display each programmer’s name, costliest and cheapest Packages Developed by him or her. 
select pname,max(scost) max_cost,min(scost) as min_cost from Software group by pname
--36. Display each institute name with number of Courses, Average Cost per Course. 
select INSTITUTE,avg(COURSE_FEE) as avg_course_fee from Studies group by INSTITUTE
--37. Display each institute Name with Number of Students. 
select INSTITUTE,count(*) as no_of_students from Studies group by INSTITUTE
--38. Display Names of Male and Female Programmers. Gender also. 
select pname,gender from Programmer
--39. Display the Name of Programmers and Their Packages. 
select pname,developin from Software
--40. Display the Number of Packages in Each Language Except C and C++. 
select count(*) as no_of_packages from Software where DEVELOPIN not in ('c','cpp')
--41. Display the Number of Packages in Each Language for which Development Cost isless than 1000.
select * from Software where dcost<1000
--42. Display AVG Difference between SCOST, DCOST for Each Package. 
select DEVELOPIN,avg(dcost-scost) from Software group by DEVELOPIN
--43. Display the total SCOST, DCOST and amount to Be Recovered for each Programmer for Those Whose Cost has not yet been Recovered. 
select pname,scost as sell_cost,dcost as dev_cost,(dcost-scost) as amount_to_recover from Software
--44. Display Highest, Lowest and Average Salaries for those earning more than 2000. 
select pname,max(SALARY) as max_salary,min(salary) as min_salary,avg(SALARY) as avg_salary from Programmer where salary>2000 group by pname
--45. Who is the Highest Paid C Programmers?
select * from programmer where salary=
(select max(salary)  from Programmer where PROF1='c' or prof2='c' )
--46. Who is the Highest Paid Female COBOL Programmer? 
select top 1 * from programmer where salary=
(select max(salary)  from Programmer where gender='f' and (PROF1='cobol' or prof2='cobol'))
--47. Display the names of the highest paid programmers for each Language. 
select prof1,max(salary) from Programmer group by PROF1
--48. Who is the least experienced Programmer. 
select pname,dob,doj,datediff(year,doj,getdate()) as experience from programmer where datediff(year,doj,getdate())=(select min(datediff(year,doj,getdate())) from Programmer)
--49. Who is the most experienced male programmer knowing PASCAL. 
select pname,dob,doj,datediff(year,doj,getdate()),prof1,prof2 as experience from programmer where datediff(year,doj,getdate())=
(select max(datediff(year,doj,getdate())) from Programmer group by prof1 having prof1='pascal')
and prof1='pascal'
--50. Which Language is known by only one Programmer? 
select prof1,count(*) from Programmer group by prof1 having count(*)=1
--51. Who is the Above Programmer Referred in 50? 
select * from Programmer where datediff(year,dob,getdate())>50
--52. Who is the Youngest Programmer knowing DBASE? 
--53. Which Female Programmer earning more than 3000 does not know C, C++, ORACLE or DBASE? 
--54. Which Institute has most number of Students? 
--55. What is the Costliest course? 
--56. Which course has been done by the most of the Students? 
--57. Which Institute conducts costliest course. 
--58. Display the name of the Institute and Course, which has below AVG course fee. 
--59. Display the names of the courses whose fees are within 1000 (+ or -) of the Average Fee, 
--60. Which package has the Highest Development cost? 
--61. Which course has below AVG number of Students? 
--62. Which Package has the lowest selling cost? 
--63. Who Developed the Package that has sold the least number of copies? 
--64. Which language has used to develop the package, which has the highest sales amount? 
--65. How many copies of package that has the least difference between development and selling cost where sold. 
--66. Which is the costliest package developed in PASCAL. 
--67. Which language was used to develop the most number of Packages. 
--68. Which programmer has developed the highest number of Packages? 
--69. Who is the Author of the Costliest Package? 
--70. Display the names of the packages, which have sold less than the AVG number of copies. 
--71. Who are the authors of the Packages, which have recovered more than double the Development cost? 
--72. Display the programmer Name and the cheapest packages developed by them ineach language. 
--73. Display the language used by each programmer to develop the Highest Selling and Lowest-selling package. 
--74. Who is the youngest male Programmer born in 1965? 
--75. Who is the oldest Female Programmer who joined in 1992?
--76. In which year was the most number of Programmers born. 
--77. In which month did most number of programmers join? 
--78. In which language are most of the programmer’s proficient. 
--79. Who are the male programmers earning below the AVG salary ofFemale Programmers? 
--80. Who are the Female Programmers earning more than the Highest Paid? 
--81. Which language has been stated as the proficiency by most of the Programmers? 
--82. Display the details of those who are drawing the same salary. 
--83. Display the details of the Software Developed by the Male Programmers Earning More than 3000/-. 
--84. Display the details of the packages developed in Pascal by the Female Programmers. 
--85. Display the details of the Programmers who joined before 1990. 
--86. Display the details of the Software Developed in C By female programmers ofPragathi. 
--87. Display the number of packages, No. of Copies Sold and sales value ofeach programmer institute wise. 
--88. Display the details of the software developed in DBASE by Male Programmers, who 
--belong to the institute in which most number of Programmers studied. 
--89. Display the details of the software Developed by the male programmers Born before 1965 and female programmers born after 1975. 
--90. Display the details of the software that has developed in the language which isneither the first nor the second proficiency of the programmers. 
--91. Display the details of the software developed by the male students of Sabhari. 
--92. Display the names of the programmers who have not developed any packages. 
--93. What is the total cost of the Software developed by the programmers of Apple? 
--94. Who are the programmers who joined on the same day? 
--95. Who are the programmers who have the same Prof2? 
--96. Display the total sales value of the software, institute wise. 
--97. In which institute does the person who developed the costliest package studied. 
--98. Which language listed in prof1, prof2 has not been used to develop any package. 
--99. How much does the person who developed the highest selling package earn andwhat course did HE/SHE undergo. 
--100. What is the AVG salary for those whose software sales is more than 50,000/-. 
--101. How many packages were developed by students, who studied in institute that charge the lowest course fee? 
--102. How many packages were developed by the person who developed the cheapest package, where did HE/SHE study? 
--103. How many packages were developed by the female programmers earning more than the highest paid male programmer? 
--104. How many packages are developed by the most experienced programmer form BDPS. 
--105. List the programmers (form the software table) and the institutes they studied. 
--106. List each PROF with the number of Programmers having that PROF and the number of the packages in that PROF. 
--107. List the programmer names (from the programmer table) and No. Of Packages each has developed.