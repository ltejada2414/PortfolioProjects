SELECT *
FROM PortfolioProject..CovidDeaths
Where Continent is not null
order by date ASC


SELECT location, date, total_cases, new_cases, total_deaths, population
FROM PortfolioProject..CovidDeaths
Order BY 1,2

--Total cases vs Total Deaths in the USA
SELECT location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 AS DeathPercentage
FROM PortfolioProject..CovidDeaths
WHERE location = 'united States' AND Continent is not null
Order by date

--total cases vs population 

SELECT location, date, total_cases, population, (total_cases/population)*100 AS InfectionRate
FROM PortfolioProject..CovidDeaths
Where Continent is not null
Order BY 1,2

--Countries with highest infection rate
SELECT location, Population, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population))*100 AS InfectionRate
FROM PortfolioProject..CovidDeaths
Where Continent is not null
Group by location, population
order by 4 DESC

--Countries with the highest Death count per Population
SELECT location, MAX(cast(total_deaths as int)) as totaldeathcount
from PortfolioProject..CovidDeaths
Where Continent is not null
Group by location
Order BY 2 DESC

--Continents Total Death Count
SELECT continent, MAX(cast(total_deaths as int)) as totaldeathcount
from PortfolioProject..CovidDeaths
Where Continent is not null
Group by continent
Order BY 2 DESC

--Global NUMBERS by date
SELECT Sum(new_cases) as TotalWorldCases, SUM(Cast(new_deaths as int)) as TotalWorldDeaths, SUM(Cast(new_deaths as int))/SUM(new_cases)*100 as WorldDeathpercnt
from PortfolioProject..CovidDeaths
Where continent is not null
(--WORLD Death percnt is around 2%)

--USA cases in the past month AS of NOV-07-2021
Select location, date, new_cases
from PortfolioProject..Coviddeaths
Where location = 'United states' AND date > '2021-10-08'
Order by date ASC


-- total population vs vaccinations
with PopvsVac (continent, location, date, population, new_vaccinations, RollingPeopleVaccinated)
as 
(
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(CONVERT(Bigint,vac.new_vaccinations)) OVER (Partition by dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
FROM PortfolioProject..Coviddeaths dea
JOIN PortfolioProject..covidvaccinations vac
ON dea.location = vac.location and dea.date = vac.date
where dea.continent is not null
)
select *, (RollingPeopleVaccinated/population)*100 AS PrcntOfVaccinatedPeople
FROM PopvsVac

--TEMP TABLE

CREATE TABLE #PercentPopulationVaccinated
(
continent nvarchar(255),
location nvarchar(255),
Date datetime,
population NUMERIC, 
New_vaccinations Numeric,
RollingpeopleVccinated numeric
)

INSERT INTO #PercentPopulationVaccinated

select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(CONVERT(Bigint,vac.new_vaccinations)) OVER (Partition by dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
FROM PortfolioProject..Coviddeaths dea
JOIN PortfolioProject..covidvaccinations vac
ON dea.location = vac.location and dea.date = vac.date
where dea.continent is not null

Select *, (RollingPeopleVaccinated/population)*100 AS PrcntOfVaccinatedPeople
From #PercentPopulationVaccinated


--Creating view to store data for later viz

create view Percentpopulationvaccinated as
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, SUM(CONVERT(Bigint,vac.new_vaccinations)) OVER (Partition by dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
FROM PortfolioProject..Coviddeaths dea
JOIN PortfolioProject..covidvaccinations vac
ON dea.location = vac.location and dea.date = vac.date
where dea.continent is not null










