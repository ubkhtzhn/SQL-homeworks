
-- Exercise 1 -- 
-- From the following table, write a SQL query to find those employees whose salaries are less than 6000. 
-- Return full name (first and last name), and salary.

select first_name, last_name from employees
where salary < 6000

-- Exercise 2 --
-- From the following table, write a SQL query to find those employees whose salary is higher than 8000. 
-- Return first name, last name and department number and salary.

select first_name, last_name, department_id, salary from employees
where salary > 8000

-- Exercise 3 -- 

-- From the following table, write a SQL query to find those employees whose last name is "McEwen". 
-- Return first name, last name and department ID.

select first_name, last_name, department_id from employees
where last_name = 'McEwen'

-- Exercise 4 --

-- From the following table, write a SQL query to identify employees who do not have a department number. 
-- Return employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary,commission_pct, manager_id and department_id.

select * from employees
where department_id is NULL

-- Exercise 5 -- 

-- From the following table, write a SQL query to find the details of 'Marketing' department. Return all fields.

select * from departments
where department_name = 'Marketing'

-- Exercise 6 --

-- From the following table, write a SQL query to find those employees whose first name does not contain the letter ‘M’. 
-- Sort the result-set in ascending order by department ID. 
-- Return full name (first and last name together), hire_date, salary and department_id.

select first_name, last_name, hire_date, department_id from employees
where first_name not like '%M%'
order by department_id

-- Exercise 7 --

-- From the following table, write a SQL query to find those employees who earn between 8000 and 12000 (Begin and end values are included.) 
-- and get some commission. 
-- These employees joined before ‘1987-06-05’ and were not included in the department numbers 40, 120 and 70. Return all fields.

select * from employees
where (salary between 8000 and 12000) and commission_pct is not null
		or department_id not in (40, 120, 70) and hire_date < '2003-06-05'

-- Exercise 8 --
-- From the following table, write a SQL query to find those employees who do not earn any commission. 
-- Return full name (first and last name), and salary.

select concat(first_name, ' ', last_name) as full_name, salary from employees
where commission_pct is null

-- Exercise 9 --
-- From the following table, write a SQL query to find the employees whose salary is in the range 9000,17000 (Begin and end values are included). 
-- Return full name, contact details and salary.

select concat(first_name, ' ', last_name) as full_name, phone_number, salary from employees
where salary between 9000 and 17000

-- Exercise 10 --

-- From the following table, write a SQL query to find the employees whose first name ends with the letter ‘m’. 
-- Return the first and last name, and salary.

select first_name, last_name, salary from employees
where first_name like '%m'

-- Exercise 11 -- 

-- From the following table, write a SQL query to find those employees whose salaries are not between 7000 and 15000 (Begin and end values are included). 
-- Sort the result-set in ascending order by the full name (first and last). Return full name and salary.

select concat(first_name, ' ', last_name) as full_name, salary from employees
where salary not between 7000 and 15000
order by full_name

-- Exercise 12 -- 

-- From the following table, write a SQL query to find those employees who were hired between November 5th, 2007 and July 5th, 2009. 
-- Return full name (first and last), job id and hire date.

select concat(first_name, ' ', last_name) as full_name, job_id, hire_date from employees
where hire_date between '2007-11-05' and '2009-07-05'

-- Exercise 13 -- 

-- From the following table, write a SQL query to find those employees who work either in department 70 or 90. 
-- Return full name (first and last name), department id.

select concat(first_name, ' ', last_name) as full_name, department_id from employees
where department_id in (70, 90)

-- Exercise 14 -- 

-- From the following table, write a SQL query to find those employees who work under a manager. 
-- Return full name (first and last name), salary, and manager ID.

select concat(first_name, ' ', last_name) as full_name, salary, manager_id from employees
where manager_id is not null

-- Exercise 15 -- 

-- From the following table, write a SQL query to find the employees who were hired before June 21st, 2002. Return all fields.

select * from employees
where hire_date < '2002-06-21'

-- Exercise 16 -- 

-- From the following table, write a SQL query to find the employees whose managers hold the ID 120, 103, or 145. 
-- Return first name, last name, email, salary and manager ID.

select first_name, last_name, email, salary, manager_id from employees
where manager_id in (120, 103, 145)

-- Exercise 17 -- 

-- From the following table, write a SQL query to find employees whose first names contain the letters D, S, or N. 
-- Sort the result-set in descending order by salary. Return all fields.

select * from employees
where first_name like '%d%' or first_name like '%s%' or first_name like '%n%'
order by salary desc

-- Exercise 18 -- 

-- From the following table, write a SQL query to find those employees who earn above 11000 or the seventh character in their phone number is 3. 
-- Sort the result-set in descending order by first name. 
-- Return full name (first name and last name), hire date, commission percentage, email, and telephone separated by '-', and salary.

select concat(first_name, ' ', last_name) as full_name, hire_date, commission_pct, concat(email, '-', phone_number) as contact_details, salary from employees
where salary >11000 or replace(phone_number, '.', '') like '______3%'
order by first_name desc

-- Exercise 19 -- 

-- From the following table, write a SQL query to find those employees whose first name contains a character 's' in the third position. 
-- Return first name, last name and department id.

select first_name, last_name, department_id from employees
where first_name like '__s%'

-- Exercise 20 -- 

-- From the following table, write a SQL query to find those employees work in the departments that are not part of the department 50 or 30 or 80. 
-- Return employee_id, first_name,job_id, department_id.

select employee_id, first_name, job_id, department_id from employees
where department_id not in (30, 50, 80)

-- Exercise 21 -- 

-- From the following table, write a SQL query to find the employees whose department numbers are included in 30, 40, or 90. 
-- Return employee id, first name, job id, department id.

select employee_id, first_name, job_id, department_id from employees
where department_id in (30, 40, 90)

-- Exercise 22 --

-- From the following table, write a SQL query to find those employees who worked more than two jobs in the past. Return employee id.

select employee_id from job_history
group by employee_id
having count(employee_id) >= 2

-- Exercise 23 --

-- From the following table, write a SQL query to count the number of employees, the sum of all salary, 
-- and difference between the highest salary and lowest salaries by each job id. 
-- Return job_id, count, sum, salary_difference.

select job_id, count(employee_id) as count, sum(salary) as sum, (max(salary)-min(salary)) as difference from employees
group by job_id


-- Exercise 24 --

-- From the following table, write a SQL query to find each job ids where two or more employees worked for more than 300 days. Return job id.

select job_id from job_history
where datediff(day, start_date, end_date) > 300
group by job_id

-- Exercise 25 -- 

-- From the following table, write a SQL query to count the number of cities in each country. Return country ID and number of cities.


select country_id, count(*) as count from hr.locations
group by country_id

-- Exercise 26 --

-- From the following table, write a SQL query to count the number of employees worked under each manager. Return manager ID and number of employees.

select * from hr.employees

select manager_id, count(*) as number_of_employees from hr.employees
group by manager_id

-- Exercise 27 --

-- From the following table, write a SQL query to find all those employees who are either Sales Representatives or Salesmen. 
-- Return first name, last name and hire date.

select first_name, last_name, hire_date from hr.employees
where job_id = 'SA_MAN' or job_id = 'SA_REP'

-- Exercise 28 --

-- From the following table, write a SQL query to calculate the average salary of employees who receive a commission percentage for each department. 
-- Return department id, average salary.

select department_id, avg(salary) from hr.employees
where commission_pct is not null
group by department_id

-- Exercise 29 --

-- From the following table, write a SQL query to find all jobs. Sort the result-set in descending order by job title. Return all fields.

select * from hr.jobs
order by job_title desc

-- Exercise 30 --

-- From the following table, write a SQL query to find the departments where any manager manages four or more employees. Return department_id.

select department_id from hr.employees
group by department_id
having (department_id > 4)

-- Exercise 31 -- 

-- From the following table, write a SQL query to find the departments where more than ten employees receive commissions. Return department id.

select department_id from hr.employees
where commission_pct is not null

group by department_id
having count(commission_pct) > 10

-- Exercise 32 -- 

-- From the following table, write a SQL query to find those employees who have completed their previous jobs. Return employee ID, end_date.

select employee_id, max(end_date) from hr.Job_History

-- Exercise 33 --

select * from hr.employees
where commission_pct is null

-- Exercise 34 -- 
 
-- From the following table, write a SQL query to compute the average salary of each job ID. 
-- Exclude those records where average salary is on or lower than 8000. Return job ID, average salary.

select job_id, avg(salary) as average from hr.employees
group by job_id
having avg(salary) > 8000

-- Exercise 35 --

-- From the following table, write a SQL query to find those job titles where maximum salary falls between 12000 and 18000 
-- (Begin and end values are included.). 
-- Return job_title, max_salary-min_salary.

select job_title, max_salary - min_salary as salary_diff from hr.jobs
where max_salary between 12000 and 18000

-- Exercise 36 -- 

-- From the following table, write a SQL query to find the employees whose first or last name begins with 'D'. Return first name, last name.

select first_name, last_name from hr.employees
where first_name like 'd%' or last_name like 'd%'

-- Exercise 37 -- 

-- From the following table, write a SQL query to find details of those jobs where the minimum salary exceeds 9000. Return all the fields of jobs.

select * from hr.jobs
where min_salary > 9000

-- Exercise 38 -- 

-- From the following table, write a SQL query to find those employees who joined after 7th September 1987. Return all the fields.

select * from hr.employees
where hire_date > '1987-09-07'

