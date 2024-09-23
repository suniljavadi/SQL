--1. Create an ‘Orders’ table which comprises of these columns – ‘order_id’, ‘order_date’, ‘amount’, 
--‘customer_id’

CREATE TABLE orders(ORDER_ID INT PRIMARY key,ORDER_DATE DATE,amount money,customer_id int)
--2. Make an inner join on ‘Customer’ & ‘Order’ tables on the ‘customer_id’ column 
select * from orders O inner join customer c on c.CUSTOMER_ID=o.customer_id 
--3. Make left and right joins on ‘Customer’ & ‘Order’ tables on the ‘customer_id’ column
select * from orders O left join customer c on c.CUSTOMER_ID=o.customer_id 

select * from orders O right join customer c on c.CUSTOMER_ID=o.customer_id 

--4. Update the ‘Orders’ table, set the amount to be 100 where ‘customer_id’ is 3

update orders set amount=100 where customer_id=3
