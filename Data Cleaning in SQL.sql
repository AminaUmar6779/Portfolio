SELECT *
FROM portfolioproject.coviddeaths
ORDER BY 3,4;

SELECT *
FROM  portfolioproject.coviddeaths;


SET SQL_SAFE_UPDATES = 0;

SELECT location, date,total_cases, new_cases,total_deaths, population
FROM portfolioproject.coviddeaths
ORDER BY 1,2;

##---Looking at the Total cases vs Total Deaths

SELECT location, date,total_cases, new_cases,total_deaths,(total_cases/total_deaths)*100 as DeathPercentpopulation
FROM coviddeaths
ORDER BY 1,2;

### Looking at the percent

SELECT location, date,population, total_cases, (total_cases/population) * 100 as percentagePopulationinfected
FROM coviddeaths
ORDER BY 1,2;

##Looking at countries with highest infection rate compared to population

SELECT location,population,total_cases, MAX(total_cases) AS Highestinfectioncount, MAX(total_cases/population) * 100 as PercentagePopulationinfected
FROM coviddeaths
WHERE location LIKE '%State%'
GROUP BY Population, location,total_cases
ORDER BY PercentagePopulationinfected DESC;


##Countries with the highest death count per population

SELECT Location, MAX(Total_deaths) as Totaldeathcounts
FROM coviddeaths
GROUP BY Location
ORDER BY Totaldeathcounts;


##Showing countries with highest death count

SELECT continent, total_deaths, MAX(total_deaths) AS TotalDeathcount
FROM coviddeaths
WHERE continent IS NOT NULL
GROUP BY continent, total_deaths
ORDER BY TotalDeathCount;

SELECT location, continent,SUM(new_cases) as totalnewcases, SUM(new_deaths) as totalnewdeaths
FROM Coviddeaths
WHERE location like '%state%'
AND continent is not null
GROUP BY location, continent
ORDER BY 1,2 ;

SELECT * 
FROM coviddeaths
WHERE continent IS NOT NULL;


SELECT  dea.continent, dea.location, dea.date, dea.population
FROM coviddeaths dea
JOIN covidvaccinations vac
ON dea.location= vac.location
AND dea.date=vac.date
WHERE dea.continent is not null
ORDER BY 2,3;


