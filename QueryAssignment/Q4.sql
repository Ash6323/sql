create table Uber_transactions
(
	user_id int,
	spend float,
	transaction_date datetime
)

insert Uber_transactions values
(111, 100.50, '01/08/2022 12:00:00'), (111, 55.00,'01/10/2022 12:00:00'), (121, 36, '01/18/2022 12:00:00'),
(145, 24.99, '01/26/2022 12:00:00 '), (111, 89.60, '02/05/2022 12:00:00')

--select * from (select spend from Uber_transactions group by user_id) as a order by transaction_date

--select user_id, spend from Uber_transactions group by user_id, spend

select user_id, spend from 
	(select user_id, spend, ROW_NUMBER() over 
	(partition by user_id order by transaction_date) as RowNumber 
	from Uber_transactions) as user_spend 
where RowNumber = 3