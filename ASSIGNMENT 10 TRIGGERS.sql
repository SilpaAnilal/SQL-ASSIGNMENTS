create database school;
use school;

#1.Creating a table named teachers and inserting values into it.
create table Teachers(
Id int auto_increment primary key,
Name varchar(50),
Subject varchar(50), 
Experience varchar(25),
Salary int);

insert into Teachers values
(default,'Miya','Mathematics',2,455000),
(default,'Alice','Physics',5,50000),
(default,'Nivin','Statistics',4,49500),
(default,'George','History',1,45000),
(default,'Sarah','English',12,56000),
(default,'Jerin','Chemistry',3,49000),
(default,'Kevin','Biology',11,54000),
(default,'Merlin','Hindi',6,51000);

#2.Creating a before insert trigger 
delimiter //
create trigger before_insert_teacher
before insert on Teachers
for each row
begin
if new.salary < 0 then 
signal sqlstate '45000'
set message_text =  'Salary cannot be negative.';
end if;
end //
delimiter ;

#3. Creating an after insert trigger
create table teacher_log(
teacher_id int auto_increment primary key,
action varchar(50),
Timestamp timestamp);

delimiter //
create trigger after_insert_teacher
after insert on Teachers
for each row
begin
insert into teacher_log(teacher_id,action,timestamp)
values
(default,'insert',now());
end //
delimiter ;

#4.Creating a before delete trigger 
delimiter //
create trigger before_delete_teacher
before delete on Teachers
for each row
begin
if old.experience > 10 then 
signal sqlstate '45000'
set message_text =  'Cannot delete teachers with more than 10 years of experience';
end if;
end //
delimiter ;

#5.Creating an after delete trigger 
delimiter //
create trigger after_delete_teacher
after delete on Teachers
for each row
begin
insert into teacher_log(teacher_id,action,timestamp)
values
(old.id,'delete',now());
end //
delimiter ;

# for checking
insert into Teachers values
(default,'Niom','Mathematics',7,-5);

insert into Teachers values
(default,'Darsh','English',6,52000);

select * from teacher_log;
select * from teachers;

delete from teachers where id=5;
delete from teachers where id =3;