-- Exercise 1 --

-- From the following table, write a SQL query to find out where the final match of the EURO cup 2016 was played. Return venue name, city.

select v.venue_name, c.city from soccer.soccer_venue v
join soccer.soccer_city c
on v.city_id = c.city_id
join soccer.match_mast m
on v.venue_id = m.venue_id and play_stage = 'F'

-- Exercise 2 

-- From the following tables, write a SQL query to find the number of goals scored by each team in each match during normal play
-- Return match number, country name and goal score.

select * from soccer.match_details
select * from soccer.soccer_country

select match_no, country_name, goal_score from soccer.match_details m
join soccer.soccer_country c
on m.team_id = c.country_id
group by match_no, country_name, goal_score

-- Exercise 3 --

-- From the following table, write a SQL query to count the number of goals scored by each player within a normal play schedule. 
-- Group the result set on player name and country name and sorts the result-set according to the highest to the lowest scorer. 
-- Return player name, number of goals and country name.

select p.player_name, c.country_name, count(*) [number of goals] from soccer.goal_details g
join soccer.player_mast p
on g.player_id = p.player_id
join soccer.soccer_country c
on p.team_id = c.country_id
where goal_schedule = 'NT'
group by p.player_name, c.country_name
order by count(goal_id) desc

-- Exercise 4 --

-- From the following table, write a SQL query to find out who scored the most goals in the 2016 Euro Cup. Return player name, country name and highest individual scorer.

select top 1 p.player_name, c.country_name, count(p.player_name) [goals] from soccer.goal_details g
join soccer.player_mast p
on g.player_id = p.player_id
join soccer.soccer_country c
on p.team_id = c.country_id
group by p.player_name, c.country_name
order by count(*) desc

-- Exercise 5 --

-- From the following table, write a SQL query to find out who scored in the final of the 2016 Euro Cup. Return player name, jersey number and country name.

select p.player_name, p.jersey_no, s.country_name from soccer.goal_details g
join soccer.player_mast p
on g.player_id = p.player_id
join soccer.soccer_country s
on p.team_id = s.country_id
where play_stage = 'F'

-- Exercise 6 --

-- From the following tables, write a SQL query to find out which country hosted the 2016 Football EURO Cup. Return country name.

select * from soccer.goal_details
select * from soccer.soccer_venue
select * from soccer.soccer_country
select * from soccer.soccer_city

select country_name from soccer.soccer_country c
join soccer.soccer_city sc 
on c.country_id = sc.country_id
group by country_name

-- Exercise 7 --

-- From the following tables, write a SQL query to find out who scored the first goal of the 2016 European Championship. 
-- Return player_name, jersey_no, country_name, goal_time, play_stage, goal_schedule, goal_half.

select * from soccer.soccer_country
select * from soccer.player_mast
select * from soccer.goal_details

select player_name, jersey_no, country_name, goal_time, play_stage, goal_schedule, goal_half from soccer.player_mast p
join soccer.goal_details g
on p.player_id = g.player_id
join soccer.soccer_country c
on c.country_id = p.team_id
where goal_id = 1 

-- Exercise 8 -- 

-- From the following tables, write a SQL query to find the referee who managed the opening match. Return referee name, country name.

select referee_name, country_name from soccer.referee_mast r
join soccer.match_mast m
on r.referee_id = m.referee_id
join soccer.soccer_country c
on r.country_id = c.country_id
where match_no = 1

-- Exercise 9 --

-- From the following tables, write a SQL query to find the referee who managed the final match. Return referee name, country name.

select referee_name, country_name from soccer.referee_mast r
join soccer.match_mast m
on r.referee_id = m.referee_id
join soccer.soccer_country c
on r.country_id = c.country_id
where play_stage = 'F'

-- Execrcise 10 --

-- From the following tables, write a SQL query to find the referee who assisted the referee in the opening match. Return associated referee name, country name.

select * from soccer.asst_referee_mast
select * from soccer.soccer_country
select * from soccer.match_details

select ass_ref_name, country_name from soccer.asst_referee_mast r
join soccer.match_details m
on r.ass_ref_id = m.ass_ref
join soccer.soccer_country c
on r.country_id = c.country_id
where match_no = 1

-- Exercise 11 --

-- From the following tables, write a SQL query to find the referee who assisted the referee in the final match. Return associated referee name, country name.

select ass_ref_name, country_name from soccer.asst_referee_mast r
join soccer.match_details m
on r.ass_ref_id = m.ass_ref
join soccer.soccer_country c
on r.country_id = c.country_id
where play_stage = 'F'

-- Exercise 12 -- 

-- From the following table, write a SQL query to find the city where the opening match of EURO cup 2016 took place. Return venue name, city.

