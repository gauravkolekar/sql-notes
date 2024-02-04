##########################################################
##########################################################

# Data Definition and Manipulation in SQL

##########################################################
##########################################################


#############################
-- Task Two: Data Definition
-- In this task, you will learn how to create database objects (tables) in the database you created in task 1.
#############################

-- Creating the sales table
drop table if exists sales;

create table sales (
	purchase_number serial not null,
	date_of_purchase date not null,
	customer_id int not null,
	item_code varchar(10) not null,
	primary key(purchase_number),
	foreign key(customer_id) references customers(customer_id),
	foreign key(item_code) references items(item_code)
);

-- Creating the customers table
drop table if exists customers;

create table customers (
	customer_id serial not null,
	first_name varchar(255) not null,
	last_name varchar(255) not null,
	email_address varchar(255) not null,
	number_of_complaints int default 0,
	primary key (customer_id)	
);

-- Creating the items table
drop table if exists items;

create table items (
	item_code varchar(10) unique not null,
	item varchar(100) not null,
	unit_price decimal(5,2) not null
);

#############################
-- Task Three: Data Manipulation
-- By the end of Task 3, you will be able to insert records into the tables created.
#############################

-- Insert five (5) records into the sales table
insert into sales (
	date_of_purchase,
	customer_id,
	item_code
) values
	('2024-01-01', 1, 'B002'),
	('2024-02-01', 1, 'B003'),
	('2024-02-29', 1, 'B002'),
	('2024-01-31', 5, 'P001'),
	('2024-01-26', 2, 'H001')
returning *;

-- Insert five (5) records into the customers table
insert into customers(
	first_name,
	last_name,
	email_address
) values 
	('Bruce', 'Wayne', 'bwayne@email.com'),
	('Harley', 'Quinn', 'hquinn@email.com'),
	('Joker', 'LNU', 'joker@email.com'),
	('Jim', 'Gordon', 'Jgordon@email.com'),
	('Poison', 'Ivy', 'Pivy@email.com')
returning *;

-- Insert five (5) records into the items table
insert into items (
	item_code,
	item,
	unit_price
) values
	('B001', 'Batrang', 50.20),
	('B002', 'Batmobile', 100.80),
	('B003', 'Smoke Grenades', 19.40),
	('P001', 'Rose', 45.99),
	('H001', 'Baseball Bat', 80.90)
returning *;


#############################
-- Task Four: Data Manipulation - Part 2
-- By the end of Task 4, you will be able to upload a csv file into your database 
-- and insert records into duplicate tables. 
#############################

-- Create the companies table and upload the CSV file into the table
drop table if exists companies;

create table companies (
	company_id int,
	company_name varchar(255),
	headquarters_phone_number varchar(255)
);

select * from companies;

-- Create the sales_dup table
create table sales_dup (
	purchase_number serial not null,
	date_of_purchase date not null,
	customer_id int not null,
	item_code varchar(10) not null,
	primary key(purchase_number),
	foreign key(customer_id) references customers(customer_id),
	foreign key(item_code) references items(item_code)
);

-- Create the customers_dup table
drop table if exists customers_dup;

create table customers_dup (
	customer_id serial not null,
	first_name varchar(255) not null,
	last_name varchar(255) not null,
	email_address varchar(255) not null,
	number_of_complaints int default 0,
	primary key (customer_id)	
);

-- Insert records from sales table into sales_dup table
insert into sales_dup
select * from sales;

select * from sales_dup;

-- Insert records from customers table into customers_dup table
insert into customers_dup
select * from customers;

select * from customers_dup;

#############################
-- Task Five: Data Definition and Manipulation
-- By the end of this task, you will be able to alter, rename and update data in tables in a database.
#############################

-- Add a new column gender after the last_name field
-- We will perform this task using ALTER on the customers_dup table
alter table customers_dup
add column gender char(1);

select * from customers_dup cd ;

-- Insert new records to the customers_dup table
insert into customers_dup(
	customer_id,
	first_name,
	last_name,
	email_address,
	gender
) values
	(6, 'Death', 'Shot', 'Dshot@email.com', 'M')
returning *;

-- Create a companies_dup table
drop table if exists companies_dup;

create table companies_dup (
	company_id int,
	company_name varchar(255),
	headquarters_phone_number varchar(255)
);

-- Insert records from companies table into the companies_dup table
insert into companies_dup
select * from companies;

select * from companies_dup;

-- ALTER the companies_dup table to add a UNIQUE KEY constraint
-- to the headquarters_phone_number field.
alter table companies_dup
add unique(headquarters_phone_number);


-- Change the company_id column to be auto_increment
alter table companies_dup
add serial company_id;


-- Change the headquarters_phone_number field to VARCHAR(255) NOT NULL
alter table companies_dup 
alter column headquarters_phone_number type varchar(255);



-- Use RENAME to give the sales_dup table a new name called sales_data
alter table sales_dup
rename to sales_data;


-- RENAME the unit_price in the items to item_price
alter table items
rename column unit_price to item_price;


-- We will UPDATE some records in the customers_dup table
select * from customers_dup cd;

update customers_dup
set
	email_address = 'pivy@email.com',
	gender = 'F'
where
	customer_id = 5;

update customers_dup
set
	email_address = 'dshot@email.com',
	gender = 'M'
where
	customer_id = 6;


#############################
-- Task Six: Drop Vs. Truncate Vs. Delete
-- By the end of task 6, you will learn how to use SQL drop, truncate and delete statements. 
-- In addition, you will understand the difference between SQL drop, truncate and delete statements.
#############################


-- DROP the customers_dup table
drop table customers_dup;


-- TRUNCATE the sales_data table
truncate table sales_data;



-- DELETE records from the companies_dup table
delete from companies_dup
where company_id = 3

















