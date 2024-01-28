#########################################################################
#########################################################################

-- Guided Project: Performing Aggregation Using SQL Aggregate Functions

#########################################################################
#########################################################################


#############################
-- Task One: Introduction
-- In this task, you will retrieve data from tables in the employees database
#############################

-- 1.1: Retrieve all records in the employees table
select * from employees;

-- 1.2: Retrieve all records in the departments table
select * from departments;

-- 1.3: Retrieve all records in the dept_emp table
select * from dept_emp;

-- 1.4 (Ex.): Retrieve all records in the salaries table
select * from salaries;

#############################
-- Task Two: COUNT()
-- In this task, you will learn how to retrieve data from the employees
-- database using the COUNT() function
#############################

-- ##########
-- COUNT()

-- 2.1: How many employees are in the company?
select 
	count(emp_no)
from
	employees;


-- 2.2: Is there any employee without a first name?  

SELECT * 
FROM employees
WHERE first_name IS NULL;

-- Alternative Solution
select
	count(first_name)
from
	employees


-- 2.3: (Ex.) How many records are in the salaries table
select
	count(*)
from
	salaries;


-- 2.4: How many annual contracts with a value higher than or equal to
-- $100,000 have been registered in the salaries table?
select 
	count(salary)
from
	salaries
where
	salary > 100000;



-- 2.5: How many times have we paid salaries to employees?
select 
	count(salary)
from
	salaries;
 

-- This should give the same result as above

SELECT COUNT(from_date)
FROM salaries;
	
#############################
-- Task Three: SELECT DISTINCT & GROUP BY
-- In this task, you will understand the difference between SELECT DISTINCT
-- and GROUP BY to retrieve data from the employees database
#############################

###########
-- SELECT DISTINCT & GROUP BY

-- Select first name from the employees table
select
	first_name 
from 
	employees;

-- 3.1: Select different names from the employees table
select
	distinct first_name
from
	employees;


-- Same result as above
-- Select first name from the employees table and group by first name

SELECT first_name
FROM employees
GROUP BY first_name;

-- 3.2: How many different names can be found in the employees table?
select
	count(distinct first_name)
from
	employees;


-- 3.3: How many different first names are in the employees table?
select
	count(first_name)
from
	employees
group by
	first_name;

-- 3.4: How many different first name are in the employees table?
select
	first_name, count(first_name)
from
	employees
group by
	first_name;

-- 3.5: How many different first name are in the employees table
-- and order by first name in descending order?
select
	first_name, count(first_name)
from
	employees
group by
	first_name
order by
	first_name desc;
	
-- 3.6 (Ex.): How many different departments are there in the "employees" database?
-- Hint: Use the dept_emp table
select
	count(distinct dept_no)
from
	dept_emp;

select
	count(dept_no)
from
	departments;

-- 3.7: Retrieve a list of how many employees earn over $80,000 and
-- how much they earn. Rename the 2nd column as emps_with_same_salary?

SELECT salary, COUNT(emp_no) AS emps_with_same_salary
FROM salaries
WHERE salary > 80000
GROUP BY salary
ORDER BY salary ASC;


#############################
-- Task Four: HAVING
-- In this task, you will learn how to set conditions on the output of 
-- aggregate functions using the HAVING clause
#############################

###########

-- HAVING

-- 4.1: Retrieve a list of all employees who were employed on and after 1st of January, 2000
select
	*
from
	employees
where
	hire_date >= '2000-01-01';

-- Will this produces the same result?

SELECT *
FROM employees
HAVING hire_date >= '2000-01-01';
-- error

-- 4.2: Extract a list of names of employees, where the number of employees is more than 15
-- Order by first name.

SELECT first_name, COUNT(first_name) as names_count
FROM employees
WHERE COUNT(first_name) > 15
GROUP BY first_name
ORDER BY first_name;

-- Correct Solution
SELECT first_name, COUNT(first_name) as names_count
FROM employees
GROUP BY first_name
HAVING COUNT(first_name) > 15
ORDER BY first_name;



-- 4.3: Retrieve a list of employee numbers and the average salary.
-- Make sure the you return where the average salary is more than $120,000

-- Select all records from the salaries table
SELECT * FROM salaries;

-- Solution to 4.3
select
	emp_no, 
	avg(salary) 
from
	salaries
group by
	emp_no
having
	avg(salary) > 120000; 
	

-- 4.4: Extract a list of all names that have encountered less than 200
-- times. Let the data refer to people hired after 1st of January, 1999
select
	first_name,
	count(first_name) as count_firstname 
from
	employees
where
	hire_date > '1999-01-01'
group by
	emp_no 
having
	count(first_name) < 200; 



-- 4.5 (Ex.): Select the employees numbers of all individuals who have signed 
-- more than 1 contract after the 1st of January, 2000

-- Retrieve all records from dept_emp
SELECT * FROM dept_emp;

-- Solution to 4.5
select
	emp_no,
	count(from_date)
from
	dept_emp
where
	from_date > '2000-01-01'
group by
	emp_no
having
	count(from_date) > 1; 


#############################
-- Task Five: SUM
-- In this task, you will learn how to retrieve data from the employees
-- database using the SUM() function
#############################

###########
-- SUM()

-- 5.1: Retrieve the total amount the company has paid in salary?
select 
	sum(salary)
from
	salaries;

-- 5.2 (Ex.): What do you think will happen here

SELECT SUM(*)
FROM salaries;

-- 5.3: What is the total amount of money spent on salaries for all 
-- contracts starting after the 1st of January, 1997?
select * from salaries s ;

select
	sum(salary)
from
	salaries
where
	from_date > '1997-01-01';


#############################
-- Task Six: MIN() and MAX()
-- In this task, you will learn how to retrieve data from the employees
-- database using the MIN() and MAX() function
#############################

###########
-- MIN() and MAX()

-- 6.1: What is the highest salary paid by the company?
select
	max(salary) 
from 
	salaries;


-- 6.2: What is the lowest salary paid by the company?
select
	min(salary) 
from 
	salaries;

    
-- 6.3 (Ex.): What is the lowest employee number in the database?
select
	min(emp_no) 
from 
	employees;

-- 6.4 (Ex.): What is the highest employee number in the database?
select
	max(emp_no) 
from 
	employees;


#############################
-- Task Seven: AVG()
-- In this task, you will learn how to retrieve data from the employees
-- database using the AVG() function
#############################

###########
-- AVG()

-- 7.1: How much has the company paid on average to employees?
select
	avg(salary) 
from 
	salaries;

-- 7.2: What is the average annual salary paid to employees who started
-- after the 1st of January, 1997
select
	avg(salary) 
from
	salaries
where
	from_date > '1997-01-01'

#############################
-- Task Eight: ROUND()
-- In this task, you will learn how to tidy up the result set from an 
-- aggregate function using ROUND(). In addition, you will perform some arithmetic
-- operations by combining different aggregate function
#############################

###########
-- ROUND()

-- 8.1: Round the average salary to the nearest whole number
select
	round(avg(salary)) 
from 
	salaries;   

-- 8.2: Round the average salary to a precision of cents.
select
	round(avg(salary), 2) 
from 
	salaries; 

-- 8.3: Round the average amount of money spent on salaries for all
-- contracts that started after the 1st of January, 1997 to a precision of cents
select
	round(avg(salary),2) 
from 
	salaries
where
	from_date > '1997-01-01'

-- 8.4: Arithmetic operations can also be performed in PostgreSQL

-- Finding the range for salary
select
	min(salary),
	max(salary),
	max(salary) - min(salary) as range_salary,
	(max(salary) - min(salary))/2 as range_salary
from
	salaries


