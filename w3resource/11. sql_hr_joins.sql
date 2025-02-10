-- Exercise 1 --

-- From the following tables, write a SQL query to find the first name, last name, department number, and department name for each employee.

select e.first_name, e.last_name, d.department_id, d.department_name from hr.departments d
join hr.employees e 
on d.department_id = e.department_id

-- Exercise 2 --

-- From the following tables, write a SQL query to find the first name, last name, department, city, and state province for each employee.

select first_name, last_name, department_name, city, state_province from hr.employees e
join hr.departments d
on e.department_id = d.department_id
join hr.locations l
on d.location_id = l.location_id

-- Exercise 3 --

-- From the following table, write a SQL query to find the first name, last name, salary, and job grade for all employees.

select first_name, last_name, salary, grade_level from hr.employees e
join hr.job_grades g
on e.salary between g.lowest_sal and g.highest_sal

-- Exercise 4 --

-- From the following tables, write a SQL query to find all those employees who work in department ID 80 or 40. 
-- Return first name, last name, department number and department name.

select first_name, last_name, e.department_id, department_name from hr.employees e
join hr.departments d
on e.department_id = d.department_id and e.department_id in (40, 80)

-- Exercise 5 --

-- From the following tables, write a SQL query to find those employees whose first name contains the letter ‘z’. 
-- Return first name, last name, department, city, and state province.

select first_name, last_name, department_name, city, state_province from hr.employees e
join hr.departments d
on e.department_id = d.department_id
join hr.locations l
on d.location_id = l.location_id
where first_name like '%z%'

-- Exercise 6 --

-- From the following tables, write a SQL query to find all departments, including those without employees. Return first name, last name, department ID, department name.

select coalesce(first_name, 'unknown'), coalesce(last_name, ''), d.department_id, department_name from hr.departments d
left join hr.employees e
on d.department_id = e.department_id
order by d.department_id 

-- Exercise 7 --

-- From the following table, write a SQL query to find the employees who earn less than the employee of ID 182. Return first name, last name and salary.

select first_name, last_name, salary from hr.employees
where salary > (select salary from hr.employees where employee_id = 182)
order by salary

-- Exercise 8 --

-- From the following table, write a SQL query to find the employees and their managers. Return the first name of the employee and manager.

select e2.first_name [employee name], e1.first_name [manager name] from hr.employees e1
join hr.employees e2
on e1.employee_id = e2.manager_id

-- Exercise 9 --

-- From the following tables, write a SQL query to display the department name, city, and state province for each department.

select * from hr.departments
select * from hr.locations

select department_name, city, state_province from hr.departments d
join hr.locations l
on d.location_id = l.location_id

-- Exercise 10 --

-- From the following tables, write a SQL query to find out which employees have or do not have a department. Return first name, last name, department ID, department name.

select * from hr.departments
select * from hr.employees

select first_name, last_name, e.department_id, department_name from hr.employees e
join hr.departments d
on e.department_id = d.department_id

-- Exercise 11 --

-- From the following table, write a SQL query to find the employees and their managers. 
-- Those managers do not work under any manager also appear in the list. Return the first name of the employee and manager.

select e1.first_name [employee name], e2.first_name [manager name] from hr.employees e1
join hr.employees e2
on e2.employee_id = e1.manager_id

-- Exercise 12 --

-- From the following tables, write a SQL query to find the employees who work in the same department as the employee with the last name Taylor. 
-- Return first name, last name and department ID.

select first_name, last_name, department_id from hr.employees
where department_id in 
(select department_id from hr.employees where last_name = 'Taylor')

-- Exercise 13 --

-- From the following tables, write a SQL query to find all employees who joined on or after 1st January 1993 and on or before 31 August 1997. 
-- Return job title, department name, employee name, and joining date of the job.

select * from hr.job_history
select * from hr.departments

select job_title, department_name, first_name, start_date from hr.job_history j
join hr.employees e
on j.employee_id = e.employee_id
join hr.jobs j2
on e.job_id = j2.job_id
join hr.departments d
on j.department_id = d.department_id
where start_date between '1993-01-01' and '1997-08-31'

-- Exercise 14 --

-- From the following tables, write a SQL query to calculate the difference between the maximum salary of the job and the employee's salary. 
-- Return job title, employee name, and salary difference.

select job_title, first_name, j.max_salary-e.salary [difference] from hr.employees e
join hr.jobs j
on e.job_id = j.job_id

-- Exercise 15 --

-- From the following table, write a SQL query to calculate the average salary, the number of employees receiving commissions in that department. 
-- Return department name, average salary and number of employees.

select department_name, avg(salary) average, count(*) number from hr.employees e
join hr.departments d
on e.department_id = d.department_id
group by department_name

-- Exercise 16 --

-- From the following tables, write a SQL query to calculate the difference between the maximum salary and the salary of all the employees who work in the department of ID 80. 
-- Return job title, employee name and salary difference.

select job_title, first_name, max_salary - salary from hr.employees e
join hr.jobs j
on e.job_id = j.job_id
where e.department_id = 80

-- Exercise 17 --

-- From the following table, write a SQL query to find the name of the country, city, and departments, which are running there.

select country_name, city, department_name from hr.countries c
join hr.locations l
on c.country_id = l.country_id
join hr.departments d
on l.location_id = d.location_id

-- Exercise 18 --

-- From the following tables, write a SQL query to find the department name and the full name (first and last name) of the manager.

select department_name, concat_ws(' ', first_name, last_name) as full_name from hr.departments d
join hr.employees e
on d.manager_id = e.employee_id

-- Exercise 19 --

-- From the following table, write a SQL query to calculate the average salary of employees for each job title.

select job_title, avg(salary) avg_salary from hr.employees e
join hr.jobs j
on e.job_id = j.job_id
group by job_title

-- Exercise 20 --

-- From the following table, write a SQL query to find the employees who earn $12000 or more. Return employee ID, starting date, end date, job ID and department ID.

select e.employee_id, start_date, end_date, e.job_id, e.department_id from hr.employees e
join hr.job_history j
on e.employee_id = j.employee_id
where salary >= 12000

-- Exercise 21 --

-- From the following tables, write a SQL query to find out which departments have at least two employees. Group the result set on country name and city. 
-- Return country name, city, and number.

select country_name, city, count(*) count from hr.countries c
join hr.locations l
on c.country_id = l.country_id
join hr.departments d
on l.location_id = d.location_id
join hr.employees e
on d.department_id = e.department_id
where e.department_id in (select department_id from hr.employees
						group by department_id
						having count(department_id)>=2)
group by country_name, city

-- Exercise 22 --

-- From the following tables, write a SQL query to find the department name, full name (first and last name) of the manager and their city.

select department_name, concat_ws(' ', first_name, last_name) as full_name, city from hr.locations l
join hr.departments d
on l.location_id = d.location_id
join hr.employees e
on d.manager_id = e.employee_id

-- Exercise 23 --

-- From the following tables, write a SQL query to calculate the number of days worked by employees in a department of ID 80. 
-- Return employee ID, job title, number of days worked.

select employee_id, job_title, datediff(day, start_date, end_date) [number of days] from hr.jobs j1
join hr.job_history j2
on j1.job_id = j2.job_id
where department_id = 80

-- Exercise 24 -- 

-- From the following tables, write a SQL query to find full name (first and last name), and salary of all employees working in any department in the city of London.

select concat_ws(' ', first_name, last_name) full_name, salary from hr.departments d
join hr.locations l
on d.location_id = l.location_id
join hr.employees e
on e.department_id = d.department_id
where city = 'London'

-- Exercise 25 --

-- From the following tables, write a SQL query to find full name (first and last name), job title, start and end date of last jobs of employees who did not receive commissions.

select * from hr.jobs
select * from hr.job_history
select * from hr.employees

select concat_ws(' ', first_name, last_name) full_name, j.job_title, jh.* from hr.employees e
join (select max(start_date) start_date, max(end_date) end_date, employee_id from hr.job_history
				group by employee_id) jh on e.employee_id = jh.employee_id
join hr.jobs j
on j.job_id = e.job_id
where commission_pct = 0

-- Exercise 26 --

-- From the following tables, write a SQL query to find the department name, department ID, and number of employees in each department.

select * from hr.departments 
select * from hr.employees

select department_name, e.*  from hr.departments d
join (select department_id, count(employee_id) [number of employees] from hr.employees
		group by department_id) e
on d.department_id = e.department_id

-- Exercise 27 --

-- From the following tables, write a SQL query to find out the full name (first and last name) 
-- of the employee with an ID and the name of the country where he/she is currently employed.

select * from hr.countries
select * from hr.locations
select * from hr.employees 
select * from hr.departments

select concat_ws(' ', first_name, last_name) full_name, employee_id, country_name from hr.countries c
join hr.locations l
on c.country_id = l.country_id
join hr.departments d
on l.location_id = d.location_id
join hr.employees e
on d.department_id = e.department_id