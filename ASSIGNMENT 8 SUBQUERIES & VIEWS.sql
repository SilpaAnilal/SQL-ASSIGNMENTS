use country;

#1.no of persons in each country
select country_name,(select count(*) from persons  
where persons.country_id = country.id) as no_of_persons from country ;

#2.no of persons in each country sorted from high to low
select country_name,(select count(*) from persons  
where persons.country_id = country.id) as no_of_persons from country 
order by no_of_persons  desc;

#3.average rating for Persons in respective countries if the average is greater than 3.0
select country_name,(select avg(persons.rating) from persons  
where persons.country_id = country.id) as avg_rating from country 
having avg_rating > 3.0;

#4.countries with the same rating as the USA.
select country_name from country where (select avg(p.rating) from persons p 
where p.country_id = country.id) = (select avg(p.rating) from Persons p 
join country c2 ON p.id = c2.id where c2.country_name = 'USA');
 select * from persons;
       
#5.all countries whose population is greater than the average population of all nations
select country_name,population from country 
where population > (select avg(population) from country);

#creating a new database 
create database Products;
 
use products;

create table Customer(
Customer_ID int primary key auto_increment,
First_Name varchar(50),
Last_Name varchar(50),  
Email varchar(100),
Phone_No varchar(25),
Address varchar(150),
City varchar(50),
State varchar(50), 
Zip_code varchar(50),
Country varchar(50));

insert into Customer values
(default, 'Jack', 'Daniel','jackdaniel@gmail.com',5567873005,'505 Pine St', 'Paris', 'Île-de-France', '75001', 'France'),
(default, 'Grace', 'Antony','graceantony@outlook.com',6325358425,'606 Oak St', 'Rome', 'Lazio', '00100', 'Italy'),
(default, 'Aaliya', 'Jacob','aaliyajacob@gmail.com',9945871236,'123 Main St', 'Los Angeles', 'California', '90001', 'USA'),
(default, 'Lily', 'Cooper','lillycooper@yahoo.com',5566778822,'303 Birch St', 'Berlin', 'Berlin', '10115', 'Germany'),
(default, 'James', 'Thomas','jamesthomas@outlook.com',22333448822,'789 Oak St', 'Madrid', 'Madrid', '28001', 'Spain'),
(default, 'Samuel', 'John','samueljohn@gmail.com',7778884446,'101 Pine St', 'Toronto', 'Ontario', 'M5A 1A1', 'Canada'),
(default, 'Isaac', 'Thomas','isaacthomas@yahoo.com',5262348596,'456 Elm St', 'San Francisco', 'California', '94101', 'USA'),
(default, 'Mariya', 'Jose','mariyajose@gmail.com',4585759562,'909 Elm St', 'Cape Town', 'Western Cape', '8000', 'South Africa'),
(default, 'Anjali', 'Joseph','anjalijoseph@outlook.com',9865242836,'909 Elm St', 'Mumbai', 'Maharashtra', '400001', 'India'),
(default, 'Alex', 'Paul','alexpaul@yahoo.com',8848265794,'707 Birch St', 'Tokyo', 'Tokyo', '100-0001', 'Japan' );

#1.view _ customer info
create view customer_info as select concat(First_name, ' ', Last_name) as Full_name,Email from Customer;
select * from customer_info;

#2.view of US customers
create view US_Customers as select * from customer where country = 'USA';
select * from us_customers;

#3.view_ customer details
create view customer_details as select concat(First_name, ' ', Last_name) as Full_name,
email,phone_no,state from Customer;
select * from customer_details;

#4.Update phone numbers of customers who live in California for Customer_details view.
update Customer set Phone_no = '9523252827' where State = 'California' and customer_id=3;
update Customer set Phone_no = '6677225566' where State = 'California' and customer_id=7;
select * from customer_details;

#5.states with more than 5 customers
select state,count(*) as Customer_Count from customer group by State having count(*) > 5;

#6.the number of customers in each state, based on the "state" column in the "customer_details" view.
select state,count(*) as Customer_Count from customer_details group by State;

#7.all the columns from the "customer_details" view, sorted by the "state" column in ascending order.
select * from customer_details order by state  asc;



