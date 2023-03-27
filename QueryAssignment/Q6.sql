drop table Walmart_user_transactions

create table Walmart_user_transactions
(
	product_id int,
	user_id int,
	spend float,
	transaction_date datetime
)

insert Walmart_user_transactions values
(3673, 123, 68.90, '07/08/2022 12:00:00'),
(9623, 123, 274.10, '07/08/2022 12:00:00'),
(1467, 115,19.90, '07/08/2022 12:00:00'),
(2513, 159, 25.00, '07/08/2022 12:00:00'),
(1452, 159, 74.50, '07/10/2022 12:00:00'),
(3473, 123,55.60, '07/11/2022 12:00:00'),
(1345, 123,20.04, '07/11/2022 12:00:00'),
(1245, 115,15.50, '07/15/2022 12:00:00')

select * from Walmart_user_transactions

--Using Rank Method

select max(transaction_date) as most_recent_transaction_date, user_id, count(user_id) as number_of_products from
	(select * from (select transaction_date, user_id, product_id, rank() over 
	(partition by user_id order by transaction_date desc) as days_rank 
	from Walmart_user_transactions) as a where days_rank=1) as b group by user_id order by most_recent_transaction_date

--select transaction_date, user_id, product_id, rank() over 
--	(partition by user_id order by transaction_date desc) as days_rank
--	from Walmart_user_transactions

--select * from (select transaction_date, user_id, product_id, rank() over 
--	(partition by user_id order by transaction_date desc) as days_rank
--	from Walmart_user_transactions) as a where days_rank=1

--Using Row_Number Method (Not needed, but kept for reference)

select user_id, count(user_id) from (select transaction_date, user_id, product_id, row_number() over 
	(partition by user_id order by transaction_date desc) as shopping_days 
	from Walmart_user_transactions) as transactions group by user_id

select transaction_date, user_id, product_id, row_number() over 
	(partition by user_id order by transaction_date desc) as transaction_number 
	from Walmart_user_transactions

select transaction_date, count(transaction_date) as num_of_products, user_id from (select transaction_date, user_id, product_id, row_number() over 
	(partition by user_id order by transaction_date desc) as transaction_number 
	from Walmart_user_transactions) as b group by user_id, transaction_date order by transaction_date desc

select transaction_date, num_of_products, row_number() over (partition by user_id order by transaction_date desc) as Day from
(select transaction_date, count(transaction_date) as num_of_products, user_id from (select transaction_date, user_id, product_id, row_number() over 
	(partition by user_id order by transaction_date desc) as transaction_number 
	from Walmart_user_transactions) as b group by user_id, transaction_date order by transaction_date desc) as c
