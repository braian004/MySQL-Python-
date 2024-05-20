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

SELECT surname,geography,estimatedSalary FROM Clientes
WHERE estimatedSalary IN (
		SELECT estimatedSalary FROM clientes
		WHERE estimatedSalary > 240000);
SELECT * FROM clientes;

SELECT geography,estimatedSalary FROM clientes
WHERE estimatedSalary >= (SELECT MAX(estimatedSalary) AS QUERIES FROM Clientes
WHERE geography = 'France'); 

USE importdata;

-- SUBCONSULTA
SELECT * FROM clientes;
SELECT clientes.geography,clientes.estimatedSalary,t.geography,MEDIA_SALARIO
FROM clientes 
INNER JOIN	   (SELECT geography, AVG(estimatedSalary)AS MEDIA_SALARIO
				FROM clientes
				WHERE geography IS NOT NULL
				GROUP BY geography)AS t 
ON clientes.geography = t.geography
WHERE clientes.estimatedSalary >= MEDIA_SALARIO;

SELECT * FROM clientes;
SELECT * FROM productos;

-- SELECT COUNT(clientes.customerID) AS Clientes_Producto_B 
-- FROM clientes INNER JOIN productos 
-- ON clientes.customerID = productos.customerId
-- WHERE productos.Products = 'Producto B'

-- SELECT surname,birth_date,
SELECT  
CASE 
	WHEN YEAR (birth_date)>= 1930 AND YEAR (birth_date)<=1935 THEN 'GENERACION GERRA'
    WHEN YEAR (birth_date)>= 1945 AND YEAR (birth_date)<=1950 THEN 'GENERACION 2 GERRA'
    WHEN YEAR (birth_date)>= 1960 AND YEAR (birth_date)<=1970 THEN 'GENERACION GOLPE DE ESTADO'
    WHEN YEAR (birth_date)>= 1970 AND YEAR (birth_date)<=2000 THEN 'GENERACION milenial'
    WHEN YEAR (birth_date)>= 2000 AND YEAR (birth_date)<=2024 THEN 'GENERACION Z'
    ELSE 'No ahy informacion'
END AS Generacion,COUNT(*) AS Catidad_X_Generacion
FROM clientes
GROUP BY Generacion
ORDER BY Catidad_X_Generacion DESC;

SELECT Generacion, COUNT(*) AS Cantidad_X_Generacion
FROM (
    SELECT surname, birth_date,
        CASE 
            WHEN YEAR(birth_date) >= 1930 AND YEAR(birth_date) <= 1935 THEN 'GENERACION GERRA'
            WHEN YEAR(birth_date) >= 1945 AND YEAR(birth_date) <= 1950 THEN 'GENERACION 2 GERRA'
            WHEN YEAR(birth_date) >= 1960 AND YEAR(birth_date) <= 1970 THEN 'GENERACION GOLPE DE ESTADO'
            WHEN YEAR(birth_date) >= 1970 AND YEAR(birth_date) <= 2000 THEN 'GENERACION milenial'
            WHEN YEAR(birth_date) >= 2000 AND YEAR(birth_date) <= 2024 THEN 'GENERACION Z'
            ELSE 'No hay información'
        END AS Generacion
    FROM clientes
) AS Generations
GROUP BY Generacion
ORDER BY Cantidad_X_Generacion DESC;

-- ALTER TABLE name CHANGE lasna_name LastName  VARCHAR (50) NOT NULL;

SELECT * FROM clientes;
SELECT * FROM score_crediticio;
-- carbiar nombre de columna cambiado_name  a customerId 
ALTER TABLE score_crediticio CHANGE cambiado_name customerId VARCHAR(50) NOT NULL;
DESCRIBE score_crediticio;

SELECT c.surname,sc.score,
CASE
WHEN sc.score <= 579 AND sc.score >= 300 THEN 'Deficiente'
WHEN sc.score <= 699 AND sc.score >= 580 THEN 'Razonable'
WHEN sc.score <= 739 AND sc.score >= 670 THEN 'Bueno'
WHEN sc.score <= 799 AND sc.score >= 740 THEN 'Muy Bueno'
WHEN sc.score <= 950 AND sc.score >= 800 THEN 'Excepcional'
WHEN sc.score IS NULL OR sc.score <= 0 THEN 'sin Calificar'
END AS Calificasion_score
FROM Clientes as c 
INNER JOIN score_crediticio AS sc
ON c.customerID = sc.customerId
ORDER BY sc.score DESC;

SELECT
CASE
WHEN sc.score <= 579 AND sc.score >= 300 THEN 'Deficiente'
WHEN sc.score <= 699 AND sc.score >= 580 THEN 'Razonable'
WHEN sc.score <= 739 AND sc.score >= 670 THEN 'Bueno'
WHEN sc.score <= 799 AND sc.score >= 740 THEN 'Muy Bueno'
WHEN sc.score <= 950 AND sc.score >= 800 THEN 'Excepcional'
WHEN sc.score IS NULL OR sc.score <= 0 THEN 'sin Calificar'
END AS Calificasion_score , COUNT(*) AS cantidad_clasificacion
FROM clientes as c 
INNER JOIN score_crediticio AS sc
ON c.customerID = sc.customerId
GROUP BY Calificasion_score
ORDER BY cantidad_clasificacion DESC;

-- DENSE_RANCK()
-- USE mi_base_de_datos;
-- RENAME TABLE clientes TO usuarios;
SELECT * FROM supermarket;
RENAME TABLE supermarket TO ventas_supermarket;
SELECT * FROM ventas_supermarket;

SELECT Product_line,AVG(Rating) AS Average_