
-- Query 1: Bigger than Russia
SELECT name 
FROM world 
WHERE population > (SELECT population FROM world WHERE name = 'Russia');

-- Query 2: Richer than UK
SELECT name 
FROM world 
WHERE continent = 'Europe' AND gdp / population > (SELECT gdp / population FROM world WHERE name = 'United Kingdom');

-- Query 3: Neighbours of Argentina and Australia
SELECT name, continent 
FROM world 
WHERE continent IN (SELECT continent FROM world WHERE name = 'Argentina' OR name = 'Australia') 
ORDER BY name;

-- Query 4: Between Canada and Poland
SELECT name, population 
FROM world 
WHERE population > (SELECT population FROM world WHERE name = 'United Kingdom') 
AND population < (SELECT population FROM world WHERE name = 'Germany');

-- Query 5: Percentages of Germany
SELECT name, CONCAT(ROUND(100 * population / (SELECT population FROM world WHERE name = 'Germany')), '%') AS percentage 
FROM world 
WHERE continent = 'Europe';

-- Query 6: Bigger than every country in Europe
SELECT name 
FROM world 
WHERE gdp > ALL (SELECT gdp FROM world WHERE continent = 'Europe' AND gdp IS NOT NULL);

-- Query 7: Largest in each continent
SELECT continent, name, area 
FROM world x
WHERE area >= ALL (SELECT area FROM world y WHERE y.continent = x.continent AND area > 0);

-- Query 8: First country of each continent (alphabetically)
SELECT continent, name 
FROM world x 
WHERE name = (SELECT MIN(name) FROM world y WHERE y.continent = x.continent);

-- Query 9: Continents with all countries' population <= 25,000,000
SELECT name, continent, population 
FROM world 
WHERE continent IN 
  (SELECT continent FROM world GROUP BY continent HAVING MAX(population) <= 25000000);

-- Query 10: Three times bigger
SELECT name, continent 
FROM world x 
WHERE population > 3 * (SELECT MAX(population) 
                        FROM world y WHERE y.continent = x.continent AND y.name != x.name);
