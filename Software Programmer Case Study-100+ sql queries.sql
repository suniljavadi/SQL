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
SELECT AVG(SCOST) AS AverageSellingCost
FROM Software
WHERE DEVELOPIN = 'PASCAL';
--2. Display Names, Ages of all Programmers. 
SELECT PNAME, DATEDIFF(YEAR, DOB, GETDATE()) AS Age
FROM Programmer;
--3. Display the Names of those who have done the DAP Course.
SELECT PNAME
FROM Studies
WHERE COURSE = 'DAP';
--4. Display the Names and Date of Births of all Programmers Born in January. 
SELECT PNAME, DOB
FROM Programmer
WHERE MONTH(DOB) = 1;
--5. What is the Highest Number of copies sold by a Package? 
SELECT MAX(SOLD) AS HighestCopiesSold
FROM Software;
--6. Display lowest course Fee. 
SELECT MIN(COURSE_FEE) AS LowestCourseFee
FROM Studies;
--7. How many programmers done the PGDCA Course? 
SELECT COUNT(*) AS TotalProgrammers
FROM Studies
WHERE COURSE = 'PGDCA';
--8. How much revenue has been earned thru sales of Packages Developed in C.
SELECT SUM(SCOST * SOLD) AS Revenue
FROM Software
WHERE DEVELOPIN = 'C';
--9. Display the Details of the Software Developed by Ramesh. 
SELECT *
FROM Software
WHERE PNAME = 'RAMESH';
--10. How many Programmers Studied at Sabhari?
SELECT COUNT(DISTINCT PNAME) AS TotalProgrammers
FROM Studies
WHERE INSTITUTE = 'SABHARI';
--11. Display details of Packages whose sales crossed the 2000 Mark. 
SELECT *
FROM Software
WHERE SOLD > 2000;
--12. Display the Details of Packages for which Development Cost have been recovered. 
SELECT *
FROM Software
WHERE SCOST * SOLD >= DCOST;
--13. What is the cost of the costliest software development in Basic? 
SELECT MAX(SCOST) AS CostliestSoftwareDevelopment
FROM Software
WHERE DEVELOPIN = 'BASIC';
--14. How many Packages Developed in DBASE? 
SELECT COUNT(*) AS TotalPackages
FROM Software
WHERE DEVELOPIN = 'DBASE';
--15. How many programmers studied in Pragathi? 
SELECT COUNT(DISTINCT PNAME) AS TotalProgrammers
FROM Studies
WHERE INSTITUTE = 'PRAGATHI';
--16. How many Programmers Paid 5000 to 10000 for their course?
SELECT COUNT(*) AS TotalProgrammers
FROM Studies
WHERE COURSE_FEE BETWEEN 5000 AND 10000;
--17. What is AVG Course Fee 
SELECT AVG(COURSE_FEE) AS AverageCourseFee
FROM Studies;
--18. Display the details of the Programmers Knowing C.
SELECT *
FROM Programmer
WHERE PROF1 = 'C' OR PROF2 = 'C';
--19. How many Programmers know either COBOL or PASCAL. 
SELECT COUNT(*) AS TotalProgrammers
FROM Programmer
WHERE PROF1 IN ('COBOL', 'PASCAL') OR PROF2 IN ('COBOL', 'PASCAL');
--20. How many Programmers Don’t know PASCAL and C 
SELECT COUNT(*) AS TotalProgrammers
FROM Programmer
WHERE PROF1 NOT IN ('PASCAL', 'C') AND PROF2 NOT IN ('PASCAL', 'C');
--21. How old is the Oldest Male Programmer. 
SELECT DATEDIFF(YEAR, DOB, GETDATE()) AS Age
FROM Programmer
WHERE GENDER = 'M'
ORDER BY DOB ASC
OFFSET 0 ROWS
FETCH FIRST 1 ROWS ONLY;

--22. What is the AVG age of Female Programmers? 
SELECT AVG(DATEDIFF(YEAR, DOB, GETDATE())) AS AverageAge
FROM Programmer
WHERE GENDER = 'F';
--23. Calculate the Experience in Years for each Programmer and Display with their names in Descending order. 
SELECT PNAME, DATEDIFF(YEAR, DOJ, GETDATE()) AS Experience
FROM Programmer
ORDER BY Experience DESC;
--24. Who are the Programmers who celebrate their Birthday’s During the CurrentMonth? 
SELECT PNAME
FROM Programmer
WHERE MONTH(DOB) = MONTH(GETDATE());
--25. How many Female Programmers are there? 
SELECT COUNT(*) AS FemaleProgrammersCount
FROM Programmer
WHERE GENDER = 'F';
--26. What are the Languages studied by Male Programmers. 
SELECT DISTINCT PROF1 AS Language
FROM Programmer
WHERE GENDER = 'M'
UNION
SELECT DISTINCT PROF2 AS Language
FROM Programmer
WHERE GENDER = 'M';
--27. What is the AVG Salary? 
SELECT AVG(SALARY) AS AverageSalary
FROM Programmer;
--28. How many people draw salary 2000 to 4000? 
SELECT COUNT(*) AS PeopleCount
FROM Programmer
WHERE SALARY >= 2000 AND SALARY <= 4000;
--29. Display the details of those who don’t know Clipper, COBOL or PASCAL. 
SELECT *
FROM Programmer
WHERE PROF1 NOT IN ('Clipper', 'COBOL', 'PASCAL') AND PROF2 NOT IN ('Clipper', 'COBOL', 'PASCAL');
--30. Display the Cost of Package Developed By each Programmer. 
SELECT PNAME, SUM(SCOST) AS TotalCost
FROM Software
GROUP BY PNAME;
--31. Display the sales values of the Packages Developed by the each Programmer. 
SELECT PNAME, SUM(SOLD) AS TotalSales
FROM Software
GROUP BY PNAME;
--32. Display the Number of Packages sold by Each Programmer. 
SELECT PNAME, COUNT(*) AS TotalPackagesSold
FROM Software
GROUP BY PNAME;
--33. Display the sales cost of the packages Developed by each Programmer Language wise. 
SELECT PNAME, DEVELOPIN, SUM(SCOST) AS TotalSalesCost
FROM Software
GROUP BY PNAME, DEVELOPIN;
--34. Display each language name with AVG Development Cost, AVG Selling Cost andAVG Price per Copy. 
SELECT DEVELOPIN AS Language,
       AVG(DCOST) AS AvgDevelopmentCost,
       AVG(SCOST) AS AvgSellingCost,
       AVG(SCOST/SOLD) AS AvgPricePerCopy
FROM Software
GROUP BY DEVELOPIN;
--35. Display each programmer’s name, costliest and cheapest Packages Developed by him or her. 
SELECT P.PNAME AS ProgrammerName,
       MAX(S.SCOST) AS CostliestPackage,
       MIN(S.SCOST) AS CheapestPackage
FROM Programmer P
JOIN Software S ON P.PNAME = S.PNAME
GROUP BY P.PNAME;
--36. Display each institute name with number of Courses, Average Cost per Course. 
SELECT INSTITUTE, COUNT(DISTINCT COURSE) AS NumberOfCourses, AVG(COURSE_FEE) AS AverageCostPerCourse
FROM Studies
GROUP BY INSTITUTE;
--37. Display each institute Name with Number of Students. 
SELECT INSTITUTE, COUNT(*) AS NumberOfStudents
FROM Studies
GROUP BY INSTITUTE;
--38. Display Names of Male and Female Programmers. Gender also. 
SELECT PNAME, GENDER
FROM Programmer;
--39. Display the Name of Programmers and Their Packages. 
SELECT P.PNAME AS ProgrammerName, S.TITLE AS PackageTitle
FROM Programmer P
JOIN Software S ON P.PNAME = S.PNAME;
--40. Display the Number of Packages in Each Language Except C and C++. 
SELECT DEVELOPIN AS Language, COUNT(*) AS NumberOfPackages
FROM Software
WHERE DEVELOPIN NOT IN ('C', 'C++')
GROUP BY DEVELOPIN;
--41. Display the Number of Packages in Each Language for which Development Cost isless than 1000.
SELECT DEVELOPIN AS Language, COUNT(*) AS NumberOfPackages
FROM Software
WHERE DCOST < 1000
GROUP BY DEVELOPIN;
--42. Display AVG Difference between SCOST, DCOST for Each Package. 
SELECT TITLE AS PackageTitle, AVG(SCOST - DCOST) AS AverageCostDifference
FROM Software
GROUP BY TITLE;
--43. Display the total SCOST, DCOST and amount to Be Recovered for each Programmer for Those Whose Cost has not yet been Recovered. 
SELECT P.PNAME AS ProgrammerName,
       SUM(S.SCOST) AS TotalSCost,
       SUM(S.DCOST) AS TotalDCost,
       SUM(S.SCOST - S.DCOST) AS AmountToBeRecovered
FROM Programmer P
JOIN Software S ON P.PNAME = S.PNAME
GROUP BY P.PNAME
HAVING SUM(S.SCOST - S.DCOST) > 0;
--44. Display Highest, Lowest and Average Salaries for those earning more than 2000. 
SELECT MAX(SALARY) AS HighestSalary,
       MIN(SALARY) AS LowestSalary,
       AVG(SALARY) AS AverageSalary
FROM Programmer
WHERE SALARY > 2000;
--45. Who is the Highest Paid C Programmers?
select * from programmer where salary=
(select max(salary)  from Programmer where PROF1='c' or prof2='c' )
--46. Who is the Highest Paid Female COBOL Programmer? 
SELECT top 1 PNAME, SALARY
FROM Programmer
WHERE PROF1 = 'C' OR PROF2 = 'C'
ORDER BY SALARY DESC
--47. Display the names of the highest paid programmers for each Language. 
SELECT top 1 PNAME, SALARY
FROM Programmer
WHERE GENDER = 'F' AND (PROF1 = 'COBOL' OR PROF2 = 'COBOL')
ORDER BY SALARY DESC


--48. Who is the least experienced Programmer. 
SELECT top 1 PNAME, DOB, DOJ
FROM Programmer
ORDER BY DOJ ASC

--49. Who is the most experienced male programmer knowing PASCAL. 
SELECT top 1 PNAME, DOB, DOJ
FROM Programmer
WHERE GENDER = 'M' AND (PROF1 = 'PASCAL' OR PROF2 = 'PASCAL')
ORDER BY DOJ ASC

--50. Which Language is known by only one Programmer? 
SELECT PROF1 AS LANGUAGE
FROM Programmer
GROUP BY PROF1
HAVING COUNT(*) = 1
UNION
SELECT PROF2 AS LANGUAGE
FROM Programmer
GROUP BY PROF2
HAVING COUNT(*) = 1;
--51. Who is the Above Programmer Referred in 50? 
select * from Programmer where datediff(year,dob,getdate())>50
--52. Who is the Youngest Programmer knowing DBASE? 
SELECT top 1 PNAME, DOB
FROM Programmer
WHERE PROF1 = 'DBASE' OR PROF2 = 'DBASE'
ORDER BY DOB ASC

--53. Which Female Programmer earning more than 3000 does not know C, C++, ORACLE or DBASE? 
SELECT PNAME
FROM Programmer
WHERE GENDER = 'F'
  AND SALARY > 3000
  AND PROF1 NOT IN ('C', 'C++', 'ORACLE', 'DBASE')
  AND PROF2 NOT IN ('C', 'C++', 'ORACLE', 'DBASE');
--54. Which Institute has most number of Students? 
SELECT top 1 INSTITUTE, COUNT(*) AS StudentCount
FROM Studies
GROUP BY INSTITUTE
ORDER BY StudentCount DESC

--55. What is the Costliest course? 
SELECT top 1 COURSE, COURSE_FEE
FROM Studies
ORDER BY COURSE_FEE DESC

--56. Which course has been done by the most of the Students? 
SELECT top 1 COURSE, COUNT(*) AS StudentCount
FROM Studies
GROUP BY COURSE
ORDER BY StudentCount DESC

--57. Which Institute conducts costliest course. 
SELECT INSTITUTE
FROM Studies
WHERE COURSE_FEE = (
    SELECT MAX(COURSE_FEE)
    FROM Studies
);
--58. Display the name of the Institute and Course, which has below AVG course fee. 
SELECT INSTITUTE, COURSE
FROM Studies
WHERE COURSE_FEE < (
    SELECT AVG(COURSE_FEE)
    FROM Studies
);
--59. Display the names of the courses whose fees are within 1000 (+ or -) of the Average Fee, 
SELECT COURSE
FROM Studies
WHERE COURSE_FEE BETWEEN (SELECT AVG(COURSE_FEE) - 1000 FROM Studies) AND (SELECT AVG(COURSE_FEE) + 1000 FROM Studies);
--60. Which package has the Highest Development cost? 
SELECT TITLE
FROM Software
WHERE DCOST = (SELECT MAX(DCOST) FROM Software);
--61. Which course has below AVG number of Students? 
SELECT COURSE
FROM Studies
GROUP BY COURSE
HAVING COUNT(*) < (SELECT AVG(StudentCount) FROM (SELECT COUNT(*) AS StudentCount FROM Studies GROUP BY COURSE) AS AvgStudentCount);
--62. Which Package has the lowest selling cost? 
SELECT TITLE
FROM Software
WHERE SCOST = (SELECT MIN(SCOST) FROM Software);
--63. Who Developed the Package that has sold the least number of copies? 
SELECT PNAME
FROM Software
WHERE SOLD = (SELECT MIN(SOLD) FROM Software);

--64. Which language has used to develop the package, which has the highest sales amount? 
SELECT DEVELOPIN
FROM Software
WHERE SCOST * SOLD = (SELECT MAX(SCOST * SOLD) FROM Software);
--65. How many copies of package that has the least difference between development and selling cost where sold. 
SELECT SOLD
FROM Software
WHERE ABS(SCOST - DCOST) = (SELECT MIN(ABS(SCOST - DCOST)) FROM Software);
--66. Which is the costliest package developed in PASCAL. 
SELECT top 1 TITLE
FROM Software
WHERE DEVELOPIN = 'PASCAL'
ORDER BY SCOST DESC
--67. Which language was used to develop the most number of Packages. 
SELECT top 1  DEVELOPIN, COUNT(*) AS PACKAGE_COUNT
FROM Software
GROUP BY DEVELOPIN
ORDER BY PACKAGE_COUNT DESC
--68. Which programmer has developed the highest number of Packages? 
SELECT top 1 PNAME, COUNT(*) AS PACKAGE_COUNT
FROM Software
GROUP BY PNAME
ORDER BY PACKAGE_COUNT DESC
--69. Who is the Author of the Costliest Package? 
SELECT PNAME, TITLE, SCOST
FROM Software
WHERE SCOST = (
    SELECT MAX(SCOST)
    FROM Software
);
--70. Display the names of the packages, which have sold less than the AVG number of copies. 
SELECT TITLE
FROM Software
WHERE SOLD < (
    SELECT AVG(SOLD)
    FROM Software
);
--71. Who are the authors of the Packages, which have recovered more than double the Development cost? 
SELECT PNAME
FROM Software
WHERE SCOST < (2 * DCOST);
--72. Display the programmer Name and the cheapest packages developed by them ineach language. 
SELECT P.PNAME, S.TITLE, S.DEVELOPIN
FROM Programmer P
INNER JOIN (
    SELECT PNAME, MIN(SCOST) AS MIN_SCOST
    FROM Software
    GROUP BY PNAME
) AS T ON P.PNAME = T.PNAME
INNER JOIN Software S ON P.PNAME = S.PNAME AND T.MIN_SCOST = S.SCOST
ORDER BY P.PNAME;
--73. Display the language used by each programmer to develop the Highest Selling and Lowest-selling package.
SELECT P.PNAME, MAX(S.DEVELOPIN) AS LANGUAGE_HIGHEST, MIN(S.DEVELOPIN) AS LANGUAGE_LOWEST
FROM Programmer P
INNER JOIN (
    SELECT PNAME, MAX(SOLD) AS MAX_SOLD, MIN(SOLD) AS MIN_SOLD
    FROM Software
    GROUP BY PNAME
) AS T ON P.PNAME = T.PNAME
INNER JOIN Software S ON P.PNAME = S.PNAME
WHERE S.SOLD = T.MAX_SOLD OR S.SOLD = T.MIN_SOLD
GROUP BY P.PNAME; 
--74. Who is the youngest male Programmer born in 1965? 
SELECT top 1 PNAME, DOB
FROM Programmer
WHERE GENDER = 'M' AND DOB BETWEEN '1965-01-01' AND '1965-12-31'
ORDER BY DOB ASC

--75. Who is the oldest Female Programmer who joined in 1992?
SELECT top 1 PNAME, DOB
FROM Programmer
WHERE GENDER = 'F' AND DOJ >= '1992-01-01' AND DOJ <= '1992-12-31'
ORDER BY DOB ASC

--76. In which year was the most number of Programmers born. 
SELECT YEAR(DOB) AS BirthYear, COUNT(*) AS ProgrammerCount
FROM Programmer
GROUP BY YEAR(DOB)
ORDER BY ProgrammerCount DESC
OFFSET 0 ROWS FETCH FIRST 1 ROWS ONLY;

--77. In which month did most number of programmers join? 
SELECT DATEPART(MONTH, DOJ) AS JoinMonth, COUNT(*) AS ProgrammerCount
FROM Programmer
GROUP BY DATEPART(MONTH, DOJ)
ORDER BY ProgrammerCount DESC
OFFSET 0 ROWS FETCH FIRST 1 ROWS ONLY;
--78. In which language are most of the programmer’s proficient. 
SELECT Language, COUNT(*) AS ProgrammerCount
FROM (
    SELECT PROF1 AS Language FROM Programmer
    UNION ALL
    SELECT PROF2 AS Language FROM Programmer
) AS AllLanguages
GROUP BY Language
ORDER BY ProgrammerCount DESC
OFFSET 0 ROWS FETCH FIRST 1 ROWS ONLY;
--79. Who are the male programmers earning below the AVG salary ofFemale Programmers? 
WITH FemaleAvgSalary AS (
  SELECT AVG(SALARY) AS AvgSalary
  FROM Programmer
  WHERE GENDER = 'F'
),
MaleProgrammers AS (
  SELECT PNAME, SALARY
  FROM Programmer
  WHERE GENDER = 'M'
)
SELECT MaleProgrammers.PNAME, MaleProgrammers.SALARY
FROM MaleProgrammers, FemaleAvgSalary
WHERE MaleProgrammers.SALARY < FemaleAvgSalary.AvgSalary;
--80. Who are the Female Programmers earning more than the Highest Paid? 
WITH HighestPaid AS (
  SELECT MAX(SALARY) AS MaxSalary
  FROM Programmer
),
FemaleProgrammers AS (
  SELECT PNAME, SALARY
  FROM Programmer
  WHERE GENDER = 'F'
)
SELECT FemaleProgrammers.PNAME, FemaleProgrammers.SALARY
FROM FemaleProgrammers, HighestPaid
WHERE FemaleProgrammers.SALARY > HighestPaid.MaxSalary;
--81. Which language has been stated as the proficiency by most of the Programmers? 
SELECT top 1 Language, COUNT(*) AS ProgrammerCount
FROM (
    SELECT PROF1 AS Language FROM Programmer
    UNION ALL
    SELECT PROF2 AS Language FROM Programmer
) AS AllLanguages
GROUP BY Language
ORDER BY ProgrammerCount DESC

--82. Display the details of those who are drawing the same salary. 
SELECT P1.PNAME, P1.DOB, P1.GENDER, P1.PROF1, P1.PROF2, P1.SALARY
FROM Programmer P1
INNER JOIN Programmer P2 ON P1.SALARY = P2.SALARY AND P1.PNAME <> P2.PNAME
ORDER BY P1.SALARY;
--83. Display the details of the Software Developed by the Male Programmers Earning More than 3000/-. 
SELECT S.TITLE, S.DEVELOPIN, S.SCOST, S.DCOST, S.SOLD
FROM Software S
INNER JOIN Programmer P ON S.PNAME = P.PNAME
WHERE P.GENDER = 'M' AND P.SALARY > 3000;
--84. Display the details of the packages developed in Pascal by the Female Programmers. 
SELECT *
FROM Software
WHERE DEVELOPIN = 'PASCAL' AND PNAME IN (
  SELECT PNAME
  FROM Programmer
  WHERE GENDER = 'F'
);
--85. Display the details of the Programmers who joined before 1990. 
SELECT *
FROM Programmer
WHERE DOJ < '1990-01-01';
--86. Display the details of the Software Developed in C By female programmers ofPragathi.
SELECT *
FROM Software
WHERE DEVELOPIN = 'C' AND PNAME IN (
  SELECT PNAME
  FROM Programmer
  WHERE GENDER = 'F' AND PROF1 = 'PRAGATHI'
); 
--87. Display the number of packages, No. of Copies Sold and sales value ofeach programmer institute wise. 
SELECT p.INSTITUTE, COUNT(s.TITLE) AS NumPackages, SUM(s.SOLD) AS NumCopiesSold, SUM(s.SCOST * s.SOLD) AS SalesValue
FROM Studies p
JOIN Software s ON p.PNAME = s.PNAME
GROUP BY p.INSTITUTE;
--88. Display the details of the software developed in DBASE by Male Programmers, who belong to the institute in which most number of Programmers studied. 
SELECT s.*
FROM Software s
JOIN (
  SELECT INSTITUTE
  FROM Studies
  GROUP BY INSTITUTE
  HAVING COUNT(*) = (
    SELECT MAX(NumProgrammers)
    FROM (
      SELECT COUNT(*) AS NumProgrammers
      FROM Studies
      GROUP BY INSTITUTE
    ) AS subquery
  )
) t ON s.PNAME IN (
  SELECT PNAME
  FROM Programmer
  WHERE GENDER = 'M'
)
WHERE s.DEVELOPIN = 'DBASE';
--89. Display the details of the software Developed by the male programmers Born before 1965 and female programmers born after 1975. 
SELECT *
FROM Software
WHERE PNAME IN (
  SELECT PNAME
  FROM Programmer
  WHERE (GENDER = 'M' AND DOB < '1965-01-01') OR (GENDER = 'F' AND DOB > '1975-12-31')
);
--90. Display the details of the software that has developed in the language which isneither the first nor the second proficiency of the programmers. 
SELECT *
FROM Software
WHERE DEVELOPIN NOT IN (
  SELECT PROF1
  FROM Programmer
  UNION
  SELECT PROF2
  FROM Programmer
);
--91. Display the details of the software developed by the male students of Sabhari. 
SELECT s.*
FROM Software s
JOIN Programmer p ON s.PNAME = p.PNAME
JOIN Studies st ON st.PNAME = p.PNAME
WHERE st.INSTITUTE = 'SABHARI' AND p.GENDER = 'M';
--92. Display the names of the programmers who have not developed any packages. 
SELECT PNAME
FROM Programmer
WHERE PNAME NOT IN (
  SELECT DISTINCT PNAME
  FROM Software
);
--93. What is the total cost of the Software developed by the programmers of Apple? 
SELECT SUM(SCOST) AS TotalCost
FROM Software
WHERE PNAME IN (
  SELECT PNAME
  FROM Programmer
  WHERE PROF1 = 'APPLE' OR PROF2 = 'APPLE'
);
--94. Who are the programmers who joined on the same day? 
SELECT p1.PNAME, p2.PNAME, p1.DOJ
FROM Programmer p1
JOIN Programmer p2 ON p1.DOJ = p2.DOJ
WHERE p1.PNAME <> p2.PNAME;
--95. Who are the programmers who have the same Prof2? 
SELECT p1.PNAME, p2.PNAME, p1.PROF2
FROM Programmer p1
JOIN Programmer p2 ON p1.PROF2 = p2.PROF2
WHERE p1.PNAME <> p2.PNAME;
--96. Display the total sales value of the software, institute wise. 
SELECT st.INSTITUTE, SUM(s.SCOST * s.SOLD) AS TotalSalesValue
FROM Software s
JOIN Programmer p ON s.PNAME = p.PNAME
JOIN Studies st ON st.PNAME = p.PNAME
GROUP BY st.INSTITUTE;
--97. In which institute does the person who developed the costliest package studied. 
SELECT st.INSTITUTE
FROM Studies st
JOIN Programmer p ON st.PNAME = p.PNAME
JOIN Software s ON s.PNAME = p.PNAME
WHERE s.SCOST = (
    SELECT MAX(SCOST)
    FROM Software
);
--98. Which language listed in prof1, prof2 has not been used to develop any package. 
SELECT prof.Language
FROM (
    SELECT prof1 AS Language FROM Programmer
    UNION
    SELECT prof2 AS Language FROM Programmer
) AS prof
WHERE prof.Language NOT IN (
    SELECT DISTINCT DEVELOPIN
    FROM Software
);
--99. How much does the person who developed the highest selling package earn andwhat course did HE/SHE undergo. 
SELECT p.PNAME, p.SALARY, s.COURSE
FROM Programmer p
JOIN Studies s ON p.PNAME = s.PNAME
JOIN Software sw ON p.PNAME = sw.PNAME
WHERE sw.SOLD = (
    SELECT MAX(SOLD)
    FROM Software
);
--100. What is the AVG salary for those whose software sales is more than 50,000/-. 
SELECT AVG(p.SALARY) AS AvgSalary
FROM Programmer p
JOIN Software s ON p.PNAME = s.PNAME
WHERE s.SCOST * s.SOLD > 50000;
--101. How many packages were developed by students, who studied in institute that charge the lowest course fee? 
SELECT COUNT(*) AS PackageCount
FROM Studies s
JOIN Programmer p ON s.PNAME = p.PNAME
JOIN Software sw ON p.PNAME = sw.PNAME
WHERE s.INSTITUTE = (
    SELECT INSTITUTE
    FROM Studies
    GROUP BY INSTITUTE
    HAVING MIN(COURSE_FEE) = (
        SELECT MIN(COURSE_FEE)
        FROM Studies
    )
);
--102. How many packages were developed by the person who developed the cheapest package, where did HE/SHE study? 
SELECT COUNT(*) AS PackageCount, s.INSTITUTE
FROM Studies s
JOIN Programmer p ON s.PNAME = p.PNAME
JOIN Software sw ON p.PNAME = sw.PNAME
WHERE sw.SCOST = (
    SELECT MIN(SCOST)
    FROM Software
)
GROUP BY s.INSTITUTE;
--103. How many packages were developed by the female programmers earning more than the highest paid male programmer? 
SELECT COUNT(*) AS PackageCount
FROM Programmer p
JOIN Software s ON p.PNAME = s.PNAME
WHERE p.GENDER = 'F'
AND p.SALARY > (
    SELECT MAX(SALARY)
    FROM Programmer
    WHERE GENDER = 'M'
);
--104. How many packages are developed by the most experienced programmer form BDPS. 
SELECT COUNT(*) AS PackageCount
FROM Studies s
JOIN Programmer p ON s.PNAME = p.PNAME
JOIN Software sw ON p.PNAME = sw.PNAME
WHERE s.INSTITUTE = 'BDPS'
AND p.DOJ = (
    SELECT MIN(DOJ)
    FROM Programmer
    WHERE PNAME IN (
        SELECT PNAME
        FROM Studies
        WHERE INSTITUTE = 'BDPS'
    )
);
--105. List the programmers (form the software table) and the institutes they studied. 
SELECT sw.PNAME AS ProgrammerName, st.INSTITUTE AS Institute
FROM Software sw
JOIN Programmer p ON sw.PNAME = p.PNAME
JOIN Studies st ON p.PNAME = st.PNAME;
--106. List each PROF with the number of Programmers having that PROF and the number of the packages in that PROF. 
SELECT PROF1, COUNT(DISTINCT p.PNAME) AS NumProgrammers, COUNT(sw.TITLE) AS NumPackages
FROM Programmer p
LEFT JOIN Software sw ON p.PNAME = sw.PNAME
GROUP BY PROF1;
--107. List the programmer names (from the programmer table) and No. Of Packages each has developed.
SELECT p.PNAME AS ProgrammerName, COUNT(sw.TITLE) AS NumPackages
FROM Programmer p
LEFT JOIN Software sw ON p.PNAME = sw.PNAME
GROUP BY p.PNAME;
