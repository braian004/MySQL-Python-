use mi_reto;
DROP TABLE IF EXISTS `athlete_events`;
CREATE TABLE athlete_events (
    ID INT,
    Name VARCHAR(255),
    Sex CHAR(1),
    Age INT,
    Height INT,
    Weight INT,
    Team VARCHAR(255),
    NOC CHAR(3),
    Games VARCHAR(255),
    Year INT,
    Season VARCHAR(10),
    City VARCHAR(255),
    Sport VARCHAR(255),
    Event VARCHAR(255),
    Medal VARCHAR(50)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
-- SHOW VARIABLES LIKE 'secure_file_priv';-- dirreeccion donde tienes que estar la data a importar
-- C:\ProgramData\MySQL\MySQL Server 8.0\Data\DATA
-- C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\DATA\ --> DIRECCION EVER 
-- C:\ProgramData\MySQL\MySQL Server 8.0\DATA\DATA\athlete_events.csv

LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Data\\DATA\\athlete_events.csv'
INTO TABLE athlete_events
CHARACTER SET latin1
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
ESCAPED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;


