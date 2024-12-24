create database School;
use School;

create table Student(
Roll_No int auto_increment primary key,
Student_Name varchar(50) not null,
Marks int not null,
Grade char(1) 
);

desc student;

insert into Student 
values
(default,'Tom',98,'A'),
(default,'Joseph',75,'C'),
(default,'Jack',84,'B'),
(default,'Rose',93,'A');

select * from student;

alter table student
add Contact varchar(50);

desc student;

alter table student
drop column grade;

desc student;

rename table student to CLASSTEN;

desc CLASSTEN;

truncate table CLASSTEN;

desc CLASSTEN;

drop table CLASSTEN;




