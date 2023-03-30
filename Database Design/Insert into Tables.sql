
insert genders values
	('Male', '06/15/2022 12:00:00', 25, '06/30/2022 12:00:00', 10, 1),
	('Female', '06/15/2022 12:00:00', 25, '06/30/2022 12:00:00', 10, 1)

insert employee_details values
	('Ashwin', 'Kumar', 'abc@gmail.com', '1234567890', 21, 1, '07/16/2001', '06/15/2022 12:00:00', '06/30/2022 12:00:00', 33, 1),
	('Piyush', 'Khairnar', 'bcd@gmail.com', '1234567880', 21, 1, '01/15/2001', '06/15/2022 12:00:00', '06/30/2022 12:00:00', 35, 1),
	('Preeti', 'Rajguru', 'preeti123@gmail.com', '12345567890', 21, 2, '01/30/2001', '06/15/2022 12:00:00', '06/30/2022 12:00:00', 38, 1),
	('Karishma', 'Chavan', 'k@gmail.com', '1234607890', 21, 2, '09/20/2000', '06/15/2022 12:00:00', '06/30/2022 12:00:00', 24, 1)

insert states values
	('New Delhi', '01/01/2022 12:00:00', 30, '01/30/2022 12:00:00', 50, 1),
	('Maharashtra', '01/01/2022 12:00:00', 30, '01/30/2022 12:00:00', 50, 1),
	('Karnataka', '01/01/2022 12:00:00', 30, '01/30/2022 12:00:00', 50, 1)

insert countries values
	('India', '01/01/2022 12:00:00', 30, '01/30/2022 12:00:00', 50, 1)

insert cities values
	('New Delhi', 1, 1, '01/01/2022 12:00:00', 30, '01/30/2022 12:00:00', 50, 1),
	('Pune', 2, 1, '01/01/2022 12:00:00', 30, '01/30/2022 12:00:00', 50, 1),
	('Mumbai', 2, 1, '01/01/2022 12:00:00', 30, '01/30/2022 12:00:00', 50, 1),
	('Bangalore', 3, 1, '01/01/2022 12:00:00', 30, '01/30/2022 12:00:00', 50, 1)

insert employee_address values
	(1, 'temporary', 'Chintamani Chowk, Akurdi', 'Pimpri-Chinchwad', 2, '411033', '06/15/2022 12:00:00', 28 ,'06/30/2022 12:00:00', 40, 1),
	(1, 'permanent', 'Sector 13', 'Vasundhara', 1, '201012', '06/15/2022 12:00:00', 28 ,'06/30/2022 12:00:00', 40, 1)

insert courses values
	('BSc Computer Science', 'UG', '06/15/2022 12:00:00', 28 ,'06/30/2022 12:00:00', 40, 1),
	('MCA', 'PG', '06/15/2022 12:00:00', 28 ,'06/30/2022 12:00:00', 40, 1)

insert employee_education values
	(1, 1, '06/15/2022 12:00:00', 28 ,'06/30/2022 12:00:00', 40, 1),
	(1, 2, '06/15/2022 12:00:00', 28 ,'06/30/2022 12:00:00', 40, 1)
	
insert employee_image values
	(1, 'F:\Resource Folder\Image5MB.jpg', '06/15/2022 12:00:00', 28 ,'06/30/2022 12:00:00', 40, 1)

select * from genders
select * from employee_details
select * from states
select * from countries
select * from cities
select * from employee_address
select * from courses
select * from employee_education
select * from employee_image

select first_name, lastname, email, contact_number, age, gender, address_type, street_2, city_name, course_name, image 
	from 
	employee_details as ed 
	inner join 
	genders as g on ed.gender_id = g.id
	inner join
	employee_address as ea on ea.employee_id = ed.id
	inner join 
	cities as c on c.id = ea.city_id
	inner join
	employee_education as ee on ee.employee_id = ed.id
	inner join 
	courses as co on co.id = ee.course_id
	inner join
	employee_image as ei on ei.employee_id = ed.id
	where
	city_name = 'Pune'