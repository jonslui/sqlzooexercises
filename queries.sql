-- question 1.1
SELECT population FROM world
  WHERE name = 'Germany';

-- question 1.2
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

-- question 1.3
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000;

-- question 2.1
SELECT name, continent, population FROM world;

--question 2.2
SELECT name FROM world
  WHERE population >= 200000000;

--question 2.3
SELECT name, gdp/population
  FROM world
  WHERE population >= 200000000;

--question 2.4
SELECT name, population/1000000
  FROM world
  WHERE continent = 'South America';

--question 2.5
SELECT name, population
  FROM world
  WHERE name IN('France', 'Germany', 'Italy');

--question 2.6
SELECT name
  FROM world
  WHERE name LIKE '%United%';

-- question 2.7
SELECT name, population, area
  FROM world
  WHERE population > 250000000 OR area > 3000000;

-- question 2.8
SELECT name, population, area
  FROM world
  WHERE (population > 250000000 AND area <= 3000000) 
  OR (population < 250000000 AND area > 3000000);

-- question 2.9
SELECT name, ROUND(population/1000000, 2), ROUND(GDP/1000000000, 2)
  FROM world
  WHERE continent = 'South America';

--question 2.10
SELECT name, ROUND(gdp/population, -3)
  FROM world
  WHERE GDP > 1000000000000;

--question 2.11
SELECT name, capital
  FROM world
  WHERE LEN(name) = LEN(capital);

--question 2.12
SELECT name, capital
  FROM world
  WHERE LEFT(name, 1) = LEFT(capital, 1) 
  AND name != capital;

--question 2.13
SELECT name
  FROM world
  WHERE name LIKE '%a%' 
    AND name LIKE '%e%' 
    AND name LIKE '%i%' 
    AND name LIKE '%o%' 
    AND name LIKE '%u%'
    AND name NOT LIKE '% %';

--question 3.1
SELECT name
  FROM world
  WHERE name LIKE '%a%' AND name LIKE '%e%' AND name LIKE '%i%' AND name LIKE '%o%' AND name LIKE '%u%'
  AND name NOT LIKE '% %';

--question 3.2
SELECT winner
  FROM nobel
  WHERE yr = 1962
    AND subject = 'Literature';

--question 3.3
SELECT yr, subject
  FROM nobel
  WHERE winner = 'Albert Einstein';

--question 3.4
SELECT winner
  FROM nobel
  WHERE subject = 'Peace' AND yr >= 2000;

--question 3.5
SELECT * 
  FROM nobel
  WHERE yr BETWEEN 1980 AND 1989
  AND subject = 'LITERATURE';

--question 3.6
SELECT *
  FROM nobel
  WHERE winner IN('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama');

--question 3.7
SELECT winner
  FROM nobel
  WHERE winner LIKE 'John%'

--question 3.8
SELECT *
  FROM nobel
  WHERE (subject = 'Physics' AND yr = 1980) 
    OR (subject = 'Chemistry' AND yr = 1984);

--question 3.9
SELECT *
  FROM nobel
  WHERE yr = 1980
  AND subject != 'Chemistry'
  AND subject != 'Medicine';

--question 3.10
SELECT *
  FROM nobel
  WHERE (subject = 'Medicine' AND yr < 1910)
  OR (subject = 'Literature' AND yr >= 2004);

--question 3.11
SELECT *
  FROM nobel
  WHERE winner = 'PETER GRÜNBERG';

--question 3.12 
SELECT *
  FROM nobel
  WHERE winner = "EUGENE O'NEILL";

--question 3.13
SELECT *
  FROM nobel
  WHERE winner LIKE 'Sir %'
  ORDER BY yr DESC;

--question 3.14
SELECT winner, subject
  FROM nobel
 WHERE yr=1984
 ORDER BY
 CASE WHEN subject IN ('Physics','Chemistry') THEN 1 ELSE 0 END,
  subject, winner

--question 4.1
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='RUSSIA')

--question 4.2
SELECT name
  FROM world
  WHERE continent = 'Europe'
    AND gdp/population > (
      SELECT gdp/population FROM world WHERE name = 'UNITED KINGDOM'
    )
;

--question 4.3
SELECT name, continent
  FROM world
    WHERE continent = (SELECT continent FROM world WHERE name = 'Argentina') 
      OR continent = (SELECT continent FROM world WHERE name = 'Australia')
    ORDER BY name;

--question 4.4
SELECT name, population
  FROM world
    WHERE population > (SELECT population FROM world WHERE name = 'Canada')
      AND population < (SELECT population FROM world WHERE name = 'Poland');
    
--question 4.5
SELECT name, 
    CONCAT(
        ROUND(
            population/(SELECT population FROM world WHERE name = 'Germany')*100
        , 0), 
    '%') AS 'percentage'
    FROM world
    WHERE continent = 'Europe';

--question 4.6
SELECT name
    FROM world
    WHERE gdp > (
        SELECT MAX(gdp) FROM world WHERE continent = 'Europe'
        );
        
--question 4.7
SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area>0)

--question 4.8
SELECT continent, name
    FROM world
    GROUP BY continent;

--question 4.9

--question 4.10

--question 5.1
SELECT SUM(population)
    FROM world;

--question 5.2
SELECT DISTINCT continent
    FROM world;

--question 5.3
SELECT SUM(gdp)
    FROM world
    WHERE continent = 'Africa';

--question 5.4
SELECT COUNT(name)
    FROM world
    WHERE area > 1000000;

--question 5.5
SELECT SUM(population)
    FROM world
    WHERE name IN('Estonia', 'Latvia', 'Lithuania');

--question 5.6
SELECT continent, COUNT(name)
    FROM world
    GROUP BY continent;

--question 5.7
SELECT continent, COUNT(name)
    FROM world
    WHERE population > 10000000
    GROUP BY continent;

--question 5.8
SELECT continent
    FROM world
    GROUP BY continent 
    HAVING SUM(population) >= 100000000;

--question 6.1
SELECT matchid, player FROM goal 
  WHERE teamid = 'GER';

--question 6.2
SELECT id,stadium,team1,team2
  FROM game
  WHERE id = 1012;

--question 6.3
SELECT player, teamid, stadium, mdate
  FROM game 
  JOIN goal ON (id=matchid)
  WHERE teamid = 'GER';

--question 6.4
SELECT team1, team2, player 
  FROM game 
  JOIN goal ON (id = matchid)
  WHERE player LIKE 'MARIO%';

--question 6.5
SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam ON teamid = id
  WHERE gtime<=10;

-- question 6.6
SELECT mdate, teamname
  FROM game JOIN eteam ON (team1 = eteam.id)
  WHERE coach = 'Fernando Santos';

-- question 6.7
SELECT player
  FROM goal JOIN game ON (matchid = id)
  WHERE game.stadium = 'National Stadium, Warsaw';

-- question 6.8
SELECT player
  FROM game JOIN goal ON matchid = id 
    WHERE (team1 = 'GER' OR team2 = 'GER') 
    AND teamid != 'GER'
    GROUP BY player
    ORDER BY matchid;

-- question 6.9
SELECT teamname, COUNT(matchid)
  FROM eteam JOIN goal ON id=teamid
  GROUP BY teamid
  ORDER BY teamname

-- question 6.10
SELECT stadium, COUNT(stadium)
  FROM game JOIN goal ON id = matchid
  GROUP BY stadium;

-- question 6.11
SELECT matchid, mdate, COUNT(matchid)
  FROM game JOIN goal ON matchid = id 
  WHERE (team1 = 'POL' OR team2 = 'POL')
  GROUP BY matchid

-- question 6.12
SELECT matchid, mdate, COUNT(matchid)
  FROM game JOIN goal ON matchid = id
  WHERE teamid = 'GER'
  GROUP BY matchid;

-- question 6.13

