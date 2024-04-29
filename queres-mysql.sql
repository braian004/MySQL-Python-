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
SELECT * FROM Players_description;
-- sueldos mayores a 200
SELECT Nationality,FirstName,Value_eur,COUNT(*)FROM Players_description
WHERE Wage_eur>100
GROUP BY Nationality,FirstName,Value_eur; 
-- AND el apellido kien tengan menos de 30 años y posicion CB 
SELECT*FROM Players_description;
SELECT LastName,Age,Team_Position FROM Players_description
WHERE Age > 30 AND Team_Position ='CB';
-- IN seleciona las nacionalidad de arg,bra,fra
SELECT * FROM Players_description
WHERE Nationality IN('ARG','BRA','FRA');
-- el promedio de altura de los jugadores mayores de 28 por nacionalidad
SELECT Nationality, AVG(Height) FROM players_description
WHERE Age > 28
GROUP BY Nationality
ORDER BY AVG(Height);-- AVG promedio 
-- el jugadores que menos gana por nacionalidad
SELECT Nationality,MIN(Value_eur) FROM Players_description
GROUP BY Nationality;
-- MAX
SELECT Nationality ,MAX(Height) FROM Players_description
GROUP BY Nationality;
-- maximos de height por posicion 
SELECT Team_position,MAX(Height)FROM Players_description
GROUP BY Team_position;

-- HAVING anlgo similar a la where,el where se aplica solo row individual

SELECT Nationality,AVG(Value_eur) FROM players_description
WHERE Nationality IN ('ARG','BRA','ESP','FRA')
GROUP BY Nationality
HAVING AVG (Value_eur);

-- DISTINCT
SELECT DISTINCT Nationality,COUNT(*) FROM players_description
GROUP BY Nationality 
ORDER BY COUNT(*)ASC;

-- CREAT TEMPORARY TABLE 
SELECT*FROM bank;
CREATE TEMPORARY TABLE temporal_tabla
SELECT job,education,age
FROM bank;
SELECT*FROM temporal_tabla;
-- crear tabla termporal de edad superior a 25 y education sean terciario y desconocida
CREATE TEMPORARY TABLE temporal
SELECT age,education,job,marital
FROM bank
WHERE age > 25 AND education IN ('tertiary' , 'primary');

SELECT*FROM temporal;

-- Informacion  of the table
SHOW COLUMNS FROM clientes;
SELECT * FROM clientes;
SELECT * FROM productos;
-- INNER JOIN
SELECT clientes.customerId, clientes.surname, clientes.geography, 
clientes.gender, 
clientes.HasCrCard, clientes.isActiveMember, 
clientes.estimatedSalary, clientes.application_date, 
clientes.exit_date, clientes.birth_date,
productos.Products
FROM clientes
INNER JOIN productos
ON clientes.customerId = productos.customerId;

-- SUBCONSULTA
SELECT * FROM players_description
WHERE Age> (SELECT Age FROM players_description WHERE Playerid = 1);

SELECT * FROM clientes;
-- estimatedSalary
SELECT surname,geography,estimatedSalary FROM Clientes
WHERE estimatedSalary IN (
		SELECT estimatedSalary FROM clientes
		WHERE estimatedSalary > 240000);
        