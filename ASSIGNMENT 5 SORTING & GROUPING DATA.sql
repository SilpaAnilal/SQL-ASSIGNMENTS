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

select * from Persons;

#1 first three characters of country name 
select left(Country_name, 3) as First_Three_Chars from Country;

#2 concatenate first and last names
select concat(first_name,' ', last_name) as full_name from persons;

#3counting the no:of unique country names
select count(distinct country_name) as unique_country_names from persons;

#4 maximum population 
select max(population) as max_popln from country;

#5 minimum population
select min(population) as min_popln from persons;

#6 inserting 2 new rows with last_name NULL and counting last_name
insert into Persons(ID,First_name,Last_name,Population,Rating,Country_ID,Country_name)
values
(default,'Tara',null,346346203,4.5,1,'USA'),
(default,'Helen',null,1450935791,4.6,3,'India');
select * from persons;

select count(last_name) as count_of_last_name from persons;

#7 No:of rows in persons table
select count(*) as total_no_of_rows from persons;

#8 the population of country table for the first 3 rows
select id,country_name,population from country limit 3;

#9 for 3 random rows of country 
select * from country order by rand() limit 3;

#10 list of all persons ordered by their rating in descending order
select * from persons order by rating desc ;

#11 total population for each country in persons table
select country_name, sum(Population) as total_popln from persons group by Country_name ;

# 12 countries in persons table with total population greater than 50000
select country_name, sum(Population) as total_popln from persons 
group by Country_name having sum(Population) > 50000;

#13 the total no:of persons and average rating for each country,only for countries with more than 2 persons, ordered by rating in ascending
select country_name, count(*) as total_no_persons, avg(rating) as average_rating from persons
group by country_name having count(*) > 2 order by avg(Rating) asc;




