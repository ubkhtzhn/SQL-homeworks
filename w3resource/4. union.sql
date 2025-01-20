select * from salesman
select * from customer

-- Exercise 1 -- 

-- From the following tables, write a SQL query to find all salespeople 
-- and customers located in the city of London.

select salesman_id as id, name, 'salesman' from salesman
where city = 'London'
union
(select customer_id, cust_name, 'customer' from customer
where city = 'London')

-- Exercise 2 --

-- From the following tables, write a SQL query to find distinct salespeople and their cities. Return salesperson ID and city.

select salesman_id, (city) from salesman
union
(select salesman_id, (city) from customer)

-- Exercise 3 --

--  From the following tables, write a SQL query to find all those 
-- salespeople and customers who are involved in the inventory management system. Return salesperson ID, customer ID.

select * from orders
select * from customer

select salesman_id, customer_id from orders
union
select salesman_id, customer_id from customer

-- Exercise 4 -- 

-- From the following table, write a SQL query to find the salespersons who generated the largest and smallest orders on each date. 
-- Return salesperson ID, name, order no., highest on/lowest on, order date.

select * from customer