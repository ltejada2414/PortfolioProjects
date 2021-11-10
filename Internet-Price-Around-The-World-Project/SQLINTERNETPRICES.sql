

-- Internet prices in the usa
select *
From dbo.cities_internet_prices_historic$



-- Rename Region to State and Get AVG Internet prices per state\
EXEC sp_rename 'dbo.cities_internet_prices_historic$.states', 'state'
SELECT state, AVG(internetprice2010) as AvrgPrice2010, AVG(internetprice2011) as AvrgPrice2011,AVG(internetprice2012) as AvrgPrice2012, AVG(internetprice2013) as AvrgPrice2013, AVG(internetprice2014) as AvrgPrice2014,
AVG(internetprice2015) as AvrgPrice2015, AVG(internetprice2016) as AvrgPrice2016, AVG(internetprice2017) as AvrgPrice2017, AVG(internetprice2018) as AvrgPrice2018, AVG(internetprice2019) as AvrgPrice2019, AVG(internetprice2020) as AvrgPrice2020
From dbo.cities_internet_prices_historic$
Where country = 'united states of america'
Group by state 
Order by AvrgPrice2020 DESC


--AVG price of internet in the USA through out the years
SELECT Country, AVG(internetprice2010) as AvrgPrice2010, AVG(internetprice2011) as AvrgPrice2011,AVG(internetprice2012) as AvrgPrice2012, AVG(internetprice2013) as AvrgPrice2013, AVG(internetprice2014) as AvrgPrice2014,
AVG(internetprice2015) as AvrgPrice2015, AVG(internetprice2016) as AvrgPrice2016, AVG(internetprice2017) as AvrgPrice2017, AVG(internetprice2018) as AvrgPrice2018, AVG(internetprice2019) as AvrgPrice2019, AVG(internetprice2020) as AvrgPrice2020
From dbo.cities_internet_prices_historic$
Where country = 'united states of america'
Group by country

--AVG Price Of internet In the World Except USA
SELECT Country, state, AVG(internetprice2010) as AvrgPrice2010, AVG(internetprice2011) as AvrgPrice2011,AVG(internetprice2012) as AvrgPrice2012, AVG(internetprice2013) as AvrgPrice2013, AVG(internetprice2014) as AvrgPrice2014,
AVG(internetprice2015) as AvrgPrice2015, AVG(internetprice2016) as AvrgPrice2016, AVG(internetprice2017) as AvrgPrice2017, AVG(internetprice2018) as AvrgPrice2018, AVG(internetprice2019) as AvrgPrice2019, AVG(internetprice2020) as AvrgPrice2020
From dbo.cities_internet_prices_historic$
Group by country, state
Order by AvrgPrice2020 DESC




Select city,
from dbo.cities_internet_prices_historic$


--AVERAGE COST OF INTERNET FROM 2010 TO 2020

Select AVG(internetprice2010+internetprice2011+internetprice2012+internetprice2013+internetprice2014+internetprice2015+internetprice2016+internetprice2017+internetprice2018+internetprice2019+internetprice2020)/11 AS AverageInternetCostInTheWorld
From dbo.cities_internet_prices_historic$

--AVERAGE Price of Internet Globaly 2010

SELECT AVG(internetprice2010) as avrgPrice2010
From dbo.cities_internet_prices_historic$

--Averag Price of internet Globaly 2020

SELECT AVG(internetprice2020) as avrgPrice2020
From dbo.cities_internet_prices_historic$

--AVERAGE Price of Internet Globaly 2010 - 2020

SELECT AVG(internetprice2010) as avrgPrice2010, AVG(internetprice2011) as avrgPrice2011,AVG(internetprice2012) as avrgPrice2012, AVG(internetprice2013) as avrgPrice2013, AVG(internetprice2014) as avrgPrice2014,
AVG(internetprice2015) as avrgPrice2015, AVG(internetprice2016) as avrgPrice2016, AVG(internetprice2017) as avrgPrice2017, AVG(internetprice2018) as avrgPrice2018, AVG(internetprice2019) as avrgPrice2019, AVG(internetprice2020) as avrgPrice2020
From dbo.cities_internet_prices_historic$

--Average Price of internet Per Year Grouped by country

SELECT country, AVG(internetprice2010) as AvrgPrice2010, AVG(internetprice2011) as AvrgPrice2011,AVG(internetprice2012) as AvrgPrice2012, AVG(internetprice2013) as AvrgPrice2013, AVG(internetprice2014) as AvrgPrice2014,
AVG(internetprice2015) as AvrgPrice2015, AVG(internetprice2016) as AvrgPrice2016, AVG(internetprice2017) as AvrgPrice2017, AVG(internetprice2018) as AvrgPrice2018, AVG(internetprice2019) as AvrgPrice2019, AVG(internetprice2020) as AvrgPrice2020
From dbo.cities_internet_prices_historic$
Group by country
Order by AvrgPrice2020 DESC

--Price of internet Per Year in each city

Select city, internetprice2010, internetprice2011, internetprice2012, internetprice2013, internetprice2014,
internetprice2015, internetprice2016, internetprice2017, internetprice2018, internetprice2019, internetprice2020
From dbo.cities_internet_prices_historic$

