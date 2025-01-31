--create database players

create table players 
(	playerid int primary key,
	name varchar(20),
	dateofbirth date,
	countryid int foreign key references countries(countryid),
	position varchar(20),
	height float,
	weight float
)

create table countries
(	countryid int primary key,
	countryname varchar(20)
)

create table clubs
(	
	clubid int primary key,
	clubname varchar(20),
	city varchar(20),
	countryid int foreign key references countries(countryid),
	headcoach varchar(20)
)

create table players_clubs(
	playerid int foreign key references players(playerid),
	clubid int foreign key references clubs(clubid),
	dateofstart date,
	dateofend date,
	playernumber int
)

create table stadiums(
	stadiumid int primary key,
	name varchar(20),
	city varchar(20),
	capacity int
)
 
 select * from stadiums

update stadiums 
set countryid = stadiumid
where countryid = 1

create table leagues(
	leagueid int primary key,
	name varchar(20),
	countryid int foreign key references countries(countryid)
)

create table matches(
	matchid int primary key,
	homeclubid int foreign key references clubs(clubid),
	guestclubid int foreign key references clubs(clubid),
	stadiumid int foreign key references stadiums(stadiumid),
	dateofmatch date,
	leagueid int foreign key references leagues(leagueid)
)

create table stats(
	matchid int foreign key references matches(matchid),
	result varchar(20),
	numberfouls int,
	corners int,
	possession int,
	shotsontarget int
)

create table referees(
	refereeid int primary key,
	name varchar(20),
	countryid int foreign key references countries(countryid)
)

create table matches_referees(
	matchid int foreign key references matches(matchid),
	refereeid int foreign key references referees(refereeid)
)


select * from players

insert into players values
(1, 'Lionel Messi', '1987-06-24', 1, 'forward', 170, 72),
(2, 'Cristiano Ronaldo', '1985-02-05', 2, 'forward', 187, 83),
(3, 'Neymar Jr', '1992-02-05', 3, 'forward', 175, 68),
(4, 'Kevin De Bruyne', '1991-06-28', 4, 'midfielder', 181, 70),
(5, 'Virgil van Dijk', '1991-07-08', 5, 'defender', 193, 92)

select * from countries

insert into countries values
(1, 'Argentina'),
(2, 'Portugal'),
(3, 'Brazil'),
(4, 'Belgium'),
(5, 'Netherlands')

select * from clubs

insert into clubs values
(1, 'Barcelona', 'Barcelona', 1, 'Hansi Flick'),
(2, 'Manchester United', 'Manchester', 2, 'Ruben Amorim'),
(3, 'Paris Saint-Germain', 'Paris', 3, 'Luis Enrique'),
(4, 'Manchester City', 'Manchester', 4, 'Josep Pep Guardiola'),
(5, 'Liverpool', 'Liverpool', 5, 'Arne Slot')

select * from players
select * from countries
select * from players_clubs
select * from stadiums
select * from leagues
select * from matches
select * from stats
select * from referees
select * from matches_referees

insert into players_clubs values
(1, 1, '2004-07-01', '2021-08-10', 10),
(2, 2, '2003-08-12', '2009-06-30', 7),
(3, 3, '2017-08-03', '2023-07-01', 10),
(4, 4, '2015-08-30', null, 17),
(5, 5, '2013-07-01', '2018-07-01', 4)

insert into stadiums values
(1, 'Camp Nou', 'Barcelona', 99354),
(2, 'Old Trafford', 'Manchester', 74310),
(3, 'Parc des Princes', 'Paris', 48712),
(4, 'Allianz Arena', 'Munich', 75024),
(5, 'Anfield', 'Liverpool', 61276)

insert into leagues values
(1, 'La Liga', 1),
(2, 'Premier League', 2),
(3, 'Ligue 1', 3),
(4, 'Premier League', 4),
(5, 'Premier League', 5)

insert into matches values 
(1, 1, 2, 1, '2024-02-15', 1),
(2, 3, 4, 3, '2024-03-10', 3),
(3, 2, 5, 2, '2024-04-05', 2),
(4, 4, 1, 4, '2024-05-20', 4),
(5, 5, 3, 5, '2024-06-08', 5)

insert into stats values
(1, '2-1', 12, 5, 58, 7),
(2, '0-3', 8, 4, 45, 3),
(3, '1-1', 10, 6, 52, 5),
(4, '4-2', 15, 7, 60, 10),
(5, '2-0', 9, 3, 55, 6)

insert into referees values 
(1, 'Pierluigi Collina', 1),
(2, 'Howard Webb', 2),
(3, 'Bjorn Kuipers', 5),
(4, 'Nestor Pitana', 3),
(5, 'Felix Brych', 4)

insert into matches_referees values 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5)


select p.name, c.countryname country, p.position, pc.playernumber number, s.city, l.name, m.dateofmatch, st.result, r.name from countries c
join players p
on c.countryid = p.countryid
join players_clubs pc
on p.playerid = pc.playerid
join stadiums s
on c.countryid = s.countryid
join leagues l
on s.countryid = l.countryid
join matches m
on l.leagueid = m.leagueid
join stats st
on m.matchid = st.matchid
join referees r
on l.countryid = r.countryid
