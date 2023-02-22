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