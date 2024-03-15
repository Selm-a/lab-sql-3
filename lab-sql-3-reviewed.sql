
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


#How many days has been the company operating (check DATEDIFF() function)? !!!!!!!!
select * from rental;
select (datediff(max(rental_date)), min(rental_date))) from rental;

select * from store; 

#Show rental info with additional columns month and weekday. Get 20. !!!!!!!!
select * from rental;
select *, date_format(rental_date, "%M") from rental;
select *, date_format(rental_date, "%W") from rental;
Select *, date_format(rental_date, "%M") as month, date_format(rental_date, "%W") as weekday from rental ;

#Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
select * from rental;
select 
	date_format(rental_date, "%W") as weekday,
    case
		when date_format(rental_date, "%W") in ('Sunday', 'Saturday') then "Weekend" else "workday"
	end as day_type
    from rental;
    
#How many rentals were in the last month of activity? !!!!!!

select * from rental;
select
	date_format(rental_date, "%Y-%m") as rental_year_month,
    count(rental_id) as total_rental
from rental
group by rental_year_month
order by date_format(rental_date, "%Y-%m") desc
limit 1;

