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
-- how to group scores when using CASE WHEN?
SELECT mdate, team1,
  CASE WHEN teamid=team1 THEN 1 ELSE 0 END score1, 
  team2, 
  CASE WHEN teamid=team2 THEN 1 ELSE 0 END score2
  FROM game JOIN goal ON matchid = id
  ORDER BY mdate, matchid, team1, team2

-- question 7.1 1962 movies
SELECT id, title
  FROM movie
  WHERE yr=1962

--  question 7.2 When was Citizen Kane released?
SELECT yr
  FROM movie
  WHERE title = 'Citizen Kane';

-- question 7.3 Star Trek movies
SELECT id, title, yr
FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr;

-- question 7.4 id for actor Glenn Close
SELECT id
  FROM actor
  WHERE name = 'Glenn Close';

-- question 7.5 id for Casablanca
SELECT id
  FROM movie
  WHERE title = 'Casablanca'

-- question 7.6 Cast list for Casablanca
SELECT name
FROM actor JOIN casting ON actorid = id
WHERE movieid = 11768;

-- question 7.7 Alien cast list
SELECT name
  FROM actor JOIN casting ON actorid = id
  WHERE movieid = (SELECT id FROM movie WHERE title = 'Alien');

-- question 7.8 Harrision Ford movies
SELECT title
  FROM movie JOIN casting ON movieid = id 
  WHERE actorid = (SELECT id FROM actor WHERE name = 'Harrison Ford');

-- question 7.9 Harrison Ford as a supporting actor
SELECT title
  FROM movie JOIN casting ON movieid = id
  WHERE actorid = (SELECT id FROM actor WHERE name = 'Harrison Ford') 
  AND ord != 1;

-- question 7.10 Lead actors in 1962 movies
SELECT title, name
  FROM movie
  JOIN casting ON movieid = id
  JOIN actor ON actor.id = casting.actorid 
  WHERE ord = 1 AND movie.yr = 1962;

-- question 7.11 Busy years for Rock Hudson
SELECT yr, COUNT(title)
  FROM movie JOIN casting ON movie.id=movieid
             JOIN actor   ON actorid=actor.id
  WHERE name='Rock Hudson'
  GROUP BY yr
  HAVING COUNT(title) > 2
  ORDER BY COUNT(title) DESC;

-- question 7.12 Lead actor in Julie Andrews movies
SELECT movie.title, actor.name
  FROM casting JOIN movie ON movieid  = movie.id
               JOIN actor ON actorid = actor.id
  WHERE casting.movieid IN (
  SELECT movieid FROM casting 
  JOIN actor ON actorid = actor.id
  WHERE casting.actorid = (
    SELECT id FROM actor WHERE name = 'Julie Andrews')
  )
  AND ord = 1;

-- question 7.13 Actors with 15 leading roles
SELECT name
  FROM actor JOIN casting ON actor.id = casting.actorid
  WHERE casting.ord = 1
  GROUP BY name HAVING COUNT(casting.movieid) > 15
  ORDER BY name;

-- question 7.14 List the films released in the year 1978 ordered by the number of actors in the cast, then by title.
SELECT title, COUNT(actor.id)
  FROM movie JOIN casting ON id = casting.movieid
             JOIN actor ON casting.actorid = actor.id
  WHERE yr = 1978
  GROUP BY title
  ORDER BY COUNT(actor.id) DESC, title

-- question 7.15 List all the people who have worked with 'Art Garfunkel'.
SELECT name
  FROM actor JOIN casting ON actor.id = casting.actorid
  JOIN movie ON casting.movieid = movie.id
  WHERE movie.id IN (
      SELECT id 
        FROM movie JOIN casting ON movie.id = casting.movieid
          WHERE casting.actorid = (
            SELECT id FROM actor WHERE name = 'Art Garfunkel'
            )
      ) 
      AND name != 'Art Garfunkel';

-- question 8.1 List the teachers who have NULL for their department.
SELECT name
  FROM teacher
  WHERE dept IS NULL;

-- question 8.2 
SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)

-- question 8.3 Use a join to show all teachers
SELECT teacher.name, dept.name
 FROM teacher LEFT JOIN dept
           ON (teacher.dept=dept.id)

-- question 8.4 Use a join to show all departments
SELECT teacher.name, dept.name
  FROM teacher RIGHT JOIN dept ON teacher.dept = dept.id

-- question 8.5 Using COALESCE
SELECT name, COALESCE(mobile, '07986 444 2266')
FROM teacher;

-- question 8.6
SELECT teacher.name, COALESCE(dept.name, 'None')
FROM teacher LEFT JOIN dept ON teacher.dept = dept.id;

-- question 8.7 Number of teachers + mobile phones
SELECT COUNT(id), COUNT(mobile)
FROM teacher;

-- question 8.8 # of staff in each dept
SELECT dept.name, COUNT(teacher.dept)
FROM teacher RIGHT JOIN dept ON dept.id = teacher.dept
GROUP BY dept.name

-- question 8.9
SELECT name, 
  CASE WHEN dept = 1 THEN 'Sci'
       WHEN dept = 2 THEN 'Sci'
       ELSE 'Art'
  END
FROM teacher;

-- question 8.10
SELECT name,
  CASE WHEN dept = 1 THEN 'Sci'
       WHEN dept = 2 THEN 'Sci'
       WHEN dept = 3 THEN 'Art'
       ELSE 'None'
  END
FROM teacher;

-- question 9.1
SELECT COUNT(id)
  FROM stops;

-- question 9.2
SELECT id
  FROM stops
  WHERE name = 'Craiglockhart';

-- question 9.3
SELECT stops.id, stops.name
  FROM stops RIGHT JOIN route ON route.stop = stops.id
  WHERE route.num = 4 AND route.company = 'LRT';

-- question 9.4
SELECT company, num, COUNT(*)
  FROM route WHERE stop=149 OR stop=53
  GROUP BY company, num
  HAVING COUNT(*) = 2;

-- question 9.5


-- question 9.6 List all services which connect Craiglockhart with London Road
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'
AND stopb.name = 'London Road'
GROUP BY num;

-- question 9.7 Give a list of all the services which connect stops 115 and 137 ('Haymarket' and 'Leith')
SELECT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Haymarket'
AND stopb.name = 'Leith'
GROUP BY num;

-- question 9.8 Give a list of the services which connect the stops 'Craiglockhart' and 'Tollcross'
SELECT a.company, a.num
FROM route a JOIN route b ON (a.company = b.company AND a.num = b.num)
             JOIN stops stopa ON (a.stop = stopa.id)
             JOIN stops stopb ON (b.stop = stopb.id)
WHERE stopa.name = 'Craiglockhart' 
  AND stopb.name = 'Tollcross'
GROUP BY num;

-- question 9.9 Distinct stops that can be reached from 'Craiglockhart' by taking one bus
SELECT stopb.name, a.company, a.num
FROM route a JOIN route b ON
(a.company = b.company AND a.num = b.num)
JOIN stops stopa ON  (a.stop = stopa.id)
JOIN stops stopb ON (b.stop = stopb.id)
WHERE stopa.name = 'Craiglockhart' AND a.company = 'LRT'