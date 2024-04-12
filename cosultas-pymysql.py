import pymysql

# Establecer conexión con la base de datos
dataBase = pymysql.connect(
    host='127.0.0.1',
    user='root',
    password='tito',
    database='importdata'
)

# Crear un objeto cursor para ejecutar consultas
cursorObject = dataBase.cursor()

# Crear la tabla
studentRecord = """CREATE TABLE juga (
                   NAME  VARCHAR(20) NOT NULL,
                   BRANCH VARCHAR(50),
                   ROLL INT NOT NULL,
                   SECTION VARCHAR(5),
                   AGE INT
                   )"""

# Insertar datos en la tabla
insertdata = """INSERT INTO juga (NAME, BRANCH, ROLL, SECTION, AGE)
    VALUES ('pepe', 'lo', 12, '33', 25),
    ('ronaldo', 'lo', 12, '33', 25),
    ('messi', 'lo', 12, '33', 25),
    ('Neymar', 'lo', 12, '33', 25)
    """

# Ejecutar la consulta para crear la tabla
cursorObject.execute(studentRecord)

# Ejecutar la consulta para insertar datos
cursorObject.execute(insertdata)

# Hacer commit para guardar los cambios
dataBase.commit()

# Desconectar de la base de datos
dataBase.close()
