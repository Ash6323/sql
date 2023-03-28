<<<<<<< HEAD
create table Insta_pages 
(
	page_id int,
	page_name varchar(100) 
)

create table Insta_likes 
(
	user_id int,
	page_id int,
	liked_date datetime 
)

insert Insta_pages values
(20001, 'SQL Solutions'), (20045, 'Brain Exercises'), (20701, 'Tips for Data Analysts')

insert Insta_likes values
(111, 20001, '04/08/2022 00:00:00'), (121, 20045, '03/12/2022 00:00:00'), (156, 20001, '07/25/2022 00:00:00 ')

select * from Insta_pages
select * from Insta_likes

select page_id from Insta_pages 
	where page_id not in 
	(select distinct page_id from Insta_likes) 
	order by page_id
=======
create table Insta_pages 
(
	page_id int,
	page_name varchar(100) 
)

create table Insta_likes 
(
	user_id int,
	page_id int,
	liked_date datetime 
)

insert Insta_pages values
(20001, 'SQL Solutions'), (20045, 'Brain Exercises'), (20701, 'Tips for Data Analysts')

insert Insta_likes values
(111, 20001, '04/08/2022 00:00:00'), (121, 20045, '03/12/2022 00:00:00'), (156, 20001, '07/25/2022 00:00:00 ')

select * from Insta_pages
select * from Insta_likes

select page_id from Insta_pages 
where page_id not in 
	(select distinct page_id from Insta_likes) 
order by page_id
>>>>>>> 8e7005ae139e5b4c8bebf6b861314198b41d0b4d
