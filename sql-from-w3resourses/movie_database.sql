--BASIC exercises on movie Database

--1. From the following table, write a SQL query to find the name and year of the movies. Return movie title, movie release year. 
-- Sample table: movie
select mov_title, mov_year from Movies.Movie

--2. From the following table, write a SQL query to find when the movie 'American Beauty' released. Return movie release year.
-- Sample table: movie
select mov_year from Movies.Movie 
where mov_title = 'American Beauty'

--3. From the following table, write a SQL query to find the movie that was released in 1999. Return movie title.
-- Sample table: movie
select mov_title from Movies.Movie 
where mov_year = 1999

--4. From the following table, write a SQL query to find those movies, which were released before 1998. Return movie title.
-- Sample table: movie
select mov_title from Movies.Movie where mov_year < 1998

--5. From the following tables, write a SQL query to find the name of all reviewers and movies together in a single list.
-- Sample table: movie
-- Sample table: reviewer
select mov_title from Movies.Movie
union
select rev_name from Movies.Reviewer

--6. From the following table, write a SQL query to find all reviewers who have rated seven or more stars to their rating. Return reviewer name.
--Sample table: reviewer
--Sample table: rating
select rv.rev_name from Movies.Reviewer rv 
left join Movies.Rating rt on rv.rev_id = rt.rev_id
where rt.rev_stars >= 7

--7. From the following tables, write a SQL query to find the movies without any rating. Return movie title.
-- Sample table: movie
-- Sample table: rating
select mov_title from Movies.Movie m 
left join Movies.Rating r on m.mov_id = r.mov_id
where r.rev_stars is null

--8. From the following table, write a SQL query to find the movies with ID 905 or 907 or 917. Return movie title.
-- Sample table: movie
select mov_title from Movies.Movie
where mov_id in (905, 907, 917)

--9. From the following table, write a SQL query to find the movie titles that contain the word 'Boogie Nights'. 
--   Sort the result-set in ascending order by movie year. Return movie ID, movie title and movie release year.
-- Sample table: movie
select mov_id, mov_title, mov_year from Movies.Movie
where mov_title like '%Boogie Nights%'
order by mov_year asc

--10. From the following table, write a SQL query to find those actors with the first name 'Woody' and the last name 'Allen'. Return actor ID.
-- Sample table: actor
select act_id from Movies.Actor
where act_fname = 'Woody' and act_lname = 'Allen'

