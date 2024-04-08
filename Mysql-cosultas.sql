CREATE DATABASE importdata;
USE importdata;
-- DROP TABLE url_total;
SELECT * FROM players_description; -- see table 
SELECT LastName FROM players_description; -- see column table
SELECT FirstName,LastName FROM players_description;
SELECT Firstname,LastName,age FROM players_description;
SELECT full_name FROM premier_league_players;
-- buscar jugadores de 30 años
SELECT firstname,age FROM players_description
WHERE Age = 30;
-- max value --> maximo valor de jugador menor de 25 años
SELECT * FROM players_description;
SELECT Firstname,Age,Nationality,MAX(Value_eur) FROM players_description
WHERE Age < 25
GROUP BY Firstname,Age,Nationality;
-- jugador de argentian de menor de 30 
SELECT * FROM Players_description;
SELECT Firstname  FROM Players_description
WHERE Nationality = 'ARG' AND Age > 30;
-- jugadores no argentinos menores de 30
SELECT * FROM Players_description;
SELECT FirstName FROM Players_description
WHERE Nationality != 'ARG' AND Age < 30; -- != and <> it different
-- los que naciero despues de 1990
SELECT FirstName,BirthDate FROM Players_description
WHERE BirthDate > '1990-00-00';
-- SUM sumar el valor de club que mas paga y el jugador que mas cobra
SELECT Club,SUM(Value_eur),MAX(Value_eur) FROM Players_description
GROUP BY Club;
-- COUNT conocer el total de valores
SELECT COUNT(*) FROM Players_description;