-- Exercise 1 --

-- From the following table, write a SQL query to select all the salespeople. Return salesman_id, name, city, commission with the percent sign (%).

select salesman_id, name, city, '%', commission * 100 from inventory.salesman

-- Exercise 2 --

-- From the following table, write a SQL query to find the number of orders booked for each day. 
-- Return the result in a format like "For 2001-10-10 there are 15 orders".". 

select 'for', ord_date, ', there are', count(*), 'orders'  from inventory.orders
group by ord_date

-- Exercise 3 --

-- From the following table, write a SQL query to find all the orders. Sort the result-set in ascending order by ord_no. Return all fields.  

select * from inventory.orders
order by ord_no 

-- Exercise 4 --

-- From the following table, write a SQL query to find all the orders. Sort the result-set in descending order by ord_date. Return all fields. 

select * from inventory.orders
order by ord_date desc

-- Exercise 5 --

-- From the following table, write a SQL query to find all the orders. Sort the result-set in descending order by ord_date and purch_amt. Return all fields.  

select * from inventory.orders
order by ord_date, purch_amt desc

-- Exercise 6 --

-- From the following table, write a SQL query to find all the customers. Sort the result-set by customer_id. Return cust_name, city, grade. 

select cust_name, city, grade from inventory.customer
order by customer_id

-- Exercise 7 --

select salesman_id, ord_date, max(purch_amt) max from inventory.orders
group by salesman_id, ord_date
order by salesman_id, ord_date

-- Exercise 8 --

-- From the following table, write a SQL query to find all the customers. Sort the result-set in descending order on 3rd field. 
-- Return customer name, city and grade.  

select cust_name, city, grade from inventory.customer
order by grade desc

-- Exercise 9 --

select customer_id, count(*) count, max(purch_amt) max from inventory.orders
group by customer_id
order by count(*) desc, max(purch_amt) desc

-- Exercise 10 --

select ord_date, sum(purch_amt) sum, (sum(purch_amt)*0.15) commission from inventory.orders
group by ord_date
