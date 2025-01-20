select * from movies.movie
--Exercise 1 --

-- From the following table, write a SQL query to find the name and year of the movies. Return movie title, movie release year.

select mov_title, mov_year from movies.movie

-- Exercise 2 --

-- From the following table, write a SQL query to find when the movie 'American Beauty' released. Return movie release year.

select mov_year from movies.movie
where mov_title = 'American Beauty'

-- Exercise 3 --

-- From the following table, write a SQL query to find the movie that was released in 1999. Return movie title.

select mov_title from movies.movie
where mov_year = 1999

-- Exercise 4 --

-- From the following table, write a SQL query to find those movies, which were released before 1998. Return movie title.

select mov_title from movies.movie
where mov_year < 1998

-- Exercise 5 --

-- From the following tables, write a SQL query to find the name of all reviewers and movies together in a single list.

select mov_title as rev_name from movies.movie
union
select rev_name from movies.reviewer

-- Exercise 6 --

-- From the following table, write a SQL query to find all reviewers who have rated seven or more stars to their rating. Return reviewer name.

select rev_name from movies.reviewer
where rev_id in (
				select rev_id from movies.rating
					where rev_stars > 7
				)

-- Exercise 7 --

-- From the following tables, write a SQL query to find the movies without any rating. Return movie title.

select rev_name from movies.reviewer 
where rev_id not in (select rev_id from movies.rating
					where rev_stars is  not null)

-- Exercise 8 -- 

-- From the following table, write a SQL query to find the movies with ID 905 or 907 or 917. Return movie title.

select * from movies.movie
where mov_id in (905,907,917)

-- Exercise 9 --

-- From the following table, write a SQL query to find the movie titles that contain the word 'Boogie Nights'. 
-- Sort the result-set in ascending order by movie year. 
-- Return movie ID, movie title and movie release year.

select mov_id, mov_title, mov_year from movies.movie
where mov_title = 'Boogie Nights'
order by mov_year

-- Exercise 10 --

-- From the following table, write a SQL query to find those actors with the first name 'Woody' and the last name 'Allen'. Return actor ID.

select act_id from movies.actor
where act_fname = 'Woody' and act_lname = 'Allen'
