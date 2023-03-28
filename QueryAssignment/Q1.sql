create table Candidates 
(
	candidate_id int,
	skill varchar(20) 
)

insert Candidates values (001,'C#')
insert Candidates values (001,'MVC')
insert Candidates values (001,'SQL')
insert Candidates values (145,'MVC')
insert Candidates values (145,'PowerBI')
insert Candidates values (145,'SQL')
insert Candidates values (345,'C#')
insert Candidates values (345,'MVC')
insert Candidates values (200,'SQL')

select * from Candidates

select candidate_id from Candidates 
	where skill in ('C#', 'MVC', 'SQL') 
	group by candidate_id 
	having count(candidate_id)>=3 
	order by candidate_id

