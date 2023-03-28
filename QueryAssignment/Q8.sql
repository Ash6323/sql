create table facebook_user_actions
(
	user_id int,
	event_id int,
	event_type varchar(20),
	event_date datetime
)

insert facebook_user_actions values
(742, 3124, 'like', '04/12/2022 12:00:00'),
(648, 3124, 'like', '05/18/2022 12:00:00'),
(445, 7765,'sign-in', '05/25/2022 12:00:00'),
(445, 3634,'like', '05/31/2022 12:00:00'),
(742, 6458, 'sign-in', '06/03/2022 12:00:00'),
(445, 3634, 'like', '06/05/2022 12:00:00'),
(742, 1374, 'comment', '06/05/2022 12:00:00'),
(648, 3124, 'like', '06/18/2022 12:00:00'),
(648, 3124, 'like', '07/10/2022 12:00:00'),
(648, 1374, 'comment', '07/20/2022 12:00:00')

select user_id, event_type, month(event_date) as month from facebook_user_actions 

select user_id, event_type, month(event_date) as month, rank() over (partition by user_id order by month(event_date)) as actions
	from facebook_user_actions where month(event_date) in (5,6)

select month, count(distinct user_id) as monthly_active_users from
	(select user_id, event_type, month(event_date) as month, rank() over (partition by user_id order by month(event_date)) as actions
	from facebook_user_actions where month(event_date) in (5,6) and event_type in ('sign-in','like','comment')) as a where a.actions>1 group by month
