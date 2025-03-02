-- EASY TASKS (20) --

-- Exercise 1 --

-- Write a query to assign a row number to each employee in the Employees table ordered by their Salary.

select *, rank() over (order by salary) rank from employees

-- Exercise 2 --

-- Create a query to rank all products based on their Price in descending order.

select *, rank() over (order by price desc) rank from products

-- Exercise 3 --

-- Use the DENSE_RANK() function to rank employees by Salary in the Employees table.

select *, DENSE_RANK() over (order by salary) rank from employees

-- Exercise 4 --

-- Write a query to display the next (lead) salary for each employee in the same department using the LEAD() function.

select *, lead(salary) over (partition by departmentid order by salary) as next_salary from employees

-- Exercise 5 --

-- Use ROW_NUMBER() to assign a unique number to each order in the Orders table.

select *, row_number() over (order by orderdate) as row_number from orders

-- Exercise 6 --

-- Create a query using RANK() to identify the highest and second-highest salaries in the Employees table.

select * from (select *, rank() over (order by salary desc) rank from employees) as emp
where rank in (1,2)

-- Exercise 7 --

-- Write a query to show the previous (lagged) salary for each employee in the Employees table using the LAG() function.

select *, lag(salary) over (order by salary) prev_salary from employees

-- Exercise 8 --

-- Use NTILE(4) to divide employees into 4 groups based on their Salary.

select *, ntile(4) over (order by salary) as quartile from employees

-- Exercise 9 --

-- Write a query to partition employees by DepartmentID and assign a row number within each department.

select *, ROW_NUMBER() over (partition by departmentid order by salary) row_number from employees

-- Exercise 10 --

-- Use DENSE_RANK() to rank products by Price in ascending order.

select *, DENSE_RANK() over (order by price) dense_rank from products

-- Exercise 11 --

-- Write a query to calculate the moving average of Price in the Products table using window functions.

select *, avg(price) over (order by price rows between 1 preceding and current row) [moving average] from products

-- Exercise 12 --

-- Use the LEAD() function to display the salary of the next employee for each row in the Employees table.

select *, lead(salary) over (order by salary) as next_salary from employees

-- Exercise 13 --

-- Create a query to compute the cumulative sum of SalesAmount in the Sales table.

select *, sum(salesamount) over(order by saledate) [cumulative sum] from sales

-- Exercise 14 -- 

-- Use ROW_NUMBER() to identify the top 5 most expensive products in the Products table.

select top 5 *, ROW_NUMBER() over (order by price desc) row_number from products

-- Exercise 15 --

-- Write a query to partition the Orders table by CustomerID and calculate the total OrderAmount per customer.

select *, sum(orderamount) over (partition by customerid) sum from orders

-- Exercise 16 --

-- Use RANK() to rank orders in the Orders table based on their OrderAmount.

select *, rank() over (order by orderamount) rank from orders

-- Exercise 17 -- 

-- Write a query to compute the percentage contribution of SalesAmount by ProductCategory in the Sales table.

select *, (salesamount*100)/sum(salesamount) over (partition by productid order by salesamount) [compute percentage] from sales

-- Exercise 18 --

-- Use the LEAD() function to retrieve the next order date for each order in the Orders table.

select *, lead(orderdate) over (order by orderdate) [next date] from orders

-- Exercise 19 --

-- Write a query using NTILE(3) to divide employees into 3 groups based on their Age.

select *, ntile(3) over (order by age) [ntile] from employees

-- Exercise 20 --

-- Use ROW_NUMBER() to list the most recently hired employees from the Employees table.

select *, ROW_NUMBER() over (order by hire_date desc) [row number] from employees

-- MEDIUM TASKS (20) --

-- Exercise 1 --

-- Write a query to compute the cumulative average salary of employees, ordered by Salary.

select *, avg(salary) over (order by salary rows between unbounded preceding and current row) [cumulative avg] from Employees

-- Exercise 2 --

-- Use RANK() to rank products by their total sales while handling ties appropriately.

select productid, sum(salesamount) as total_amount, rank() over (order by sum(salesamount) desc) as sales_rank from sales
group by productid

-- Exercise 3 --

-- Create a query to retrieve the previous order's date for each order in the Orders table using the LAG() function.

select *, lag(orderdate) over (order by orderdate) prev_date from orders

-- Exercise 4 --

-- Write a query to calculate the moving sum of Price for products with a window frame of 3 rows.

select *, sum(price) over (order by price rows between 2 preceding and current row) moving_sum from Products

-- Exercise 5 --

-- Use NTILE(4) to assign employees to four salary ranges and display each employee's salary range.

select *, ntile(4) over (order by salary) range from Employees

-- Exercise 6 --

-- Write a query to partition the Sales table by ProductID and calculate the total SalesAmount per product.

select *, sum(SalesAmount) over (partition by productid) [total_salesamount] from sales

-- Exercise 7 --

-- Use DENSE_RANK() to rank products by StockQuantity without gaps in the ranking.

select *, DENSE_RANK() over (order by StockQuantity) rank from Products

-- Exercise 8 --

-- Create a query using ROW_NUMBER() to identify the second highest salary in each department.

select * from departments
select * from Employees

select e.*, d.departmentname from departments d
join (select *, row_number() over (partition by departmentid order by salary) as row_number from Employees) e
on e.DepartmentID = d.departmentid
where row_number = 2

-- Exercise 9 --

-- Write a query to calculate the running total of sales for each product in the Sales table.

select *, sum(SalesAmount) over (partition by productid order by saledate rows between unbounded preceding and current row) running_total from sales

-- Exercise 10 --

-- Use LEAD() to display the SalesAmount of the next row for each employee’s sale in the Sales table.

select *, lead(SalesAmount) over (order by salesamount) next_salesamount from sales

-- Exercise 11 --

-- Use RANK() to determine the highest earners within each department.

select * from (select *, rank() over (partition by departmentid order by salary) rank from Employees) as emp
where rank = 1

-- Exercise 12 --

-- Write a query to partition employees by DepartmentID and rank them by salary.

select *, rank() over (partition by departmentid order by salary) rank from Employees

-- Exercise 13 --

-- Use NTILE(5) to divide products into five groups based on their Price.

select *, ntile(5) over (order by price) ntile from Products

-- Exercise 14 -- 

-- Write a query to calculate the difference between each employee's salary and the highest salary in their department.

select e.EmployeeID, e.DepartmentID, e.EmployeeName, e.Salary, emp.max - salary as difference from Employees e
join (select departmentid, max(salary) max from Employees group by departmentid) as emp
on e.DepartmentID = emp.DepartmentID
order by departmentid, Salary desc

-- Exercise 15 --

-- Use LAG() to display the previous product's SalesAmount for each sale.

select salesid, productid, saledate, salesamount, lag(salesamount) over (order by saledate) prev_salesamount from Sales

-- Exercise 16 --

-- Write a query to calculate the cumulative sum of OrderAmount for each customer in the Orders table.

select *, sum(orderamount) over (partition by customerid order by orderdate rows between unbounded preceding and current row) cumulative_sum from orders

-- Exercise 17 --

-- Use ROW_NUMBER() to identify the 3rd most recent order for each customer in the Orders table.

select * from (select *, row_number() over (partition by customerid order by orderdate desc) [row_number] from orders) ord
where row_number = 3

-- Exercise 18 --

-- Write a query to partition employees by DepartmentID and rank them by their HireDate within each department.

select *, rank() over (partition by departmentid order by hiredate desc) from Employees

-- Exercise 19 --

-- Use DENSE_RANK() to find the 3rd highest Salary in each department from the Employees table.

select * from (select *, DENSE_RANK() over (partition by departmentid order by salary desc) dense_rank from Employees) emp
where dense_rank = 3

-- Exercise 20 --

-- Create a query using LEAD() to calculate the difference in OrderDate between consecutive orders.

select *, DATEDIFF(day, OrderDate, ord_date) difference from (select *, lead(orderdate) over (order by orderdate) ord_date from orders) ord


-- DIFFICULT TASKS (20) --

-- Exercise 1 --

-- Write a query using RANK() to rank products by their sales (handling ties) but exclude the top 10% of products by sales.

select * from (select p.ProductID, ProductName, Price, SalesAmount, SalesID, SaleDate, rank() over (order by salesamount desc) top10, count(*) over() tot from Products p
join sales s
on p.ProductID = s.ProductID) as spf
where top10 > 0.1 * tot

-- Exercise 2 --

-- Use ROW_NUMBER() to list employees with over 5 years of service, ordered by their HireDate.

select * from (select *, DATEDIFF(YEAR, hiredate, GETDATE()) experience, ROW_NUMBER() over (order by hiredate) row_n from Employees) emp
where experience > 5

-- Exercise 3 --

-- Write a query using NTILE(10) to divide employees into 10 groups based on Salary and display each employee's group number.

select *, ntile(10) over (order by salary) nt from employees

-- Exercise 4 --

-- Use the LEAD() function to calculate the next SalesAmount for each sale by an employee and compare it with the current sale.

select *, next - salesamount [difference]  from (select *, lead(SalesAmount) over (partition by employeeid order by salesamount) next from sales) as s

-- Exercise 5 --

-- Write a query to partition products by CategoryID and compute the average Price for each category.

select *, avg(price) over (partition by categoryid) avg_price from Products

-- Exercise 6 --

-- Use RANK() to determine the top 3 most-sold products and display their rankings, including handling ties.
with rankedproducts as (
select top 3 p.ProductID, productname, price, s.quantitysold, sum(quantitysold) total_sum, rank() over (order by quantitysold desc) rank from Products p
join Sales s
on p.ProductID = s.ProductID
group by p.ProductID, productname, price, s.quantitysold)

select * from rankedproducts
where rank <= 3

-- Exercise 7 --

-- Create a query using ROW_NUMBER() to list the top 5 highest-paid employees from each department.

with row_number_pr as (
select EmployeeID, e.DepartmentID, EmployeeName, Salary, DepartmentName, row_number() over (partition by e.departmentid order by salary desc) row_number from Employees e
join Departments d
on e.DepartmentID = d.DepartmentID
)

select * from row_number_pr
where row_number <= 5
order by departmentid, salary desc

-- Exercise 8 --

-- Write a query to compute the moving average of sales over a 5-day window using both LEAD() and LAG() functions.

select SaleID, s.ProductID, ProductName, SaleDate, Price, QuantitySold, 
(quantitysold +
coalesce(lag(quantitysold, 1) over (order by saledate), 0)+
coalesce(lag(quantitysold, 2) over (order by saledate), 0)+
coalesce(lead(quantitysold, 1) over (order by saledate), 0)+
coalesce(lead(quantitysold, 2) over (order by saledate), 0)
)/5 as moving_avg from sales s
join products p
on s.ProductID = p.ProductID

-- Exercise 9 --

-- Use DENSE_RANK() to find the products with the top 5 highest sales figures, ensuring no gaps in the ranking.

with salesrank as (select p.productid, p.productname, s.quantitysold, p.price, s.saledate, dense_rank() over (order by s.quantitysold desc) highest_sales from products p
join sales s
on p.productid = s.productid)

select * from salesrank
where highest_sales <=5

-- Exercise 10 --

-- Write a query using NTILE(4) to partition orders by OrderAmount into four quartiles and display the quartile for each order.

select *, ntile(4) over (order by orderamount) quartile from orders

-- Exercise 11 --

-- Use ROW_NUMBER() to assign a unique sequence to each order in the Orders table and display the rank within each CustomerID.

select *, row_number() over (partition by customerid order by orderamount) row_number from orders

-- Exercise 12 --

-- Write a query to partition employees by DepartmentID and calculate the total number of employees in each department.

select d.DepartmentID, d.DepartmentName, count(employeeid) number_of_employees from Employees e
join departments d
on e.departmentid = d.departmentid
group by d.DepartmentID, d.DepartmentName

-- Exercise 13 --

-- Use RANK() to list the top 3 highest salaries and the bottom 3 salaries within each department.

with ranked as(
select e.employeeid, e.departmentid, e.employeename, d.departmentname, e.salary, rank() over (partition by e.departmentid order by salary desc) rank, 
rank() over (partition by e.departmentid order by salary) rank2 from employees e
join departments d
on e.departmentid = d.departmentid)

select employeeid, departmentid, employeename, departmentname, salary, case
			when rank <= 3 then 'highest 3 salaries' 
			when rank2 <= 3 then 'lowest 3 salaries'
			else 'other'
		  end as top_3_highest_and_lowest
from ranked
where rank <= 3 or rank2 <= 3
order by departmentid, salary desc

-- Exercise 14 -- 

-- Create a query using LAG() to calculate the percentage change in SalesAmount from the previous sale for each employee.

with tablego as 
(select e.employeeid, e.employeename, s.saledate, s.salesamount, lag(salesamount) over (partition by e.employeeid order by s.saledate) prev from employees e
join sales s
on e.EmployeeID = s.employeeid)

select employeeid, employeename, saledate, case
											when salesamount > prev or salesamount < prev then ((salesamount / prev)-1)*100 
											when salesamount = prev then 0
											else null
											end
											procent_change
from tablego

-- Exercise 15 -- 

-- Write a query to compute both the cumulative sum and cumulative average of sales for each product in the Sales table.

select *, sum(salesamount) over (partition by productid order by saledate rows between unbounded preceding and current row) cum_sum,
avg(salesamount) over (partition by productid order by saledate rows between unbounded preceding and current row) cum_avg
from sales

-- Exercise 16 --

-- Use NTILE(3) to rank employees by Age and display the distribution of age groups across the company.

select *, ntile(3) over (order by age) ntile from employees

-- Exercise 17 --

-- Write a query using ROW_NUMBER() to identify the top 10 employees with the highest sales, sorted by SalesAmount.

with rt as (
select e.employeeid, e.departmentid, e.employeename, s.saledate, s.salesamount, row_number() over (order by salesamount desc) rating from employees e
join sales s
on e.employeeID = s.employeeid)

select * from rt
where rating <=10

-- Exercise 18 -- 

-- Use LEAD() to calculate the difference between each product's Price and the Price of the subsequent product in the Products table.

select *, price - lead(price) over (order by productid) difference from Products

-- Exercise 19 --

-- Create a query using DENSE_RANK() to rank employees based on a performance score and generate a performance report.

select e.employeeid, e.departmentid, e.employeename, p.reviewdate, p.performancescore, dense_rank() over (order by p.performancescore desc) performance_report from employees e
join performance p
on e.EmployeeID = p.employeeid

-- Exercise 20 --

-- Write a query using both LAG() and LEAD() to determine the difference in SalesAmount for each product relative to the previous and next orders in the Orders table.

select *, orderamount - lag(orderamount) over (order by orderdate) diff_prev,  lead(orderamount) over (order by orderdate) diff_next from orders
