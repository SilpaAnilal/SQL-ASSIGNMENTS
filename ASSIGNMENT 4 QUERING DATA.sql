create database COUNTRY;
use COUNTRY;

create table Country(
ID int primary key ,
Country_name varchar(50), 
Population bigint,
Area int 
);

create table Persons(
ID int primary key auto_increment,
First_name varchar(50),
Last_name varchar(50),
Population bigint,
Rating decimal(3,2),
Country_ID int,
Country_name varchar(50),
foreign key (Country_Id) references Country(ID)
);


insert into Country (ID,Country_name,Population,Area)
values
(1,'USA',346346203,9826675),
(2,'Canada',41465298,9984670),
(3,'India',1450935791, 3287263),
(4,'Australia',25499884,7692024),
(5,'UK', 67886011, 243610),
(6,'China',1419321278,9706961),
(7,'France',65273511, 551695),
(8,'Brazil', 212559417, 8515767),
(9,'Germany', 83783942, 357022),
(10,'Pakistan',251269164,881913);

select*from country;

insert into Persons(ID,First_name,Last_name,Population,Rating,Country_ID,Country_name)
values
(default,'Jack', 'Daniel',346346203,4.2,1,'USA'),
(default,'Grace', 'Antony',67886011,3.7,5,'UK'),
(default,'Aaliya', 'Jacob',251269164,2.9,10,'Pakistan'),
(default,'Lily', 'Cooper','25499884',3.2,'4','Austalia'),
(default,'James', 'Thomas',212559417,3.8,8,'Brazil'),
(default,'Samuel', 'John',1450935791,4.7,3,'India'),
(default,'Isaac', 'Thomas',1419321278,4.2,6,'China'),
(default,'Mariya', 'Jose',41465298,4.2,2,'Canada'),
(default,'Alex', 'Paul','65273511',4.5,'7','France'),
(default,'Anjali', 'Joseph',83783942,4.9,9,'Germany');

select distinct country_name from persons;

select concat(first_name,' ',last_name) as Person_name from Persons;

select concat(first_name,' ',last_name) as Person_name ,rating from persons where rating>4.0;

select country_name,population from country where population>1000000;

select * from persons where country_name = 'USA' or rating>4.5; 

select * from persons where country_name is null ;

select * from persons where country_name in ('USA','Canada','UK');

select * from persons where country_name not in ('India','Austalia');

select country_name from country where population between 500000 and 2000000;

select * from country where country_name not like 'c%';













