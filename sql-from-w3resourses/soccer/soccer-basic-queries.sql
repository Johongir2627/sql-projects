--SQL W3Resources  --  
--Soccer database

use W3Resource
--1
select count(*) as count from SOCCER.soccer_venue



--2
select count(distinct team_id) as count from SOCCER.player_mast



--3
select count(*) as count from SOCCER.goal_details



--4
select count(*) from SOCCER.match_mast
where results = 'WIN'




--5
select count(*) from SOCCER.match_mast
where results = 'DRAW'




--6
select min(play_date) from SOCCER.match_mast





--7
select count(*) as own_goal from SOCCER.goal_details where goal_type = 'O'




--8
select count(*) as count from SOCCER.match_mast where play_stage = 'G' and results = 'win'





--9
select count(distinct match_no) from SOCCER.penalty_shootout





--10
select count(*) from SOCCER.match_mast where play_stage = 'R' and decided_by = 'P'





--11
select match_no, count(*) from SOCCER.goal_details where goal_schedule = 'nt'
group by match_no order by match_no




--12
select match_no, play_date, goal_score from SOCCER.match_mast where stop1_sec = 0




--13
select count(distinct match_no) from SOCCER.match_details where play_stage = 'g' and win_lose = 'd' and goal_score = 0





--14
select count(goal_score) from SOCCER.match_details where win_lose = 'w' and goal_score = 1 and decided_by <> 'P'





--15
select COUNT(*) from SOCCER.player_in_out where in_out = 'i'




--16
select COUNT(*) from SOCCER.player_in_out where in_out = 'i' and play_schedule = 'nt'





--17
select COUNT(*) from SOCCER.player_in_out where in_out = 'i' and play_schedule = 'st'




--18
select COUNT(*) from SOCCER.player_in_out where in_out = 'i' and play_half = 1 and play_schedule = 'nt'




--19
select count(distinct match_no) from SOCCER.match_details where goal_score = 0 and win_lose = 'd'




--20
select count(*) from SOCCER.player_in_out where in_out = 'i' and play_schedule = 'st'




--21
select play_half, play_schedule, count(*) from SOCCER.player_in_out where in_out = 'i' group by play_half, play_schedule order by play_half



--22
select count(*) from SOCCER.penalty_shootout 



--23
select count(*) from SOCCER.penalty_shootout where score_goal = 'y'



--24
select count(*) from SOCCER.penalty_shootout where score_goal = 'N'




--25
select ps.match_no, sc.country_name as Team, pm.player_name, pm.jersey_no, ps.score_goal, ps.kick_no from SOCCER.soccer_country sc 
join SOCCER.player_mast pm on sc.country_id = pm.team_id 
join SOCCER.penalty_shootout ps on pm.player_id = ps.player_id



--26.    From the following table, write a  SQL query to count the number of penalty shots taken by each team. Return country name, number of shots as "Number of Shots".
select * from SOCCER.soccer_country
select * from SOCCER.penalty_shootout

select sc.country_name, COUNT(*) from SOCCER.soccer_country sc join SOCCER.penalty_shootout ps on sc.country_id = ps.team_id group by sc.country_name



--27.   From the following table, write a SQL query to count the number of bookings in each half of play within the normal play schedule. Return play_half, play_schedule, number of booking happened.
select * from SOCCER.player_booked
select play_half, play_schedule, COUNT(*) from SOCCER.player_booked where play_schedule = 'nt' group by play_half, play_schedule



--28.  From the following table, write a  SQL query to count the number of bookings during stoppage time.
select * from SOCCER.player_booked
select count(*) from SOCCER.player_booked where play_schedule = 'st'


--29.  From the following table, write a  SQL query to count the number of bookings that happened in extra time.
select * from SOCCER.player_booked
select count(*) from SOCCER.player_booked where play_schedule = 'et'






select * from SOCCER.goal_details