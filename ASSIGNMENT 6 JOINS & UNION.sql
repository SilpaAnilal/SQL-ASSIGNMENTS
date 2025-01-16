use country;
#1. inner join,left join,right join
#inner join
select p.first_name, p.last_name, p.rating, c.country_name, c.population, c.area
from persons p
inner join country c
on p.country_id = c.id;

#left join
select p.first_name, p.last_name, p.rating, c.country_name, c.population, c.area
from persons p
left join country c
on p.country_id = c.id;

#right join
select p.first_name, p.last_name, p.rating, c.country_name, c.population, c.area
from persons p
right join country c
on p.country_id = c.id;

#2. all distinct country names from both tables
select distinct country_name from country
union
select distinct country_name from persons;

#3. all country names from both tables including duplicates
select distinct country_name from country
union all
select distinct country_name from persons;

#4. round the ratings of all persons 
select first_name,last_name, country_name, ROUND(rating) as rounded_rating from persons;




