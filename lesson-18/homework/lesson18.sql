-- Exercise 1 (lvl_1) --

-- Find Employees with Minimum Salary
-- Retrieve employees who earn the minimum salary in the company.

select * from employees 
where salary = (select min(salary) min from employees)

-- Exercise 2 (lvl_1) --

-- Find Products Above Average Price
-- Retrieve products priced above the average price.

select product_name, price from products 
where price > (select avg(price) from products)

-- Exercise 3 (lvl_2) --

-- Find Employees in Sales Department
-- Retrieve employees who work in the "Sales" department.

select d.id, name, department_name from departments d, employees e
where d.id = e.department_id and d.department_name = 'sales'

-- Exercise 4 (lvl_2) --

-- Find Customers with No Orders
-- Retrieve customers who have not placed any orders.

select customer_id, name from customers 
where customer_id not in (select customer_id from orders)

-- Exercise 5 (lvl_3) -- 

-- Find Products with Max Price in Each Category
-- Retrieve products with the highest price in each category.

select * from products p1
where price = (select max(price) from products p2 where p2.category_id = p1.category_id)
order by category_id

-- Exercise 6 (lvl_3) --

-- Find Employees in Department with Highest Average Salary
-- Retrieve employees working in the department with the highest average salary.

select e1.id, e1.name, d.department_name, e1.salary, e1.department_id from employees e1
join (select department_id, max(salary) maxgo from employees group by department_id) as e2
on e1.department_id = e2.department_id and e1.salary = e2.maxgo
join departments d
on e1.department_id = d.id
order by id

-- Exercise 7 (lvl_4) -- 

-- Find Employees Earning Above Department Average
-- Retrieve employees earning more than the average salary in their department.

select id, name, salary, department_id from employees e1
where salary > (select avg(salary) from employees e2
				where e2.department_id = e1.department_id)

-- Exercise 8 (lvl_ 4) -- 

-- Find Students with Highest Grade per Course
-- Task: Retrieve students who received the highest grade in each course.

select g.student_id, course_id, name, grade from grades g
join students s
on g.student_id = s.student_id
where grade = (select max(grade) from grades g2 where g.course_id = g2.course_id)
order by student_id

-- Exercise 9 (lvl_5) -- 

-- Find Third-Highest Price per Category
-- Task: Retrieve products with the third-highest price in each category.

select * from (select id, product_name, price, category_id, rank() over (partition by category_id order by price desc) as rank from products) ranked
where rank = 3

-- Exercise 10 (lvl_5) --

-- Find Employees Between Company Average and Department Max Salary
-- Task: Retrieve employees with salaries above the company average but below the maximum in their department.

select * from employees e1
where salary > (select avg(salary) from employees) and salary < (select max(salary) from employees e2 where e2.department_id = e1. department_id)

