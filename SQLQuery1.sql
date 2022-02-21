-----CREATE DATABASE UC 1-----
CREATE DATABASE payroll_service;
use payroll_service;
-----CREATE TABLE UC2--------
CREATE TABLE employee_payroll (
ID int IDENTITY (1,1) PRIMARY KEY,
Name varchar(50),
Salary float,
StartDate Date
);
---- CREATE DATA UC3---------
insert into employee_payroll (Name,Salary,StartDate) values('Sangita',21602,'05-08-2016'),('Kavita',34752,'06-11-2014');
insert into employee_payroll (Name,Salary,StartDate) values('Kajal',12147,'06-12-2018'),('Naina',15478,'07-03-2019');

-----RETRIEVE DATA UC4-------
select * from employee_payroll;
-----RETRIEVE DATA FROM RANGE UC5------
select * from employee_payroll where Name='Deepak';
select * from employee_payroll where StartDate between cast('2011-07-09' as date) and getdate();
-----ADD GENDER UC6-----
Alter table employee_payroll add Gender char(2);
update employee_payroll set Gender='F' where ID=3 or ID=4;
-----AGGREGATE FUNCTIONS UC7----------
select * from employee_payroll;
select sum(salary) as TotalSalary from employee_payroll;

select * from employee_payroll;
select sum(salary) as TotalSalary,Gender from employee_payroll group by Gender;

select * from employee_payroll;
select avg(salary) as AverageSalary,Gender from employee_payroll group by Gender;

select * from employee_payroll;
select min(salary) as MinSalary,Gender from employee_payroll group by Gender;

select * from employee_payroll;
select max(salary) as MaxSalary,Gender from employee_payroll where gender ='F' group by Gender;

select count(Name)as NumofEmployees,Gender from employee_payroll group by Gender;

select * from employee_payroll;
select count(Name) as TotalEmployee,Gender from employee_payroll group by Gender;
-------CREATE ADDRESS,DEPARTMENT PHONE COLUMN UC8------
Alter table employee_payroll add Phone varchar(50),address varchar(50) ,department varchar(50) 

--Add default value for address field--
Alter table employee_payroll add constraint DF_Addresscon default 'India' for address
insert into employee_payroll (Name,Salary,StartDate,Gender) values('Yogesh',23642,'01-03-2017','M')
select * from employee_payroll;
update employee_payroll set department ='HR' where ID=2;

------MORE COLUMNS U9---------
alter table employee_payroll
drop column Salary

alter table employee_payroll Add BasicPay int, Deduction float, TaxablePay float, Tax float, NetPay float
------INSERT DATA UC10--------
insert into employee_payroll(Name, Gender, StartDate, Phone, address, department, BasicPay, Deduction, TaxablePay, Tax, NetPay ) 
							VALUES('Terissa','F','2010-01-01','7987210210','Patna','Marketing',35000,3500.0,1250.0,250.0,30000.0)

insert into employee_payroll(Name, Gender, StartDate,Phone, address, department, BasicPay, Deduction, TaxablePay, Tax, NetPay ) 
							VALUES('Terissa','F','2010-01-01','7987210210','Patna','Sales',35000,3500.0,1250.0,250.0,30000.0)
select * from employee_payroll;
-- Retrieve the Terissa Information --
select * from employee_payroll where Name='Terissa';

---------USING ER DIAGRAM UC11--------
drop table employee_payroll;

/* Represents the ER Diagram */
create table Employee 
(
 Emp_Id int identity(1,1) primary key,
 Emp_Name varchar(30),
 Gender char(1),
 PhoneNumber varchar(12),
 Address varchar(40),
 City varchar(15),
 State varchar(12),
 Start date
)

create table Company
(
  Company_Id int identity(1,1) primary key,
  Company_Name varchar(40),
  Emp_Id int foreign key references Employee(Emp_Id)
)

create table Department
(
  Dept_Id int identity(1,1) primary key,
  Dept_Name varchar(15),
  Emp_Id int foreign key references Employee(Emp_Id)
)

create table PayRoll
(
  BasicPay int, 
  Deduction float, 
  TaxablePay float, 
  Tax float,
  NetPay float,
  Emp_Id int foreign key references Employee(Emp_Id)

)
create table Employee_Department
(
  Emp_Id int foreign key references Employee(Emp_Id),
  Dept_Id int foreign key references Department(Dept_Id),
)

/* Insert data into Employee */
insert into Employee values('Yogesh','M','9907296689','Khaspur','Patna','Bihar','2010-01-01')
insert into Employee values('Rohit','M','7987210395','BTM','Bangalore','KA','2020-02-04')
insert into Employee values('Harsh','M','9988998899','Sorojni','Delhi','Delhi','2021-03-10')

/* Insert data into Company */
insert into Company values ('TCS',1)
insert into Company values ('TCS',3)
insert into Company values ('IBM',2)

-- Retrieve the data from tables
select * from Employee
select * from Company

