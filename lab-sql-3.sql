use sakila;


#How many distinct (different) actors' last names are there?
select * from actor;
select count(distinct last_name) from actor;

#In how many different languages where the films originally produced? (Use the column language_id from the film table)
select * from film; 
select count(distinct language_id) from film;

#How many movies were released with "PG-13" rating?
select * from film; 
select count(*) from film where rating="PG-13" ;

#Get 10 the longest movies from 2006.
select * from film; 
select * from film order by length desc limit 10; 


#How many days has been the company operating (check DATEDIFF() function)?
select * from rental;
select datediff(last_update, rental_date);

#Show rental info with additional columns month and weekday. Get 20.
select * from rental;
select *, convert(date, date) as month from rental; 
select date_format(convert(substring(rental_date, 1,6), date), "%M") from rental;
#Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
#How many rentals were in the last month of activity?