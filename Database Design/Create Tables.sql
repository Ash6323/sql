create table genders
	(
		id int primary key identity(1,1),
		gender varchar(20) not null,
		created_at datetime not null default getdate(),
		created_by int not null,
		updated_at datetime not null default getdate(),
		updated_by int not null,
		is_active int not null check(is_active = 0 or is_active = 1)
	)
create table employee_details
	(
		id int primary key identity(1,1),
		first_name varchar(20) not null,
		lastname varchar(20) not null,
		email nvarchar(40) not null unique,
		contact_number varchar(15) unique not null,
		age int not null check(age>=18 and age<=60),
		gender_id int foreign key references genders(id),
		date_of_birth date not null default cast(getdate() as date),
		created_at datetime not null default getdate(),
		updated_at datetime not null default getdate(),
		updated_by int not null,
		is_active int not null check(is_active = 0 or is_active = 1)
	)

--drop table employee_details
--alter table employee_details alter column email nvarchar(40)
--exec sp_help employee_details
--drop table employee_address
--drop table employee_education
--drop table employee_image

create table states
	(
		id int primary key identity(1,1),
		state_name varchar(50) not null,
		created_at datetime not null default getdate(),
		created_by int not null,
		updated_at datetime not null default getdate(),
		updated_by int not null,
		is_active int not null check(is_active = 0 or is_active = 1)
	)
create table countries
	(
		id int primary key identity(1,1),
		country_name varchar(50) not null,
		created_at datetime not null default getdate(),
		created_by int not null,
		updated_at datetime not null default getdate(),
		updated_by int not null,
		is_active int not null check(is_active = 0 or is_active = 1)
	)
create table cities
	(
		id int primary key identity(1,1),
		city_name varchar(50) not null,
		state_id int foreign key references states(id),
		country_id int foreign key references countries(id),
		created_at datetime not null default getdate(),
		created_by int not null,
		updated_at datetime not null default getdate(),
		updated_by int not null,
		is_active int not null check(is_active = 0 or is_active = 1)
	)
create table employee_address
	(
		id int primary key identity(1,1),
		employee_id int foreign key references employee_details(id),
		address_type varchar(9) not null check(address_type = 'permanent' or address_type = 'temporary'),
		street_1 varchar(250) not null,
		street_2 varchar(250),
		city_id int foreign key references cities(id),
		zipcode varchar(10) not null,
		created_at datetime not null default getdate(),
		created_by int null,
		updated_at datetime not null default getdate(),
		updated_by int not null,
		is_active int not null check(is_active = 0 or is_active = 1)
	)
create table courses
	(
		id int primary key identity(1,1),
		course_name varchar(50) not null,
		degree_level varchar(15) not null,
		created_at datetime not null default getdate(),
		created_by int not null,
		updated_at datetime not null default getdate(),
		updated_by int not null,
		is_active int not null check(is_active = 0 or is_active = 1)
	)
create table employee_education
	(
		id int primary key identity(1,1),
		employee_id int foreign key references employee_details(id),
		course_id int foreign key references courses(id),
		created_at datetime not null default getdate(),
		created_by int not null,
		updated_at datetime not null default getdate(),
		updated_by int not null,
		is_active int not null check(is_active = 0 or is_active = 1)
	)

create table employee_image
	(
		id int primary key identity(1,1),
		employee_id int foreign key references employee_details(id),
		image varchar(500) not null,
		created_at datetime not null default getdate(),
		created_by int not null,
		updated_at datetime not null default getdate(),
		updated_by int not null,
		is_active int not null check(is_active = 0 or is_active = 1)
	)
