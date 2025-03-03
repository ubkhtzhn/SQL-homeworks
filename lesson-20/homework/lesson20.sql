-- EASY TASKS (20) --

-- Exercise 1 --

-- Write a query to calculate the running total of SalesAmount for each product in the Sales table, ordered by SaleDate.

select *, sum(salesamount) over (partition by productid order by saledate rows between unbounded preceding and current row) running_total from sales

-- Exercise 2 --

-- Use the SUM() aggregate window function to calculate the cumulative sum of Amount for each customer in the Orders table.

select *, sum(OrderAmount) over (partition by customerid order by orderdate rows between unbounded preceding and current row) cumulative_sum from orders

-- Exercise 3 --

-- Write a query to find the running total of OrderAmount in the Orders table, partitioned by CustomerID.

select *,
		 sum(OrderAmount) over (partition by customerid order by orderdate 
								rows between unbounded preceding and current row) running_total
from orders

-- Exercise 4 --

-- Use the AVG() window function to calculate the average sales amount up to the current row for each product in the Sales table.

select *, avg(salesamount) over (partition by productid order by saledate 
								rows between unbounded preceding and current row) 
from sales

-- Exercise 5 --

-- Write a query to rank each order’s OrderAmount using the RANK() window function.

select *, rank() over (order by orderamount desc) rank from orders

-- Exercise 6 --

-- Use the LEAD() function to retrieve the next row's Amount for each product in the Sales table.

select *, lead(salesamount) over (partition by productid order by saledate) next from sales

-- Exercise 7 --

-- Write a query to calculate the total sales for each customer in the Orders table using the SUM() function as a window function.

select *, sum(OrderAmount) over (partition by customerid) sum from orders

-- Exercise 8 --

-- Use the COUNT() function to determine the number of orders placed up to the current row in the Orders table.

select *, count(orderid) over (order by orderdate rows between unbounded preceding and current row) count from orders

-- Exercise 9 --

-- Write a query to partition the Sales table by ProductCategory and calculate the running total of SalesAmount for each category.

select p.categoryid, p.productname, saledate, price, salesamount, sum(salesamount) over (partition by p.categoryid order by saledate rows between unbounded preceding and current row) running_total from sales s
join products p
on s.productid = p.ProductID

-- Exercise 10 --

-- Use ROW_NUMBER() to assign a unique rank to each order in the Orders table, ordered by OrderDate.

select *, row_number() over (order by orderdate) row_number from orders

-- Exercise 11 --

-- Write a query using LAG() to find the OrderAmount from the previous row for each order in the Orders table.

select *, lag(orderamount) over (order by orderdate) prev from orders

-- Exercise 12 --

-- Use NTILE(4) to divide products in the Products table into 4 equal groups based on Price.

select *, ntile(4) over (order by price) groups from products

-- Exercise 13 --

-- Write a query using SUM() to calculate the cumulative total of sales for each salesperson in the Sales table.

select 
    s.salesid, 
    s.salesperson_id, 
    s.productid, 
    sp.name as salesperson_name, 
    s.salesamount, 
    sum(s.salesamount) over (
        partition by s.salesperson_id 
        order by s.sales_date, s.salesid
    ) as cumulative_sales
from sales s
join salesperson sp on s.salesperson_id = sp.salesperson_id;


-- Exercise 14 --

-- Use DENSE_RANK() to rank the products in the Products table based on StockQuantity.

select *, dense_rank() over (order by stockquantity desc) rank from products

-- Exercise 15 --

-- Write a query to compute the difference between the current and next OrderAmount in the Orders table using LEAD().

select *, orderamount - lead(orderamount) over (order by orderdate) diff from orders

-- Exercise 16 --

-- Use RANK() to assign a rank to products in the Products table, ordered by Price.

select *, rank() over (order by price desc) rank from products 

-- Exercise 17 --

-- Write a query using AVG() to calculate the average order amount for each customer in the Orders table.

select *, avg(orderamount) over (partition by customerid) avg from orders

-- Exercise 18 --

-- Use ROW_NUMBER() to assign a unique row number to each employee in the Employees table, ordered by Salary.

select *, row_number() over (order by salary desc) row_number from Employees

-- Exercise 19 --

-- Write a query to partition the Sales table by StoreID and calculate the cumulative sum of SalesAmount for each store.

select sl.salesid, sl.storeid, st.storename, sl.salesamount, sl.salesdate, sum(salesamount) over (partition by sl.storeid order by sl.salesdate, sl.salesid) cumulative_sum
from sales sl
join stores st
on sl.storeid = st.storeid

-- Exercise 20 --

-- Use LAG() to find the previous order's OrderAmount in the Orders table.

select *, lag(OrderAmount) over (order by orderdate) prev from orders

-- MEDIUM TASKS (20) --

-- Exercise 1 --

-- Write a query using SUM() to calculate the cumulative sum of SalesAmount for each employee in the Sales table.

select salesid, productid, saledate, salesamount, sum(salesamount) over (partition by salesid order by saledate) cumulative_sum from sales

-- Exercise 2 --

-- Use LEAD() to calculate the difference in OrderAmount between the current row and the next row in the Orders table.

select orderid, customerid, orderdate, orderamount, lead(orderamount) over (order by orderdate, orderid) - orderamount difference from orders

-- Exercise 3 --

-- Write a query to find the top 5 products based on SalesAmount using ROW_NUMBER() in the Sales table.

with rating as (
select salesid, productid, saledate, salesamount, row_number() over (order by salesamount desc) row_number from sales)

select * from rating
where row_number <= 5

-- Exercise 4 --

-- Use RANK() to determine the products with the top 10 sales in the Products table, ordered by SalesAmount.

with ranked as(
select p.productid, s.salesid, p.productname, p.price, s.salesamount, rank() over (order by salesamount desc, p.productid) rank from products p
join sales s
on s.productid = p.productid)

select * from ranked
where rank <=10

-- Exercise 5 --

-- Write a query using COUNT() to calculate the number of orders per product in the Sales table.

select p.productid, p.productname, count(s.salesid) count from products p
join sales s
on p.productid = s.productid
group by p.productid, p.productname

-- Exercise 6 --

-- Write a query using SUM() to calculate the running total of SalesAmount for each ProductCategory.

select *, sum(salesamount) over (partition by productid order by saledate, salesid) running_total from sales

-- Exercise 7 --

-- Use DENSE_RANK() to rank employees in the Employees table by Salary within each DepartmentID.

select *, dense_rank() over (partition by departmentid order by salary desc) rank from employees

-- Exercise 8 --

-- Write a query to calculate the moving average of SalesAmount for each product in the Sales table.

select *, avg(salesamount) over (partition by productid order by saledate, salesid) moving_avg from sales

-- Exercise 9 --

-- Use NTILE(3) to divide products in the Products table into 3 groups based on their Price.

select 
		productid,
		productname,
		price,
		ntile(3) over (order by price desc) groups 
from products

-- Exercise 10 --

-- Write a query using LAG() to find the previous SalesAmount for each employee’s sale.

select 
	  salesid,
	  salesamount,
	  productid,
	  saledate,
	  lag(salesamount) over (partition by productid order by saledate, salesid) prev
from sales

-- Exercise 11 --

-- Write a query to compute the cumulative sum of SalesAmount for each salesperson, ordered by SaleDate.

select 
	  salesid,
	  salespersonid,
	  saledate,
	  salesamount,
	  sum(salesamount) over (partition by salespersonid order by saledate, salesid) cumulative_Sum
from sales

-- Exercise 12 --

-- Use LEAD() to retrieve the SalesAmount of the next sale for each product in the Sales table.

select 
	  salesid,
	  productid,
	  saledate,
	  salesamount,
	  lead(salesamount) over (partition by productid order by saledate, salesid) next
from sales

-- Exercise 13 --

-- Write a query to calculate the moving sum of SalesAmount for each product in the Products table using a window function.

select 
	  salesid,
	  p.productid,
	  p.productname,
	  salesamount,
	  sum(salesamount) over (partition by p.productid 
	  order by saledate, salesid 
	  rows between 1 preceding and current row) moving_sum
from sales s
join products p
on s.productid = p.productid

-- Exercise 14 --

-- Use RANK() to identify the employees with the top 3 salaries in the Employees table.

with ranked as (
select 
	  employeeid,
	  departmentid,
	  employeename,
	  salary,
	  rank() over (order by salary desc) rank
from employees)

select * from ranked 
where rank <= 3

-- Exercise 15 --

-- Write a query using AVG() to calculate the average order amount for each customer in the Orders table.

select 
	  customerid,
	  avg(orderamount) avg
from orders
group by customerid

-- Exercise 16 --

-- Use ROW_NUMBER() to assign a unique row number to orders in the Orders table, ordered by OrderDate.

select 
	  orderid, 
	  customerid,
	  orderdate,
	  orderamount,
	  row_number() over (order by orderdate, orderid) row_number
from orders

-- Exercise 17 --

-- Write a query using SUM() to calculate the running total of SalesAmount for each employee in the Sales table, partitioned by DepartmentID.

select 
	  e.employeeid,
	  e.departmentid, 
	  e.employeename,
	  s.saledate,
	  s.salesamount,
	  sum(salesamount) over (partition by s.departmentid order by saledate, salesid) running_total
from sales s
join employees e
on s.employeeid = e.employeeid

-- Exercise 18 --

-- Use NTILE(5) to divide the employees in the Employees table into 5 equal groups based on their Salary.

select 
	  employeeid,
	  departmentid,
	  firstname,
	  lastname,
	  salary,
	  ntile(5) over (order by salary desc) groups
from employees

-- Exercise 19 --

-- Write a query to calculate both the cumulative sum of SalesAmount and the total sales for each product in the Sales table.

select
	  salesid,
	  productid,
	  saledate,
	  salesamount,
	  sum(salesamount) over (partition by productid order by saledate, salesid) cumulative_sum,
	  sum(salesamount) over (partition by productid) total_sum
from sales

-- Exercise 20 --

-- Use DENSE_RANK() to identify the products with the top 5 highest SalesAmount in the Sales table.

with ranked as (
select 
	  salesid,
	  productid,
	  saledate,
	  salesamount,
	  dense_rank() over (order by salesamount desc) rank
from sales)

select * from ranked
where rank <=5

-- DIFFICULT TASKS (20) --

-- Exercise 1 --

-- Write a query using SUM() to calculate the running total of SalesAmount for each product and store in the Sales table.

select 
	  s.salesid, 
	  s.storeid, 
	  s.productid, 
	  st.storename, 
	  p.productname, 
	  s.salesamount, 
	  sum(s.salesamount) over (partition by s.productid, s.storeid order by s.saledate, salesid) running_total
from sales s
join products p
on s.productid = p.productID
join stores st
on s.storeid = st.storeid

-- Exercise 2 --

-- Use LEAD() to calculate the percentage change in OrderAmount between the current and next row in the Orders table.

select 
	   orderid,
	   orderdate,
	   orderamount,
	   round(
	   ((((lead(orderamount) over (order by orderdate, orderid))/nullif(orderamount, 0)) - 1)*100.0), 0) percent_change 
from orders

-- Exercise 3 --

-- Write a query using ROW_NUMBER() to return the top 3 products by SalesAmount, ensuring ties are handled appropriately.

with ranked as (
select 
	  salesid,
	  employeeid,
	  productid,
	  saledate,
	  salesamount,
	  row_number() over (order by salesamount desc) row_number
from sales)

select * from ranked
where row_number <=3 or salesamount in (select salesamount from ranked where row_number = 3)

-- Exercise 4 --

-- Use RANK() to assign a rank to each employee in the Employees table based on Salary, partitioned by DepartmentID.

select 
	  employeeid,
	  departmentid,
	  firstname,
	  lastname,
	  salary,
	  rank() over (partition by departmentid order by salary desc) rank
from employees

-- Exercise 5 --

-- Write a query to find the top 10% of orders in the Orders table based on OrderAmount using the NTILE() function.

with ranked as (
select
	  orderid,
	  customerid,
	  orderdate,
	  orderamount,
	  ntile(10) over (order by orderamount desc) ranking
from orders)

select * from ranked
where ranking = 1 or  orderamount in (select orderamount from ranked where ranking = 1)

-- Exercies 6 --

-- Use LAG() to calculate the change in SalesAmount between the previous and current sale for each product in the Sales table.

select 
	  salesid,
	  employeeid,
	  productid,
	  saledate,
	  salesamount,
	  salesamount - lag(salesamount) over (partition by productid order by saledate, salesid) as diff
from sales

-- Exercise 7 --

-- Write a query to compute the cumulative average of SalesAmount for each product, ordered by SaleDate.

select 
	  salesid, 
	  productid,
	  saledate,
	  salesamount,
	  avg(salesamount) over (partition by productid order by saledate, salesid) cumulative_avg
from sales

-- Exercise 8 --

-- Use DENSE_RANK() to identify the products with the top 5 highest SalesAmount in the Products table, ignoring ties.

with ranked as (
select 
	  s.productid, 
	  p.productname, 
	  s.salesamount, 
	  dense_rank() over (order by salesamount desc) rank 
from sales s
join products p
on s.productid = p.productid)

select * from ranked 
where rank <=5

-- Exercise 9 --

-- Write a query to partition the Sales table by ProductCategory and calculate the running total of SalesAmount for each category.

select 
	  s.productid, 
	  s.categoryid, 
	  p.categoryname, 
	  s.saledate, 
	  s.salesamount, 
	  sum(salesamount) over (partition by s.categoryid order by s.saledate, s.salesid) running_total 
from sales s
join productcategories p
on s.categoryid = p.categoryid

-- Exercise 10 --

-- Use both LEAD() and LAG() together to find the difference in OrderAmount between the previous and next rows in the Orders table.

select 
	  orderid, 
	  orderdate, 
	  orderamount, 
	  lead(orderamount) over (order by orderdate, orderid) - lag(orderamount) over (order by orderdate, orderid)  diff 
from orders

-- Exercise 11 --

-- Write a query using SUM() to calculate the cumulative total of SalesAmount for each salesperson, ordered by SaleDate.

select 
	  s1.salespersonid, 
	  s2.salespersonname, 
	  s1.saledate, 
	  s1.salesamount, 
	  sum(s1.salesamount) over (partition by s1.salespersonid order by saledate, salesid) cumulative_sum 
from sales s1
join salespersons s2
on s1.salespersonid = s2.salespersonid

-- Exercise 12 --

-- Use NTILE(10) to divide the products in the Products table into 10 groups based on Price.

select 
	  productid, 
	  productname, 
	  price, 
	  ntile(10) over (order by price desc) groups
from products

-- Exercise 13 --

-- Write a query to compute the moving average of OrderAmount in the Orders table using AVG() and an appropriate window frame.

select 
	  orderid,
	  orderdate,
	  orderamount,
	  avg(orderamount) over (order by orderdate, orderid rows between 1 preceding and current row) moving_avg 
from orders

-- Exercise 14 --

-- Use ROW_NUMBER() to rank employees by Salary within each department in the Employees table.

select 
	  employeeid, 
	  departmentid, 
	  firstname, 
	  lastname, 
	  salary, 
	  row_number() over (partition by departmentid order by salary desc) salary_rank 
from employees

-- Exercise 15 --

-- Write a query using COUNT() to calculate the number of orders per customer in the Orders table.

select 
	  customerid, 
	  count(orderid) number_of_orders 
from orders
group by CustomerID

-- Exercise 16 --

-- Use RANK() to identify the products with the top 3 highest sales numbers in the Sales table, considering ties.

with ranked as (
select 
	   salesid,
	   productid,
	   saledate, 
	   salesamount, 
	   rank() over (order by salesamount desc) rank_by_sales 
from sales)

select * from ranked
where rank_by_sales <= 3

-- Exercise 17 --

-- Write a query to compute the cumulative sales total for each employee and product in the Sales table.

select *, sum(salesamount) over (partition by employeeid, productid order by saledate, salesid) cumulative_sum from sales

-- Exercise 18 --

-- Use DENSE_RANK() to identify the employees with the highest sales within each department in the Sales table.

with ranked as (
select *, dense_rank() over (partition by departmentid order by salesamount desc) rank from sales)

select * from ranked 
where rank = 1

-- Exercise 19 --

-- Write a query to partition the Sales table by StoreID and calculate the cumulative total of SalesAmount for each store.

select *, sum(salesamount) over (partition by storeid order by saledate, salesid) cumulative_total from sales

-- Exercise 20 --

-- Use LAG() to calculate the difference in SalesAmount for each product between the previous and current sale in the Sales table.

select *, salesamount - isnull(lag(salesamount) over (partition by productid order by saledate, salesid), 0) diff from sales
