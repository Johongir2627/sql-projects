-- Subqueries

--1. From the following table, write a SQL query to find the actors who played a role in the movie 'Annie Hall'. Return all the fields of actor table.
--Sample table: actor, movie_cast, movie
select * from Movies.Actor
where act_id in (
select mc.act_id from Movies.Movie_cast mc 
left join Movies.Movie m 
on mc.mov_id = m.mov_id
where m.mov_title = 'Annie Hall')

--2. From the following tables, write a SQL query to find the director of a film that cast a role in 'Eyes Wide Shut'. 
--   Return director first name, last name. 
-- Sample table: director, movie_direction, movie_cast, movie
select dir_fname, dir_lname from Movies.director
where dir_id in (
select dir_id from Movies.Movie_Direction where mov_id = any (
select mov_id from Movies.Movie where mov_title = 'Eyes Wide Shut'))

--3. From the following table, write a SQL query to find those movies that have been released in countries other than the United Kingdom. 
--Return movie title, movie year, movie time, and date of release, releasing country.
-- Sample table: movie
select mov_title, mov_year, mov_time, mov_dt_rel, mov_rel_country from Movies.Movie where mov_rel_country <> 'UK'

--4. From the following tables, write a SQL query to find for movies whose reviewer is unknown. 
-- Return movie title, year, release date, director first name, last name, actor first name, last name.
select m.mov_title, m.mov_year, m.mov_dt_rel, din.dir_fname, din.dir_lname, actor.act_fname, actor.act_lname from Movies.Movie m
left join (
select dr.*, direc.dir_fname, direc.dir_lname from Movies.Movie_Direction dr left join
(select * from Movies.Director) direc
on dr.dir_id = direc.dir_id
) din
on m.mov_id = din.mov_id
left join (
select mc.*, a.act_fname, a.act_lname from Movies.Movie_cast mc left join
(select * from Movies.Actor) a
on mc.act_id = a.act_id
) actor
on m.mov_id = actor.mov_id
left join (
select r.*, rw.rev_name from Movies.Rating r
left join (select * from Movies.Reviewer) rw
on r.rev_id = rw.rev_id) j
on m.mov_id = j.mov_id
where j.rev_name is null


--5. From the following tables, write a SQL query to find those movies directed by the director whose first name is Woddy and last name is Allen. 
--Return movie title.
select mov_title from Movies.Movie m
left join (
select md.*, d.dir_fname, d.dir_lname from Movies.Movie_Direction md
left join 
(select * from Movies.Director) d
on md.dir_id = d.dir_id ) j
on m.mov_id = j.mov_id


--6. From the following tables, write a SQL query to determine those years in which there was at least one movie that received a rating of at least three stars. 
--Sort the result-set in ascending order by movie year. Return movie year.
with cte as (
select m.*, r.num_o_ratings, r.rev_id, r.rev_stars,
count(m.mov_year) over(partition by m.mov_year order by m.mov_year) agg
from Movies.Movie m
left join (
select * from Movies.Rating where rev_stars >= 3) r
on m.mov_id = r.mov_id
where rev_stars is not null)
select mov_year from cte 
where agg > 0

--7. From the following table, write a SQL query to search for movies that do not have any ratings. Return movie title.
select m.mov_title from Movies.Movie m
left join
(select * from Movies.Rating) r
on m.mov_id = r.mov_id
where r.num_o_ratings is null or 
r.num_o_ratings = 0

--8. From the following table, write a SQL query to find those reviewers who have not given a rating to certain films. Return reviewer name.
SELECT DISTINCT rev_name 
FROM movies.reviewer 
WHERE rev_id IN (
  -- Subquery to find rev_id with rev_stars being NULL
  SELECT rev_id 
  FROM movies.rating 
  WHERE rev_stars IS NULL
)

--9. From the following tables, write a SQL query to find movies that have been reviewed by a reviewer and received a rating. 
--Sort the result-set in ascending order by reviewer name, movie title, review Stars. 
--Return reviewer name, movie title, review Stars.
select rev_name, mov_title, rev_stars 
from movies.reviewer, movies.rating, movies.movie 
where reviewer.rev_id = rating.rev_id 
  and movie.mov_id = rating.mov_id 
  and reviewer.rev_name is not null 
  and rating.rev_stars is not null 
order by rev_name, mov_title, rev_stars

--10. From the following table, write a SQL query to find movies that have been reviewed by a reviewer and received a rating. 
--   Group the result set on reviewer’s name, movie title. Return reviewer’s name, movie title.
select rev_name, mov_title 
from Movies.Reviewer re, Movies.Rating ra, Movies.Movie m, Movies.Rating r2
WHERE re.rev_id = ra.rev_id and ra.mov_id = m.mov_id and ra.rev_id = r2.rev_id
and re.rev_name is not null
group by rev_name, mov_title
having count(*) > 1

--11. From the following tables, write a SQL query to find those movies, which have received highest number of stars. 
--Group the result set on movie title and sorts the result-set in ascending order by movie title. 
--Return movie title and maximum number of review stars.
select mov_title, max(rev_stars) from Movies.Movie m
left join Movies.Rating r
on m.mov_id = r.mov_id
where r.rev_stars is not null
group by mov_title
order by mov_title

--12. From the following tables, write a SQL query to find all reviewers who rated the movie 'American Beauty'. Return reviewer name.
select *
from Movies.Reviewer
where rev_id IN (
    select rev_id
    from Movies.Rating
    where mov_id IN (
        select mov_id
        from Movies.Movie
        where mov_title = 'American Beauty'
    )
)

--13. From the following table, write a SQL query to find the movies that have not been reviewed by any reviewer body other than 'Paul Monks'. 
--   Return movie title.
select mov_title
from Movies.Movie
where mov_id IN (
    select mov_id
    from Movies.Rating
    where rev_id NOT IN (
        select rev_id
        from Movies.Reviewer
        where rev_name = 'Paul Monks'
    )
)

--14. From the following table, write a SQL query to find the movies with the lowest ratings. 
--		Return reviewer name, movie title, and number of stars for those movies. 
select re.rev_name, m.mov_title, r.rev_stars from Movies.Movie m
join Movies.Rating r 
on m.mov_id = r.mov_id
join Movies.Reviewer re
on r.rev_id = re.rev_id
where rev_stars = 
(
select min(rev_stars) from Movies.Movie m
join Movies.Rating r 
on m.mov_id = r.mov_id
join Movies.Reviewer re
on r.rev_id = re.rev_id
)

--15. From the following tables, write a SQL query to find the movies directed by 'James Cameron'. Return movie title.
select mov_title from Movies.Movie m
join Movies.Movie_Direction d
on m.mov_id = d.mov_id
join Movies.Director dr
on d.dir_id = dr.dir_id
where dr.dir_fname = 'James' and dr.dir_lname = 'Cameron'

