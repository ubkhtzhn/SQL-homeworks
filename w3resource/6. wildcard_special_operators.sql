-- Exercise 1 --

-- From the following table, write a SQL query to find the details of those salespeople who come from the 'Paris' City or 'Rome' City. 
-- Return salesman_id, name, city, commission.

select * from inventory.salesman
where city = 'Paris' or city = 'Rome'

-- Exercise 2 --

-- From the following table, write a SQL query to find the details of the salespeople who come from either 'Paris' or 'Rome'. 
-- Return salesman_id, name, city, commission. 

select * from inventory.salesman
where city = 'Paris' or city = 'Rome'


-- Exercise 3 --

-- From the following table, write a SQL query to find the details of those salespeople who live in cities other than Paris and Rome. 
-- Return salesman_id, name, city, commission.  

select * from inventory.salesman
where city != 'Paris' and city != 'Rome'

-- Exercise 4 --

-- From the following table, write a SQL query to retrieve the details of all customers whose ID belongs to any of the values 3007, 3008 or 3009. 
-- Return customer_id, cust_name, city, grade, and salesman_id.  

select * from inventory.customer
where customer_id in (3007, 3008, 3009)

-- Exercise 5 --

-- From the following table, write a SQL query to find salespeople who receive commissions between 0.12 and 0.14 (begin and end values are included). 
-- Return salesman_id, name, city, and commission.  

select * from inventory.salesman
where commission between 0.12 and 0.14

-- Exercise 6 -- 

-- From the following table, write a SQL query to select orders between 500 and 4000 (begin and end values are included). 
-- Exclude orders amount 948.50 and 1983.43. 
-- Return ord_no, purch_amt, ord_date, customer_id, and salesman_id. 

select * from inventory.orders
where (purch_amt between 500 and 4000) and (purch_amt != 948.50 and purch_amt != 1983.43)

-- Exercise 7 --

-- From the following table, write a SQL query to retrieve the details of the salespeople whose names begin with any letter between 'A' and 'L' (not inclusive). 
-- Return salesman_id, name, city, commission. 

select * from inventory.salesman
where name like '[A-L]%'

select * from inventory.salesman
where name between 'a' and 'l'

-- Exercise 8 --

-- From the following table, write a SQL query to find the details of all salespeople except those whose names begin with any letter between 'A' and 'M'. 
-- Return salesman_id, name, city, commission. 

select * from inventory.salesman
where name not like '[A-M]%'

-- Exercise 9 --

-- From the following table, write a SQL query to retrieve the details of the customers whose names begins with the letter 'B'. 
-- Return customer_id, cust_name, city, grade, salesman_id.. 

select * from inventory.customer
where cust_name like 'B%'

-- Exercise 10 -- 

-- From the following table, write a SQL query to find the details of the customers whose names end with the letter 'n'. 
-- Return customer_id, cust_name, city, grade, salesman_id.

select * from inventory.customer
where cust_name like '%n'

-- Exercise 11 --

-- From the following table, write a SQL query to find the details of those salespeople whose names begin with ‘N’ and the fourth character is 'l'. 
-- Rests may be any character. Return salesman_id, name, city, commission. 

select * from inventory.salesman
where name like 'N__l%'

-- Exercise 12 --

-- From the following table, write a SQL query to find those rows where col1 contains the escape character underscore ( _ ). Return col1.

-- I can't find testtable

-- Exercise 20 -- 

-- From the following table, write a SQL query to find all those customers who does not have any grade. 
-- Return customer_id, cust_name, city, grade, salesman_id.

select * from inventory.customer
where grade is null

-- Exercise 21 -- 

-- From the following table, write a SQL query to locate all customers with a grade value. Return customer_id, cust_name,city, grade, salesman_id.

select * from inventory.customer
where grade is not null

-- Exercise 22 --

-- From the following table, write a SQL query to locate the employees whose last name begins with the letter 'D'. 
-- Return emp_idno, emp_fname, emp_lname and emp_dept.

select * from emp_details
where emp_lname like 'd%'