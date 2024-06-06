CREATE DATABASE Mi_Reto;
USE Mi_reto;
SELECT * FROM athlete_events;
-- ¿Cuantos juegos olimpicos se han celebrado?
SELECT COUNT(DISTINCT YEAR)AS Tota_Juegos FROM athlete_events;
-- Enumera todos los jurgod Olimpicos celebrado hasta ahora.
SELECT * FROM athlete_events;
SELECT DISTINCT Games FROM athlete_events;
-- Menciona el numero total de nacionalidades que participaron en cada juego Olipico.
SELECT * FROM athlete_events;
SELECT Games, COUNT(DISTINCT NOC) AS Num_PaisesxJO FROM athlete_events
GROUP BY Games;
-- ¿En que año se vio el mayor y menor numero de paises participan en los juegos olimpicos ?
SELECT * FROM athlete_events;
(SELECT Year,COUNT(DISTINCT NOC) AS Numero_paises_Max FROM athlete_events
GROUP BY Year
ORDER BY Numero_paises_Max DESC
LIMIT 1)
UNION
(SELECT Year , COUNT(DISTINCT NOC) AS Numero_paises_Min FROM athlete_events
GROUP BY Year
ORDER BY Numero_paises_Min ASC
LIMIT 2);
-- ¿Que nacion a participado en todos los juegos olimpicos?
SELECT Games,COUNT(DISTINCT Team) FROM athlete_events
LIMIT 2;

