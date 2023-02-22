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

-- UC_08 - To add column employee phone ,address and department in table
ALTER table employee_payroll ADD
employee_phone varchar(15),
address VARCHAR(200) not null DEFAULT 'India',
department VARCHAR(200)
-- To update the column by name
UPDATE employee_payroll set employee_phone='9879879870',department='CS' where name='Piyush'
UPDATE employee_payroll set employee_phone='9871239870',department='Mech' where name='Ashwani'
UPDATE employee_payroll set employee_phone='9870129870',department='IT' where name='Ankita'
UPDATE employee_payroll set employee_phone='9801239870',department='CS' where name='Ravi'
SELECT * FROM employee_payroll

-- UC_09 - Rename salary to basic pay and add column deduction ,taxablepay ,incometax and netpay
-- To rename salary column as basicpay
sp_rename 'employee_payroll.salary','basic_pay'
--To add more column in table
ALTER TABLE employee_payroll ADD
deduction money,
taxable_pay money,
income_tax money,
net_pay money
-- Updating deduction column where gender=F
UPDATE employee_payroll set deduction=1000 where gender='F'
-- Updating deduction column where gender=M
UPDATE employee_payroll set deduction=2000 WHERE gender='M'
-- Updating net_pay column
UPDATE employee_payroll set net_pay=(basic_pay-deduction)
-- Updating incometax and taxablepay column
UPDATE employee_payroll set taxable_pay=0,income_tax=0
SELECT * from employee_payroll

-- UC_10 - Adding Duplicate Name
INSERT into employee_payroll values('Piyush','28000','2023-01-02','M','9876787671','India','IT','2000',0,0,null)