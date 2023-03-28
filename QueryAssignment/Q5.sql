<<<<<<< HEAD
create table artists
(
	artist_id int,
	artist_name varchar(20)
)
insert artists values (101, 'Ed Sheeran'), (120, 'Drake')

create table songs
(
	song_id int,
	artist_id int
)
insert songs values (45202, 101), (19960, 120)

create table music_charts
(
	day int,
	song_id int,
	rank int
)
insert music_charts values (1, 45202, 5), (3, 45202, 2), (1, 19960, 3), (9, 19960, 15)

select top 1 p1.artist_name, count(p1.artist_name) as song_appearances 
from 
	artists as p1 inner join songs as p2 
		on p1.artist_id = p2.artist_id 
	inner join music_charts as p3 
		on p2.song_id=p3.song_id
where rank<= 10 
group by p1.artist_name 
order by song_appearances desc

=======
create table artists
(
	artist_id int,
	artist_name varchar(20)
)
insert artists values (101, 'Ed Sheeran'), (120, 'Drake')

create table songs
(
	song_id int,
	artist_id int
)
insert songs values (45202, 101), (19960, 120)

create table music_charts
(
	day int,
	song_id int,
	rank int
)
insert music_charts values (1, 45202, 5), (3, 45202, 2), (1, 19960, 3), (9, 19960, 15)

select top 1 p1.artist_name, count(p1.artist_name) as song_appearances 
from 
	artists as p1 inner join songs as p2 
		on p1.artist_id = p2.artist_id 
	inner join music_charts as p3 
		on p2.song_id=p3.song_id
where rank<= 10 
group by p1.artist_name 
order by song_appearances desc

>>>>>>> 8e7005ae139e5b4c8bebf6b861314198b41d0b4d
