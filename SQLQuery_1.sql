--Welcome to Employee Payroll Database
--  UC_01 - To create database
CREATE DATABASE Payroll
-- To show database
SELECT * FROM sys.databases
-- To use database
USE Payroll

-- UC_02 - To create employee payroll table
CREATE TABLE employee_payroll
(
id int IDENTITY PRIMARY Key,
name VARCHAR(200) not null,
salary money not null,
start_date date not null
)

-- UC_03 - Insert value in table
INSERT into employee_payroll VALUES
('Piyush',29000,'2023-01-02'),
('Ashwani',24000,'2022-07-06'),
('Ankita',32000,'2019-03-18'),
('Ravi',26000,'2018-05-22')

-- UC_04 - Retrieve all data from table
SELECT * FROM employee_payroll

-- UC_05 - Retrieve salary for particular employee
SELECT salary FROM employee_payroll where name='Piyush'
-- Retrieve all data for employee in a given range of start date using getdate()
SELECT * FROM employee_payroll WHERE start_date between '2020-01-01' and GETDATE()
-- Retrieve salary for employee in a given range of start date using getdate()
SELECT salary FROM employee_payroll WHERE start_date between '2020-01-01' and GETDATE()

-- UC_06 - Alter table to add column
alter table employee_payroll add gender char(1)
-- update row
UPDATE employee_payroll set gender='F' where name='Ankita'
--update same value for two or more row at a time
UPDATE employee_payroll set gender='M' WHERE id in (1,2,4)

-- UC_07 - Use database function to find sum,avg,min,max
-- To get sum of salary of all male employee
SELECT gender, sum(salary) from employee_payroll  where gender = 'M' group by gender
-- To get avg of salary of all female employee
SELECT gender, avg(salary) from employee_payroll where gender = 'F' group by gender
-- To get sum of salary of both male and female by using group by
SELECT gender, sum(salary) from employee_payroll  group by gender
-- To get avg of salary of both male and female by using group by
SELECT gender, avg(salary) from employee_payroll  group by gender
-- To count number of male and female employee 
SELECT gender, count(salary) from employee_payroll  group by gender;
-- To get maximum salary from table
SELECT max(salary) "Highest_Salary" from employee_payroll
--To get minimum salary from table
SELECT min(salary) "Lowest_Salary" from employee_payroll