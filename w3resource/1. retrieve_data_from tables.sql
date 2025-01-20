create database class5

create table salesman (
salesman_id int primary key,
name varchar(20),
city varchar(20),
comission decimal(5,2))


insert into salesman  values 
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5007, 'Paul Adam', 'Rome', 0.13),
(5003, 'Lauson Hen', 'San Jose', 0.12)
------------------------------------
create table orders (
salesman_id int,
customer_id int,
ord_no int primary key,
purch_amt dec(6, 2),
ord_date date
)


insert into orders values
(5002, 3005, 70001, 150.5, '2012-10-05'),
(5005, 3001, 70009, 270.65, '2012-09-10'),
(5001, 3002, 70002, 65.26, '2012-10-05'),
(5003, 3009, 70004, 110.5, '2012-08-17'),
(5002, 3005, 70007, 948.5, '2012-09-10'),
(5001, 3007, 70005, 2400.6, '2012-07-27'),
(5001, 3002, 70008, 5760, '2012-09-10'),
(5006, 3004, 70010, 1983.43, '2012-10-10'),
(5003, 3009, 70003, 2480.4, '2012-10-10'),
(5002, 3008, 70012, 250.45, '2012-06-27'),
(5007, 3003, 70011, 75.29, '2012-08-17'),
(5001, 3002, 70013, 3045.6, '2012-04-25')
-----------------------------------
create table customer (
customer_id int primary key,
cust_name varchar(30),
city varchar(20),
grade int,
salesman_id int
)


insert into customer values 
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3007, 'Bead Davis', 'New York', 200, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3008, 'Julian Green', 'London', 300, 5002),
(3004, 'Fabian Johnson', 'Paris', 300, 5006),
(3009, 'Geoff Cameron', 'Berlin', 100, 5003),
(3003, 'Jozy Altidor', 'Moscow', 200, 5007),
(3001, 'Brad Guzan', 'London', null, 5005)
-----------------------------------
create table nobel_win (
year int,
subject varchar(20),
winner varchar(40),
country varchar(20),
category varchar(20)
)


insert into nobel_win values 
(1970, 'Physics', 'Hannes Alfven', 'Sweden', 'Scientist' ),
(1970, 'Physics', 'Louis Neel', 'France', 'Scientist'),
(1970, 'Chemistry', 'Luis Federico Leloir', 'France', 'Scientist'),
(1970, 'Physiology', 'Ulf von Euler', 'Sweden', 'Scientist'),
(1970, 'Physiology', 'Bernard Katz', 'Germany', 'Scientist'),
(1970, 'Literature', 'Aleksandr Solzhenitsyn', 'Russia', 'Linguist'),
(1970, 'Economics', 'Paul Samuelson', 'USA', 'Economist'),
(1970, 'Physiology', 'Julius Axelrod', 'USA', 'Scientist'),
(1971, 'Physics', 'Dennis Gabor', 'Hungary', 'Scientist'),
(1971, 'Chemistry', 'Gerhard Herzberg', 'Germany', 'Scientist'),
(1971, 'Peace', 'Willy Brandt', 'Germany', 'Chancellor'),
(1971, 'Literature', 'Pablo Neruda', 'Chile', 'Linguist'),
(1971, 'Economics', 'Simon Kuznets', 'Russia', 'Economist'),
(1978, 'Peace', 'Anwar al-Sadat', 'Egypt', 'President'),
(1978, 'Peace', 'Menachem Begin', 'Israel', 'Prime Minister'),
(1987, 'Chemistry', 'Donald J. Cram', 'USA', 'Scientist'),
(1987, 'Chemistry', 'Jean-Marie Lehn', 'France', 'Scientist'),
(1987, 'Physiology', 'Susumu Tonegawa', 'Japan', 'Scientist'),
(1994, 'Economics', 'Reinhard Selten', 'Germany', 'Economist'),
(1994, 'Peace', 'Yitzhak Rabin', 'Israel', 'Prime Minister'), 
(1987, 'Physics', 'Johannes Georg Bednorz', 'Germany', 'Scientist'),
(1987, 'Literature', 'Joseph Brodsky', 'Russia', 'Linguist'),
(1987, 'Economics', 'Robert Solow', 'USA', 'Economist'),
(1994, 'Literature', 'Kenzaburo Oe', 'Japan', 'Linguist')
-----------------------------------
create table item_mast(
pro_id int,
pro_name varchar(20),
pro_price int,
pro_com int
)


insert into item_mast values
(101, 'Mother Board', 3200, 15),
(102, 'Key Board', 450, 16),
(103, 'ZIP drive', 250, 14),
(104, 'Speaker', 550, 16),
(105, 'Monitor', 5000, 11),
(106, 'DVD drive', 900, 12),
(107, 'CD drive', 800, 12),
(108, 'Printer', 2600, 13),
(109, 'Refill cartridge', 350, 13),
(110, 'Mouse', 250, 12)
-----------------------------------
create table emp_details(
emp_idno int,
emp_fname varchar(20),
emp_lname varchar(20),
emp_dept int
)

insert into emp_details values
(127323, 'Michale', 'Robbin', 57),
(526689, 'Carlos', 'Snares', 63),
(843795, 'Enric', 'Dosio', 57),
(328717, 'Jhon', 'Snares', 63),
(444527, 'Joseph', 'Dosni', 47),
(659831, 'Zanifer', 'Emily', 47),
(847674, 'Kuleswar', 'Sitaraman', 57),
(748681, 'Henrey', 'Gabriel', 47),
(555935, 'Alex', 'Manuel', 57),
(539569, 'George', 'Mardy', 27),
(733843, 'Mario', 'Saule', 63),
(631548, 'Alan', 'Snappy', 27),
(839139, 'Maria', 'Foster', 57)


-- Exercise 1 -- (Display All Salespeople)

select * from salesman

--Exercise 2 -- (Display a Custom String)

select 'This is SQL Exercise, Practise and Solution'


-- Exercise 3 -- (Display Three Numbers)

select 1,2,3

-- Exercise 4 -- (Sum of Two Numbers)

select 10+15

-- Exercise 5 -- (Arithmetic Expression Result)

select 10+15-3*2

-- Exercise 6 -- (Specific Columns of Salespeople)

select name, comission from salesman

-- Exercise 7 -- (Custom Column Order in Orders)

select ord_date, salesman_id, ord_no, purch_amt from orders

-- Exercise 8 -- (Unique Salespeople IDs)

select distinct salesman_id from orders

-- Exercise 9 -- (Salespeople in Paris)

select name,city from salesman 
where city = 'Paris'

-- Exercise 10 -- (Customers with Grade 200)

--From the following table, write a SQL query to find customers whose grade is 200. Return customer_id, cust_name, city, grade, salesman_id.  

select * from customer
where grade = 200

-- Exercise 11 -- (Orders by Salesperson 5001)

-- From the following table, write a SQL query to find orders that are delivered by a salesperson with ID. 5001. Return ord_no, ord_date, purch_amt.  

select ord_no, ord_date, purch_amt from orders
where salesman_id = 5001

-- Exercise 12 -- (Nobel Winner of 1970)

-- From the following table, write a SQL query to find the Nobel Prize winner(s) for the year 1970. Return year, subject and winner. 

select year, subject, winner from nobel_win
where year = 1970

-- Exercise 13 -- (Literature Winner 1971)

-- From the following table, write a SQL query to find the Nobel Prize winner in ‘Literature’ for 1971. Return winner. 

select winner from nobel_win
where subject = 'Literature' and year = 1971

-- Exercise 14 -- (Locate Dennis Gabor)

-- From the following table, write a SQL query to locate the Nobel Prize winner ‘Dennis Gabor'. Return year, subject. 

select year, subject from nobel_win
where winner = 'Dennis Gabor'

-- Exercise 15 -- (Physics Winners Since 1950)

--From the following table, write a SQL query to find the Nobel Prize winners in the field of ‘Physics’ since 1950. Return winner. 

select winner from nobel_win
where subject = 'Physics' and year > 1950

-- Exercise 16 -- (Chemistry Winners (1965-1975))

-- From the following table, write a SQL query to find the Nobel Prize winners in ‘Chemistry’ between the years 1965 and 1975. 
-- Begin and end values are included. Return year, subject, winner, and country.  

select year, subject, winner, country from nobel_win 
where subject = 'Chemistry' and year between 1965 and 1975

-- Exercise 17 -- (Prime Ministers After 1972)

-- Write a SQL query to display all details of the Prime Ministerial winners after 1972 of Menachem Begin and Yitzhak Rabin.  

select * from nobel_win
where category = 'Prime Minister'

-- Exercise 18 -- (Winners with First Name Louis)

-- From the following table, write a SQL query to retrieve the details of the winners whose first names match with the string ‘Louis’. 
-- Return year, subject, winner, country, and category. 

select * from nobel_win
where winner like 'Louis%'

-- Exercise 19 -- (Physics 1970 & Economics 1971)

-- From the following table, write a SQL query that combines the winners in Physics, 1970 and in Economics, 1971. 
-- Return year, subject, winner, country, and category. 

select * from nobel_win
where (subject = 'Physics' and year = 1970) or (subject = 'Economics' and year = 1971)

-- Exercise 20 -- (1970 Winners Excluding Physiology & Economics)

-- From the following table, write a SQL query to find the Nobel Prize winners in 1970 excluding the subjects of Physiology and Economics. 
-- Return year, subject, winner, country, and category.

select * from nobel_win
where year = 1970 and subject not in ('Physiology', 'Economics')

-- Exercise 21 -- (Physiology Before 1971 & Peace After 1974)

-- From the following table, write a SQL query to combine the winners in 'Physiology' before 1971 and winners in 'Peace' on or after 1974. 
-- Return year, subject, winner, country, and category.

select * from nobel_win
where (year < 1971 and subject = 'Physiology') or (year > 1974 and subject = 'Peace')

-- Exercise 22 -- (Details of Johannes Georg Bednorz)

-- From the following table, write a SQL query to find the details of the Nobel Prize winner 'Johannes Georg Bednorz'. 
-- Return year, subject, winner, country, and category. 

select * from nobel_win
where winner = 'Johannes Georg Bednorz'

-- Exercise 23 -- (Winners Excluding Subjects Starting with P)

-- From the following table, write a SQL query to find Nobel Prize winners for the subject that does not begin with the letter 'P'. 
--Return year, subject, winner, country, and category. Order the result by year, descending and winner in ascending. 

select * from nobel_win
where subject not like 'P%'
order by year desc, winner

-- Exercise 24 -- (Ordered 1970 Nobel Prize Winners)

-- From the following table, write a SQL query to find the details of 1970 Nobel Prize winners. 
-- Order the results by subject, ascending except for 'Chemistry' and ‘Economics’ which will come at the end of the result set. 
-- Return year, subject, winner, country, and category.  

select * from nobel_win
where year = 1970
order by (case
			when subject in ('Chemistry', 'Economics') then 1
			else 0
		  end), subject

-- Exercise 25 -- (Products in Price Range Rs.200-600)

-- From the following table, write a SQL query to select a range of products whose price is in the range Rs.200 to Rs.600. 
-- Begin and end values are included. Return pro_id, pro_name, pro_price, and pro_com.  

select * from item_mast
where pro_price between 200 and 600

-- Exercise 26 -- (Average Price for Manufacturer Code 16)

-- From the following table, write a SQL query to calculate the average price for a manufacturer code of 16. Return avg

select avg(pro_price) as average
from item_mast
where pro_com = 16

-- Exercise 27 -- (Display Item Name and Price)

-- From the following table, write a SQL query to display the pro_name as 'Item Name' and pro_price as 'Price in Rs.'  

select pro_id, pro_name as 'item name', pro_price as 'price in rs', pro_com from item_mast

-- Exercise 28 -- (Items with Price >= $250)

-- From the following table, write a SQL query to find the items whose prices are higher than or equal to $250. 
-- Order the result by product price in descending, then product name in ascending. Return pro_name and pro_price.  

select pro_name, pro_price from item_mast
where pro_price >= 250
order by pro_price desc, pro_name

 -- Exercise 29 -- (Average Price per Company)

 -- From the following table, write a SQL query to calculate average price of the items for each company. Return average price and company code. 

 select pro_com, avg(pro_price) as average from item_mast
 group by pro_com

 -- Exercise 30 -- (Cheapest Item)

 -- From the following table, write a SQL query to find the cheapest item(s). Return pro_name and, pro_price. 

 select pro_name, pro_price from item_mast
 where pro_price = (select min(pro_price) as minimal from item_mast)

-- Exercise 31 -- (Unique Employee Last Names)

-- From the following table, write a SQL query to find the unique last name of all employees. Return emp_lname.

select distinct emp_lname from emp_details

-- Exercise 32 -- (Employees with Last Name Snares)

-- From the following table, write a SQL query to find the details of employees whose last name is 'Snares'. 
-- Return emp_idno, emp_fname, emp_lname, and emp_dept.  

select * from emp_details
where emp_lname = 'Snares'

-- Exercise 33 -- (Employees in Department 57)

-- From the following table, write a SQL query to retrieve the details of the employees who work in the department 57. 
-- Return emp_idno, emp_fname, emp_lname and emp_dept.

select * from emp_details
where emp_dept = 57