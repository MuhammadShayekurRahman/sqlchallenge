use movielens;

-- List the titles and release dates of movies released between 1983-1993 in reverse chronological order.
select m.title, m.release_date FROM genres g
inner join genres_movies gm on g.id=gm.genre_id
inner join movies m on gm.movie_id=m.id
inner join ratings r on m.id=r.movie_id
inner join users u on r.user_id=u.id
inner join occupations o on u.occupation_id=o.id
where m.release_date > "1983-01-01" and m.release_date <"1993-12-30"
order by release_date asc;


-- Without using LIMIT, list the titles of the movies with the lowest average rating.

select m.title, avg(r.rating) FROM genres g
inner join genres_movies gm on g.id=gm.genre_id
inner join movies m on gm.movie_id=m.id
inner join ratings r on m.id=r.movie_id
inner join users u on r.user_id=u.id
inner join occupations o on u.occupation_id=o.id
group by r.movie_id
order by avg(r.rating)
;
-- List the unique records for Sci-Fi movies where male 24-year-old students have given 5-star ratings.
select distinct r.id FROM genres g
inner join genres_movies gm on g.id=gm.genre_id
inner join movies m on gm.movie_id=m.id
inner join ratings r on m.id=r.movie_id
inner join users u on r.user_id=u.id
inner join occupations o on u.occupation_id=o.id
where g.id=15 and u.gender="m" and u.age=24 and r.rating=5
;
-- List the unique titles of each of the movies released on the most popular release day.



-- Find the total number of movies in each genre; list the results in ascending numeric order.