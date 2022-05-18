use sakila;
-- List all actors.
select concat(first_name, " ", last_name) as Actor_Name from actor;

-- Find the surname of the actor with the forename 'John'.

select first_name, last_name from actor where first_name="John";

-- Find all actors with surname 'Neeson'.

select first_name, last_name from actor where last_name="Neeson";

-- Find all actors with ID numbers divisible by 10.

select first_name, last_name, actor_id from actor where (actor_id % 10) = 0;
-- What is the description of the movie with an ID of 100?
select film_id, title, description from film where film_id=100;

-- Find every R-rated movie.

select distinct rating from film;
select title, rating from film where rating="R";
-- Find every non-R-rated movie.
select title, rating from film where rating !="R";
-- Find the ten shortest movies.
select title, length from film order by length asc limit 10;
-- Find the movies with the longest runtime, without using LIMIT.
select title, length from film order by length desc; -- finsih
-- Find all movies that have deleted scenes.
select title, special_features from film where special_features like "%deleted%scenes%";
-- Using HAVING, reverse-alphabetically list the last names that are not repeated.

select last_name from actor
group by last_name
having count(last_name)=1
order by last_name desc
;
-- Using HAVING, list the last names that appear more than once, from highest to lowest frequency.
select last_name, count(last_name) from actor
group by last_name
having count(last_name)>1
order by count(last_name) desc;

-- Which actor has appeared in the most films?
select f.actor_id, concat(a.first_name, " ", a.last_name) as Actor_Name, count(f.actor_id) as "# of Appearances" from film_actor f
join actor a on f.actor_id=a.actor_id
group by f.actor_id
order by count(f.actor_id) desc;

-- When is 'Academy Dinosaur' due?
select * from film where title like "Academy%Dinosa%";
select * from inventory where film_id=1;
select * from rental order by inventory_id asc limit 8;


select f.title, r.rental_id, date_add(r.rental_date,INTERVAL 6 DAY) as due_date from film f
left join inventory i on f.film_id=i.film_id
left join rental r on i.inventory_id=r.inventory_id
where f.film_id=1 && return_date is null and r.rental_id is not null;


-- What is the average runtime of all films?
select avg(length) from film;

-- List the average runtime for every film category.
select c.name, avg(f.length) from film f
join film_category fc on f.film_id=fc.film_id
join category c on fc.category_id=c.category_id
group by c.category_id;
-- List all movies featuring a robot.
select * from film where description like "%robot%";
-- How many movies were released in 2010?
select count(film_id) from film where release_year=2010;

-- Find the titles of all the horror movies.
select f.title, c.name from film f
join film_category fc on f.film_id=fc.film_id
join category c on fc.category_id=c.category_id
where c.name="Horror";
-- List the full name of the staff member with the ID of 2.
select concat(first_name, " ", last_name) as Fullname, staff_id from staff where staff_id=2;

-- List all the movies that Fred Costner has appeared in.
select f1.title, f.actor_id, concat(a.first_name, " ", a.last_name) as Actor_Name from film_actor f
join actor a on f.actor_id=a.actor_id
join film f1 on f1.film_id=f.film_id where a.first_name="Fred" and a.last_name="costner";
-- How many distinct countries are there?
select distinct count(country_id) from country;
-- List the name of every language in reverse-alphabetical order.
select name from language order by name desc;
-- List the full names of every actor whose surname ends with '-son' in alphabetical order by their forename.
select concat(first_name, " ", last_name) as Fullname from actor where last_name like "%son" order by first_name asc;
-- Which category contains the most films?
select c.name, count(f.title) from film f
join film_category fc on f.film_id=fc.film_id
join category c on fc.category_id=c.category_id
group by c.category_id
order by count(f.title) desc
limit 1;