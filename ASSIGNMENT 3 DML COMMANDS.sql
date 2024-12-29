create database Sales;
use sales;

create table Managers(
Manager_ID int primary key auto_increment,
First_Name varchar(50),
Last_Name varchar(50),
DOB date,
Age int check (age>=25),
Last_Update timestamp default current_timestamp,
Gender char(1) check (Gender in ('M','F','O')),
Department varchar(50),
Salary int not null
);

insert into  Managers(Manager_Id, First_name, Last_name, DOB, Age, Last_update, Gender, Department, Salary)
values
(default, 'Jack', 'Daniel', '1982-06-25', 42, CURRENT_TIMESTAMP, 'M', 'Sales', 9500),
(default, 'Grace', 'Antony', '1990-05-20', 34, CURRENT_TIMESTAMP, 'F', 'Finance', 24000),
(default, 'Aaliya', 'Jacob', '1992-01-17', 32,  CURRENT_TIMESTAMP, 'F', 'HR', 36000),
(default, 'Lily', 'Cooper', '1994-03-20', 30, CURRENT_TIMESTAMP, 'F', 'Marketing', 24000),
(default, 'James', 'Thomas', '1998-08-22', 26, CURRENT_TIMESTAMP, 'M', 'IT', 26000),
(default, 'Samuel', 'John', '1989-12-24', 35, CURRENT_TIMESTAMP, 'M', 'Public Relation', 28000),
(default, 'Isaac', 'Thomas', '1995-08-15', 29, CURRENT_TIMESTAMP, 'M', 'Legal', 30000),
(default, 'Mariya', 'Jose', '1997-02-22', 27, CURRENT_TIMESTAMP, 'F', 'IT', 24000),
(default, 'Anjali', 'Joseph', '1996-03-05', 28, CURRENT_TIMESTAMP, 'F', 'Operations', 30000),
(default, 'Alex', 'Paul', '1990-10-05', 34, CURRENT_TIMESTAMP, 'M', 'Customer Service', 9000);

select * from managers;

select First_name,last_name,dob from managers where manager_id = 1;

select first_name,last_name,salary*12 as annual_income from managers;

select * from managers where manager_id<>3;
#alternate method for the above step
select * from managers where first_name!='Aaliya';

select * from managers where department = 'IT' and salary>25000;

select * from managers where salary between 10000 and 35000;

 










