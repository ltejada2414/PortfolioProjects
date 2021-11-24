Select *
from dbo.general_store_sample_data

 --Looking at only the United States, France, and Spain, what was the median revenue in 2013? 

WITH Revenue1 AS (select Sum(revenue) As US_FR_SP_Revenue
From dbo.general_store_sample_data
where country = 'US' Or country = 'FR' OR country='ES' AND year = 2013)
Select AVG(US_FR_SP_Revenue) AS Median_Revenue
From Revenue1

select AVG(revenue) As US_FR_SP_Revenue
From dbo.general_store_sample_data
where country = 'US' Or country = 'FR' OR country='ES' AND year = 2013

select Sum(revenue) As US_FR_SP_Revenue
From dbo.general_store_sample_data
where country = 'US' Or country = 'FR' OR country='ES' AND year = 2012

select product_group, year, country, revenue
From dbo.general_store_sample_data
where (country = 'US' Or country = 'FR' OR country='ES') AND year= '2013'
Order by  Revenue DESC

-- Was it more or less than 2012?\

select product_group, year, country, revenue
From dbo.general_store_sample_data
where (country = 'US' Or country = 'FR' OR country='ES') AND year= '2012'
Order by  Revenue DESC

-- Looking now at all countries, which product group had the biggest decline in median revenue from 2013 to 2014, by dollar amount?

Select country, year, product_group, Revenue
from dbo.general_store_sample_data
where year Between '2013' AND '2014'
order by product_group, year, Revenue DESC

--creating TEMP TABLE
DROP TABLE IF EXISTS #Temp_automobile2013
Create table #Temp_automobile2013
(Product_group varchar(255),
country nvarchar(255),
year float,
revenue float,
Row# INT)


INSERT INTO #Temp_automobile2013
select *, ROW_NUMBER() Over (Order by revenue DESC, product_group, year) AS Row#
from dbo.general_store_sample_data
where product_group = 'automobile' AND year='2013'

select *
from #Temp_automobile2013
where Row# = 5

-- Temp table for automobile 2014


DROP TABLE IF EXISTS #Temp_automobile2014
Create table #Temp_automobile2014
(Product_group varchar(255),
country nvarchar(255),
year float,
revenue float,
Row# INT)

INSERT INTO #Temp_automobile2014
select *, ROW_NUMBER() Over (Order by revenue DESC, product_group, year) AS Row#
from dbo.general_store_sample_data
where product_group = 'automobile' AND year='2014'

Select *

from #Temp_automobile2014

where Row# = 5

-- Substract 2014 - 2013 median revenue

Select t1.Row#, t1.Product_group, Convert(numeric,(t1.revenue-t2.revenue)) as "Difference" from #Temp_automobile2014 t1
INNER JOIN #Temp_automobile2013 t2
ON t1.Row# = t2.Row# AND t1.Product_group = t2.Product_group


	--TEMP TABLE OF ALL DATA 2013
	
	Drop table if exists #Temp_ALL2013
	Create table #Temp_ALL2013
	(product_group nvarchar(255),
	year float,
	Revenue float,
	Row# int)
	
	INSERT INTO #Temp_ALL2013
	select product_group, year, revenue,ROW_NUMBER() Over (Order by product_group,revenue DESC) AS Row#
	from dbo.general_store_sample_data
	where year = 2013


	select*
	from #Temp_ALL2013

	-- TEMP TABLE OF ALL DATA 2014

	Drop table if exists #Temp_ALL2014
	Create table #Temp_ALL2014
	(product_group nvarchar(255),
	year float,
	Revenue float,
	Row# int)
	
	INSERT INTO #Temp_ALL2014
	select product_group, year, revenue,ROW_NUMBER() Over (Order by product_group,revenue DESC) AS Row#
	from dbo.general_store_sample_data
	where year = 2014


	select*
	from #Temp_ALL2014

	-- SUBSTRACT 2014- 2013 REVENUE 
	Select ta1.Row#, ta1.Product_group, Convert(Decimal,(ta1.revenue-ta2.revenue)) as "Difference" from #Temp_ALL2014 ta1
INNER JOIN #Temp_ALL2013 ta2
ON ta1.Row# = ta2.Row# AND ta1.Product_group = ta2.Product_group


--Looking now at all countries, which product group had the biggest decline in median revenue from 2013 to 2014, by percent change?
Select ta1.Row#, ta1.Product_group, Convert(Decimal,(ta1.revenue-ta2.revenue)*100 / ta2.revenue) as "Difference" from #Temp_ALL2014 ta1
INNER JOIN #Temp_ALL2013 ta2
ON ta1.Row# = ta2.Row# AND ta1.Product_group = ta2.Product_group