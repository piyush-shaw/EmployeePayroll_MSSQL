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
