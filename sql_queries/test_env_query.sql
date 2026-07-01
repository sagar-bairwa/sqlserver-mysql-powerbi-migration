CREATE DATABASE Test_env

use test_env

select * from INFORMATION_SCHEMA.tables

select * from products

select * from [Test+Environment+Inventory+Dataset]

-------------------------------------------------------------------

--applying left join in the table

select *
from Products as a
left join [Test+Environment+Inventory+Dataset] as b
on a.Product_ID = b.Product_ID


--well structured
SELECT 
	a.Product_ID,
	b.Product_Name,
	b.Unit_Price,
	a.Order_Date_DD_MM_YYYY,
	a.Availability,
	a.Demand
FROM 
	[Test+Environment+Inventory+Dataset] AS a
LEFT JOIN 
	Products AS b
ON 
	a.Product_ID = b.Product_ID


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
		[Test+Environment+Inventory+Dataset] AS a
	LEFT JOIN 
		Products AS b
	ON 
		a.Product_ID = b.Product_ID
	) x

select * from new_table    --drop table new_table
