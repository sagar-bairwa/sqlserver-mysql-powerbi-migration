--Creating Production environment

create database Prod_env

use Prod_env


-- checking prod_environment
select * from [Prod+Env+Inventory+Dataset]
select * from Products

select distinct Product_ID 
from [Prod+Env+Inventory+Dataset]

select distinct Product_ID 
from Products


-- product_id = 21 is 7
-- product_id = 22 is 11

--Cleaning dataset

update [Prod+Env+Inventory+Dataset]
set Product_ID = 7 where Product_ID = 21

update [Prod+Env+Inventory+Dataset]
set Product_ID = 11 where Product_ID = 22


-- validating dataset
select distinct Product_ID from [Prod+Env+Inventory+Dataset]


--Creating same combined table schema using joins as test environment

--copy the result into new table

select * into new_table 
from (
	SELECT 
		a.Product_ID,
		b.Product_Name,
		b.Unit_Price,
		a.Order_Date_DD_MM_YYYY,
		a.Availability,
		a.Demand
	FROM 
		[Prod+Env+Inventory+Dataset] AS a
	LEFT JOIN 
		Products AS b
	ON 
		a.Product_ID = b.Product_ID
	) x

select * from new_table   --drop table new_table



