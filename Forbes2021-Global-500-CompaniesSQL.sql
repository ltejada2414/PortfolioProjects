select *
From PortfolioProject..Forbes_2021_500_Global_Companies


--1 All COMPANIES IN THE UNITED STATES SORTED BY RANK
select CAST(rank as int) as RANK, name, country, sales, Profit, Assets,MarketValue
From PortfolioProject..Forbes_2021_500_Global_Companies
Where Country = 'United States'
 Order by 1


--2 TOP TEN RANKED COMPANIES IN THE WORLD
select *, CONVERT(int,Rank)
From PortfolioProject..Forbes_2021_500_Global_Companies
Where Rank <= 10


--3 Countries Added Market value  
select Country, SUM(Marketvalue)As TotalMarketvalueOfCompaniesInCountries
From PortfolioProject..Forbes_2021_500_Global_Companies
GROUP BY Country
Order by 2 DESC

--4 Countries Added Sales
select Country, SUM(Sales)As CountriesSales
From PortfolioProject..Forbes_2021_500_Global_Companies
GROUP BY Country
Order by 2 DESC

--5 Companies Profit From Highest To Lowest
select *
From PortfolioProject..Forbes_2021_500_Global_Companies
Order by Profit DESC

--6 Number of companies Per Country
select Country, COUNT(name) As Number_of_companies
From PortfolioProject..Forbes_2021_500_Global_Companies
Group by country
Order by 2 DESC

--7 USA VS CHina
select country,SUM(sales) As TotalSales,SUM(profit) AS TotalProfit, SUM(assets) AS Assets, SUM(Marketvalue) AS TotalMarketValue
From PortfolioProject..Forbes_2021_500_Global_Companies
Where Country = 'United states' OR Country = 'China'
GROUP BY Country

--8 All info Grouped by country Ordered by sales
select country, SUM(sales) As TotalSales,SUM(profit) AS TotalProfit, SUM(assets) AS Assets, SUM(Marketvalue) AS TotalMarketValue
From PortfolioProject..Forbes_2021_500_Global_Companies
GROUP BY Country
order by totalsales DESC


