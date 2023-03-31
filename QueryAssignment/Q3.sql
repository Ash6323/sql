create table Job_listings
(
	job_id int,
	company_id int,
	title varchar(50),
	description varchar(max)
)

insert Job_listings values
(248, 827, 'Business Analyst', 'Business analyst evaluates past and current business 
								data with the primary goal of improving decision-making 
								processes within organizations.'), 
(149, 845, 'Business Analyst', 'Business analyst evaluates past and current business
								data with the primary goal of improving decision-making
								processes within organizations.'), 
(945, 345, 'Data Analyst', 'Data analyst reviews data to identify key insights into a business
							customers and ways the data can be used to solve problems.'),
(164, 345, 'Data Analyst', 'Data analyst reviews data to identify key insights into a business
							customers and ways the data can be used to solve problems.'),
(172, 244, 'Data Engineer', 'Data engineer works in a variety of settings to build systems 
							that collect, manage, and convert raw data into usable information 
							for data scientists and business analysts to interpret. ')

select count(*) as CompanyCount 
from 
	(select distinct company_id from Job_listings 
	group by company_id, title, description 
	having count(*) >1) 
	as CompanyCount
