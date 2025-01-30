-- Exercise 1 --

-- From the following tables, write a SQL query to find the salespeople and customers who live in the same city. 
-- Return customer name, salesperson name and salesperson city.

select cust_name, name, s.city from inventory.salesman s
join inventory.customer c
on s.city = c.city
order by city

-- Exercise 2 --

-- From the following tables, write a SQL query to locate all the customers and the salesperson who works for them. 
-- Return customer name, and salesperson name. 

select cust_name, name from inventory.salesman s, inventory.customer c
where s.salesman_id = c.salesman_id

-- Exercise 3 --

-- From the following tables, write a SQL query to find those salespeople who generated orders for their customers but are not located in the same city. 
-- Return ord_no, cust_name, customer_id (orders table), salesman_id (orders table). 

select * from inventory.salesman
select * from inventory.customer
select * from inventory.orders

select ord_no, cust_name, o.customer_id, o.salesman_id from inventory.customer c, inventory.orders o, inventory.Salesman s
where s.city != c.city and s.salesman_id = o.salesman_id and o.customer_id = c.customer_id

-- Exercise 4 --

-- From the following tables, write a SQL query to locate the orders made by customers. Return order number, customer name.  

select ord_no, cust_name from inventory.customer c, inventory.orders o
where c.customer_id = o.customer_id

-- Exercise 5 --

-- From the following tables, write a SQL query to find those customers where each customer has a grade and is served by a salesperson who belongs to a city. 
-- Return cust_name as "Customer", grade as "Grade". 

select cust_name customer, grade from inventory.orders o, inventory.customer c
where	o.customer_id = c.customer_id and
		grade is not null 

-- Exercise 6 --

-- From the following table, write a SQL query to find those customers who are served 
-- by a salesperson and the salesperson earns commission in the range of 12% to 14% (Begin and end values are included.). 
-- Return cust_name AS "Customer", city AS "City". 

select cust_name customer, c.city city, name salesman, commission from Inventory.Customer c, Inventory.Salesman s
where c.salesman_id = s.salesman_id and (commission between 0.12 and 0.14)

-- Exercise 7 --

-- From the following tables, write a SQL query to find all orders executed by the salesperson and ordered by the customer whose grade is 
-- greater than or equal to 200. Compute purch_amt*commission as “Commission”. 
-- Return customer name, commission as “Commission%” and Commission.

select cust_name, (commission*purch_amt) 'commission%', commission from inventory.salesman s, inventory.customer c, inventory.orders o
where s.salesman_id = c.salesman_id and o.customer_id = c.customer_id and grade >= 200

-- Exercise 8 --

-- From the following table, write a SQL query to find those customers who placed orders on October 5, 2012. 
-- Return customer_id, cust_name, city, grade, salesman_id, ord_no, purch_amt, ord_date, customer_id and salesman_id.

select o.customer_id, cust_name, s.city, grade, s.salesman_id, ord_no, purch_amt, ord_date, c.customer_id, c.salesman_id from inventory.salesman s, inventory.customer c, inventory.orders o
where	s.salesman_id = c.salesman_id and
		c.customer_id = o.customer_id and
		ord_date = '2012-10-05'