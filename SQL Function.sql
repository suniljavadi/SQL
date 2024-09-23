--You have successfully cleared your 3rd semester. In the 4th semester, you will work with inbuilt functions 
--and user-defined functions
--Tasks to be done:
--1. Use the inbuilt functions and find the minimum, maximum and average amount from the orders 
--table
--2. Create a user-defined function, which will multiply the given number with 10
--3. Use the case statement to check if 100 is less than 200, greater than 200 or equal to 200 and 
--print the corresponding value

--USE BIKESTORES

--SELECT * FROM SALES.ORDER_ITEMS

--1. Use the inbuilt functions and find the minimum, maximum and average amount from the orders 
--table
SELECT MAX(amount) AS MAXIMUM_PRICE,MIN(amount) AS MINIMUM_PRICE,AVG(amount) AS AVERAGE_PRICE FROM orders
----------------------------------------------------------------------------
--2. Create a user-defined function, which will multiply the given number with 10
create FUNCTION MULTIPLICATION(@B INT)
RETURNS INT
AS
BEGIN
 --DECLARE @B INT
 SET @B=@B*10
 RETURN @B
 END

 SELECT DBO.MULTIPLICATION(5)
 --------------------------------------------------------------------------------------

 --3. Use the case statement to check if 100 is less than 200, greater than 200 or equal to 200 and 
--print the corresponding value
SELECT
CASE  WHEN 100<200 THEN '100 LESS THAN 200'
      WHEN 100>200 THEN '100 GREATER THAN 200'
	  WHEN 100=200 THEN '100 EQUAL TO 200'
	  END AS VALUE
