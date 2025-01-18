use country;

#1.adding a new column DOB in persons table
alter table persons
add DOB date;
desc persons;

#2.user-defined function to calculate age using DOB
delimiter //
create function CalculatedAge (DOB date)
returns int
deterministic
no sql
begin
return datediff(current_date, DOB)/365;
end //
delimiter ;

#3.age of all persons
# inserting values in DOB table
update persons set DOB = '1990-01-15'where id = 1;
update persons set DOB = '2000-03-20'where id = 2;
update persons set DOB = '1990-06-30'where id = 3;
update persons set DOB = '1999-11-25'where id = 4;
update persons set DOB = '1997-08-02'where id = 5;
update persons set DOB = '1996-01-31'where id = 6;
update persons set DOB = '1993-10-20'where id = 7;
update persons set DOB = '2001-07-14'where id = 8;
update persons set DOB = '1991-02-28'where id = 9;
update persons set DOB = '1995-04-20'where id = 10;
update persons set DOB = '1992-01-20'where id = 11;
update persons set DOB = '1993-10-05'where id = 12;

#Age
select ID, first_name, last_name, DOB, CalculatedAge(DOB) as Age from Persons;

#4.length of each country name in the Country table
delimiter //
create function CountryNameLength(country_name varchar(50))
returns int 
deterministic
no sql
begin
return length(country_name);
end //
delimiter ;

select country_name,CountryNameLength(country_name) as length_of_country_name from country;

#5.first 3 characters of each country's name 
select country_name,substr(country_name,1,3) as First_Three_Chars from Country;

#6.country names to uppercase and to lowercase 
select country_name, UPPER(country_name) as uppercase, lower(country_name) as lowercase from country;
