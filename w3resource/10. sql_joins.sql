-- Exercise 1 --

-- From the following tables write a SQL query to find the salesperson and customer who reside in the same city. Return Salesman, cust_name and city.

select name, cust_name, inventory.customer.city from inventory.customer
join inventory.salesman
on inventory.customer.city = inventory.salesman.city

-- Exercise 2 -- 

-- From the following tables write a SQL query to find those orders where the order amount exists between 500 and 2000. 
-- Return ord_no, purch_amt, cust_name, city.

select ord_no, purch_amt, cust_name, city from inventory.customer
join inventory.orders
on inventory.customer.customer_id = inventory.orders.customer_id
where purch_amt between 500 and 2000

-- Exercise 3 --

-- From the following tables write a SQL query to find the salesperson(s) and the customer(s) he represents. 
-- Return Customer Name, city, Salesman, commission.

select cust_name as [customer name], inventory.customer.city, name as [salesman name], commission from inventory.salesman
join inventory.customer
on inventory.salesman.salesman_id = inventory.customer.salesman_id

-- Exercise 4 --

-- From the following tables write a SQL query to find salespeople who received commissions of more than 12 percent from the company. 
-- Return Customer Name, customer city, Salesman, commission. 

select cust_name as [customer name], inventory.customer.city as [city], name as [salesman name], commission from inventory.customer
join inventory.salesman
on inventory.salesman.salesman_id = inventory.customer.salesman_id
where commission > 0.12

-- Exercise 5 -- 

-- From the following tables write a SQL query to locate those salespeople who do not live in the same city 
-- where their customers live and have received a commission of more than 12% from the company. 
-- Return Customer Name, customer city, Salesman, salesman city, commission.  

select cust_name as [customer name], inventory.customer.city, name as [salesman name], inventory.salesman.city, commission from inventory.salesman
join inventory.customer
on inventory.salesman.salesman_id = inventory.customer.salesman_id
where (inventory.salesman.city) != (Inventory.Customer.city) and (commission > 0.12)

-- Exercise 6 -- 

-- From the following tables write a SQL query to find the details of an order. 
-- Return ord_no, ord_date, purch_amt, Customer Name, grade, Salesman, commission.

select ord_no, ord_date, purch_amt, cust_name as [customer name], grade, name [salesman name], commission from inventory.orders as o
join inventory.customer as c
on o.customer_id = c.customer_id
join inventory.salesman as s
on s.salesman_id = c.salesman_id

-- Exercise 7 --

-- Write a SQL statement to join the tables salesman, customer and orders so that the 
-- same column of each table appears once and only the relational rows are returned. 

--select * from Inventory.Salesman
--select * from Inventory.Customer
--select * from Inventory.Orders

--select distinct * from inventory.salesman as s
--join inventory.customer as c
--on s.salesman_id = c.salesman_id
--join inventory.orders as o
--on c.customer_id = o.customer_id

--SELECT * FROM inventory.orders 
--NATURAL JOIN inventory.customer

-- Exercise 8 --

-- From the following tables write a SQL query to display the customer name, customer city, grade, salesman, salesman city. 
-- The results should be sorted by ascending customer_id.

select * from inventory.customer
select * from inventory.salesman

select cust_name as [customer name], c.city as [customer city], grade, name as [salesman], s.city as [salesman city] from inventory.customer as c
join inventory.salesman as s
on c.salesman_id = s.salesman_id
order by customer_id

-- Exercise 9 --

-- From the following tables write a SQL query to find those customers with a grade less than 300. 
-- Return cust_name, customer city, grade, Salesman, salesmancity. 
-- The result should be ordered by ascending customer_id. 

select cust_name, c.city as [customer city], grade, name as [salesman], s.city as [salesman city] from inventory.salesman as s
join inventory.customer as c
on s.salesman_id = c.salesman_id
where grade < 300

-- Exercise 10 --

-- Write a SQL statement to make a report with customer name, city, order number, order date, and order amount in ascending order 
-- according to the order date to determine whether any of the existing customers have placed an order or not.

select cust_name, c.city, ord_no, ord_date, purch_amt from inventory.customer as c
join inventory.orders as o
on c.customer_id = o.customer_id
order by ord_date

-- Exercise 11 --

 --SQL statement to generate a report with customer name, city, order number, order date, order amount, salesperson name, and commission to determine if 
 --any of the existing customers have not placed orders or if they have placed orders through their salesman or by themselves.

select cust_name as [customer name], c.city as [customer city], ord_no as [order number], ord_date as [order date], purch_amt as [order amount], name as [salesperson], commission from inventory.customer as c
left join inventory.orders as o
on c.customer_id = o.customer_id
left join inventory.salesman as s
on c.salesman_id = s.salesman_id

-- Exercise 12 -- 

-- Write a SQL statement to generate a list in ascending order of salespersons who work either for 
-- one or more customers or have not yet joined any of the customers.

select name as [salesperson] from inventory.salesman as s
left join inventory.customer as c
on s.salesman_id = c.salesman_id

-- Exercise 13 --

-- From the following tables write a SQL query to list all salespersons along with customer name, city, grade, order number, date, and amount. 
-- Condition for selecting list of salesmen : 1. Salesmen who works for one or more customer or, 2. Salesmen who not yet join under any customer, 
-- Condition for selecting list of customer : 3. placed one or more orders, or 4. no order placed to their salesman.

select cust_name, c.city, grade, ord_no, ord_date, purch_amt from inventory.salesman s
join inventory.customer c
on s.salesman_id = c.salesman_id
join inventory.orders o
on c.customer_id = o.customer_id

-- Exercise 14 -- 

-- Write a SQL statement to make a list for the salesmen who either work for one or more customers or yet to join any of the customer. 
-- The customer may have placed, either one or more orders on or above order amount 2000 and must have a grade, or he may not have placed any order to the associated supplier.

select c.cust_name, c.city, c.grade, s.name salesman, o.ord_no, o.ord_date, o.purch_amt from inventory.customer c
right join inventory.salesman s
on c.salesman_id = s.salesman_id
left join inventory.orders o
on c.customer_id = o.customer_id
where (purch_amt >= 2000 and grade is not null) or (purch_amt is not null and grade is not null)

-- Exercise 15 --

-- For those customers from the existing list who put one or more orders, or which orders have been placed by the customer who is not 
-- on the list, create a report containing the customer name, city, order number, order date, and purchase amount

select c.cust_name, c.city, o.ord_no, o.ord_date, o.purch_amt from inventory.customer c
left join inventory.orders o
on c.customer_id = o.customer_id

-- Exercise 16 -- 

-- Write a SQL statement to generate a report with the customer name, city, order no. order date, purchase amount for only those customers on the 
-- list who must have a grade and placed one or more orders or which order(s) have been placed by the customer who neither is on the list nor has a grade.

select c.cust_name, c.city, o.ord_no, o.ord_date, o.purch_amt, grade from inventory.customer c
full join inventory.orders o
on c.customer_id = o.customer_id
where grade is not null

-- Exercise 17 --

-- Write a SQL query to combine each row of the salesman table with each row of the customer table.

select * from inventory.salesman s
cross join inventory.customer

-- Exercise 18 --

-- Write a SQL statement to create a Cartesian product between salesperson and customer, i.e. 
-- each salesperson will appear for all customers and vice versa for that salesperson who belongs to that city.

select * from inventory.salesman s
cross join inventory.customer
where s.city is not null

-- Exercise 19 --

-- Write a SQL statement to create a Cartesian product between salesperson and customer, 
-- i.e. each salesperson will appear for every customer and vice versa for those salesmen who belong to a city and customers who require a grade.

select * from inventory.salesman s
cross join inventory.customer
where s.city is not null and grade is not null

-- Exercise 20 --

-- Write a SQL statement to make a Cartesian product between salesman and customer i.e. each salesman will appear for all customers and vice versa for 
-- those salesmen who must belong to a city which is not the same as his customer and the customers should have their own grade.

select * from inventory.salesman s
cross join inventory.customer c
where s.city != c.city and c.grade is not null

-- Exercise 21 --

create table company_mast (
com_id int primary key identity(11, 1),
com_name varchar(20))

insert into company_mast values
('samsung'),
('iball'),
('epsion'),
('zebronics'),
('asus'),
('frontech')

-- From the following tables write a SQL query to select all rows from both participating tables as long as there is a match between pro_com and com_id.

select * from item_mast
select * from company_mast

select * from item_mast i
join company_mast c
on i.pro_com = c.com_id

-- Exercise 22 -- 

-- Write a SQL query to display the item name, price, and company name of all the products.

select pro_name, pro_price, com_name from item_mast i
join company_mast c
on i.pro_com = c.com_id

-- Exercise 23 --

-- From the following tables write a SQL query to calculate the average price of items of each company. Return average value and company name.

select * from item_mast
select * from company_mast


select com_name, avg(pro_price) [average price] from item_mast i
join company_mast c
on i.pro_com = c.com_id
group by com_name

-- Exercise 24 --

-- From the following tables write a SQL query to calculate and find the average price of items of each company higher than or equal to Rs. 350. 
-- Return average value and company name.

select com_name, avg(pro_price) [average price] from item_mast i
join company_mast c
on i.pro_com = c.com_id
group by com_name
having(avg(pro_price) > 350)

-- Exercise 25 --

-- From the following tables write a SQL query to find the most expensive product of each company. Return pro_name, pro_price and com_name.

select pro_name, pro_price [expensive product], com_name from item_mast i
join company_mast c
on i.pro_com = c.com_id and pro_price = 
										(select max(pro_price) from item_mast i
										 where pro_com = com_id)

-- Exercise 26 -- 

-- From the following tables write a SQL query to display all the data of employees including their department.

create table emp_department
(dpt_code int,
dpt_name varchar(20),
dpt_allotment int)

insert into emp_department values
(57, 'IT', 65000),
(63, 'Finance', 15000),
(47, 'HR', 240000),
(27, 'RD', 55000),
(89, 'QC', 75000)

select em.emp_dept, em.emp_fname, em.emp_lname, dpt_name, ed.dpt_allotment from emp_details em
join emp_department ed
on em.emp_dept = ed.dpt_code

-- Exercise 27 --

-- From the following tables write a SQL query to display the first and last names of each employee, as well as the department name and sanction amount.

select edet.emp_fname [first name], edet.emp_lname [last name], edep.dpt_name [department name], edep.dpt_allotment [sanction amount] from emp_details edet
join emp_department edep
on edet.emp_dept = edep.dpt_code

-- Exercise 28 --

-- From the following tables write a SQL query to find the departments with budgets more than Rs. 50000 and display the first name and last name of employees.

select edet.emp_fname [first name], edet.emp_lname [last name] from emp_details edet
join emp_department edep
on edet.emp_dept = edep.dpt_code and edep.dpt_allotment > 50000

-- Exercise 29 --

-- From the following tables write a SQL query to find the names of departments where more than two employees are employed. Return dpt_name.

select edep.dpt_name, count(edep.dpt_code) from emp_department edep
left join emp_details edet
on edep.dpt_code = edet.emp_dept
group by edep.dpt_name
having(count(edep.dpt_code) > 2)

