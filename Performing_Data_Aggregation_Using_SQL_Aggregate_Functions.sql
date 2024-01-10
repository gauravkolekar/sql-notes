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


-- 1.2: Retrieve all records in the departments table


-- 1.3: Retrieve all records in the dept_emp table


-- 1.4 (Ex.): Retrieve all records in the salaries table


#############################
-- Task Two: COUNT()
-- In this task, you will learn how to retrieve data from the employees
-- database using the COUNT() function
#############################

-- ##########
-- COUNT()

-- 2.1: How many employees are in the company?



-- 2.2: Is there any employee without a first name?  

SELECT * 
FROM employees
WHERE first_name IS NULL;

-- Alternative Solution



-- 2.3: (Ex.) How many records are in the salaries table



-- 2.4: How many annual contracts with a value higher than or equal to
-- $100,000 have been registered in the salaries table?



-- 2.5: How many times have we paid salaries to employees?

 

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


-- 3.1: Select different names from the employees table



-- Same result as above
-- Select first name from the employees table and group by first name

SELECT first_name
FROM employees
GROUP BY first_name;

-- 3.2: How many different names can be found in the employees table?



-- 3.3: How many different first names are in the employees table?


-- 3.4: How many different first name are in the employees table?


-- 3.5: How many different first name are in the employees table
-- and order by first name in descending order?

  
-- 3.6 (Ex.): How many different departments are there in the "employees" database?
-- Hint: Use the dept_emp table


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


-- Will this produces the same result?

SELECT *
FROM employees
HAVING hire_date >= '2000-01-01';

-- 4.2: Extract a list of names of employees, where the number of employees is more than 15
-- Order by first name.

SELECT first_name, COUNT(first_name) as names_count
FROM employees
WHERE COUNT(first_name) > 15
GROUP BY first_name
ORDER BY first_name;

-- Correct Solution


-- 4.3: Retrieve a list of employee numbers and the average salary.
-- Make sure the you return where the average salary is more than $120,000

-- Select all records from the salaries table
SELECT * FROM salaries;

-- Solution to 4.3


-- 4.4: Extract a list of all names that have encountered less than 200
-- times. Let the data refer to people hired after 1st of January, 1999


-- 4.5 (Ex.): Select the employees numbers of all individuals who have signed 
-- more than 1 contract after the 1st of January, 2000

-- Retrieve all records from dept_emp
SELECT * FROM dept_emp;

-- Solution to 4.5



#############################
-- Task Five: SUM
-- In this task, you will learn how to retrieve data from the employees
-- database using the SUM() function
#############################

###########
-- SUM()

-- 5.1: Retrieve the total amount the company has paid in salary?

    
-- 5.2 (Ex.): What do you think will happen here

SELECT SUM(*)
FROM salaries;

-- 5.3: What is the total amount of money spent on salaries for all 
-- contracts starting after the 1st of January, 1997?



#############################
-- Task Six: MIN() and MAX()
-- In this task, you will learn how to retrieve data from the employees
-- database using the MIN() and MAX() function
#############################

###########
-- MIN() and MAX()

-- 6.1: What is the highest salary paid by the company?



-- 6.2: What is the lowest salary paid by the company?


    
-- 6.3 (Ex.): What is the lowest employee number in the database?


-- 6.4 (Ex.): What is the highest employee number in the database?



#############################
-- Task Seven: AVG()
-- In this task, you will learn how to retrieve data from the employees
-- database using the AVG() function
#############################

###########
-- AVG()

-- 7.1: How much has the company paid on average to employees?


-- 7.2: What is the average annual salary paid to employees who started
-- after the 1st of January, 1997


#############################
-- Task Eight: ROUND()
-- In this task, you will learn how to tidy up the result set from an 
-- aggregate function using ROUND(). In addition, you will perform some arithmetic
-- operations by combining different aggregate function
#############################

###########
-- ROUND()

-- 8.1: Round the average salary to the nearest whole number
   

-- 8.2: Round the average salary to a precision of cents.


-- 8.3: Round the average amount of money spent on salaries for all
-- contracts that started after the 1st of January, 1997 to a precision of cents


-- 8.4: Arithmetic operations can also be performed in PostgreSQL

-- Finding the range for salary


