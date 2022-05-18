use world;
-- Using COUNT, get the number of cities in the USA.
select distinct count(Name) as `# USA Cities` from city where CountryCode="USA";

-- Find out the population and life expectancy for people in Argentina.

select name, Population, LifeExpectancy from country where code="ARG";

-- Using IS NOT NULL, ORDER BY, and LIMIT, which country has the highest life expectancy?

select name, LifeExpectancy from country where LifeExpectancy is not null order by LifeExpectancy desc limit 1;

-- Using JOIN ... ON, find the capital city of Spain.



select * from city;
select * from country;



select c.name, k.name from city c
join country k on c.CountryCode=k.Code where k.Capital=c.ID && k.code="ESP";



-- Using JOIN ... ON, list all the languages spoken in the Southeast Asia region.

select DISTINCT `Language` from countrylanguage cl
join country k on k.code=cl.countrycode where region="Southeast Asia";

-- Using a single query, list 25 cities around the world that start with the letter F.

select `name` from city where `name` like "f%" limit 25;

-- Using COUNT and JOIN ... ON, get the number of cities in China.

select distinct count(c.name) as number_of_cities_china from city c
join country k on c.countrycode=k.code where k.code="CHN";

-- Using IS NOT NULL, ORDER BY, and LIMIT, which country has the lowest population? Discard non-zero populations.

select name, population from country where population>0 && population is not null order by population asc limit 1;

-- Using aggregate functions, return the number of countries the database contains.

select distinct count(code) as "# of Countries" from country;

-- What are the top ten largest countries by area?

select name, surfacearea from country order by surfacearea desc limit 10;

-- List the five largest cities by population in Japan.

select * from country where name like "japan";
select name, population from city where countrycode="JPN" order by population desc limit 5;

-- List the names and country codes of every country with Elizabeth II as its Head of State. You will need to fix the mistake first!
			select headofstate from country where code="GBR"; -- Finding head of state, as Elizabeth II was missing
			select distinct name, code, headofstate from country where headofstate='Elisabeth II'; -- Find all
			update country
			set headofstate="Elizabeth II" where headofstate="Elisabeth II";  -- Fix spelling
select distinct name, code, headofstate from country where headofstate='Elizabeth II';
-- List the top ten countries with the smallest population-to-area ratio. Discard any countries with a ratio of 0.

select name, population, surfacearea, population/surfacearea as Ratio from country where population/surfacearea>0 order by population/surfacearea asc limit 10;

-- List every unique world language.

select distinct language from countrylanguage;

-- List the names and GNP of the world's top 10 richest countries.

select name, gnp from country order by gnp desc limit 10;

-- List the names of, and number of languages spoken by, the top ten most multilingual countries.


select countrycode, count(language) from countrylanguage group by countrycode order by count(language) desc limit 10;

select cl.countrycode, k.name, count(cl.language) from countrylanguage cl
join country k on cl.countrycode=k.code group by k.code order by count(cl.language) desc limit 10; 

-- List every country where over 50% of its population can speak German.

select countrycode, percentage from countrylanguage where language="german" and percentage>0.5;


-- Which country has the worst life expectancy? Discard zero or null values.

select name, lifeexpectancy from country where lifeexpectancy>0 order by lifeexpectancy asc limit 1;

-- List the top three most common government forms.

select governmentform, count(governmentform) from country group by governmentform order by count(governmentform) desc limit 3;

-- How many countries have gained independence since records began?

select count(indepyear) from country where indepyear is not null;