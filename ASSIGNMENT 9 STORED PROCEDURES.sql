create database Workers;

use  Workers;

create table Worker(
Worker_Id INT auto_increment primary key,
FirstName CHAR(25), 
LastName CHAR(25), 
Salary INT(15), 
JoiningDate DATETIME, 
Department CHAR(25)) ;

insert into  worker(worker_Id, Firstname, Lastname, Salary, JoiningDate, Department)
values
(default, 'Jack', 'Daniel', 45000, '2022-06-15 09:30:00','Sales'),
(default, 'Grace', 'Antony', 50000,	'2021-04-10 08:45:00','Finance'),
(default, 'Aaliya', 'Jacob', 42500,	'2023-01-20 10:00:00','HR'),
(default, 'Lily', 'Cooper', 48000, 	'2020-11-05 14:20:00','Marketing'),
(default, 'James', 'Thomas', 55000,	'2019-03-28 07:55:00', 'IT'),
(default, 'Samuel', 'John', 47500, '2022-09-17 12:10:00', 'Marketing'),
(default, 'Isaac', 'Thomas', 53000,	'2021-07-02 08:30:00', 'Sales'),
(default, 'Mariya', 'Jose', 41000, '2023-02-01 16:45:00', 'IT'),
(default, 'Anjali', 'Joseph', 46000, '2020-10-13 11:40:00','Finance'),
(default, 'Alex', 'Paul', 49500, '2021-12-30 15:25:00', 'HR');

# 1.Create a stored procedure that takes in IN parameters for all the columns in the Worker table and 
#   adds a new record to the table and then invokes the procedure call.

delimiter //
create procedure AddWorker(
IN addWorker_Id INT,
IN addFirstName CHAR(25),
IN addLastName CHAR(25),
IN addSalary INT,
IN addJoiningDate DATETIME,
IN addDepartment CHAR(25))

begin
insert into Worker values (addWorker_Id, addFirstName, addLastName, addSalary, addJoiningDate, addDepartment);
end //
delimiter ;

call addworker(11, 'Miya', 'George', 47500, '2020-03-20 10:25:00', 'Finance');
select * from worker;

#2.stored procedure takes in an IN parameter for WORKER_ID and an OUT parameter for SALARY.

delimiter $$
create procedure SalaryByWorkerId(
IN addWorker_Id int,
OUT p_Salary int(15))
begin
select Salary into p_Salary from Worker where Worker_Id = addWorker_Id;
end $$
delimiter ;

call SalaryByWorkerId(10, @Salary);
select @Salary as Salary_of_Worker;

#3. stored procedure that takes in IN parameters for WORKER_ID and DEPARTMENT

delimiter $$
create procedure UpdateDepartment(
IN updateWorker_Id INT,
IN updateDepartment CHAR(25)
)
begin
update Worker
set Department = updateDepartment where worker_Id = updateWorker_Id;
end $$
delimiter ;

call UpdateDepartment(5, 'Finance');
select * from worker;

#4.Stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_workerCount.

delimiter $$
create procedure WorkerCountByDepartment(
IN p_Department char(25),
OUT p_WorkerCount int
)
begin
select count(*) into p_WorkerCount from Worker
where Department = p_Department;
end $$
delimiter ;

call WorkerCountByDepartment('IT', @WorkerCount);
select @WorkerCount as WorkerCount;

#5.stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_avgSalary.

delimiter $$
create procedure AvgSalaryByDepartment(
IN p_Department char(25),
OUT p_AvgSalary decimal(15, 2)
)
begin
select avg(Salary) into p_AvgSalary from worker
where Department = p_Department;
end $$
delimiter ;

call AvgSalaryByDepartment('IT', @AvgSalary);
select @AvgSalary as AvgSalary;






