
# import pymysql

# dataBase = pymysql.connect(
# host='127.0.0.1', 
# user='root',  
# password = "tito", 
# database = "importdata"
# )

# # print(dataBase)
# cursorObject = dataBase.cursor()
  
# # creating table 
# studentRecord = """CREATE TABLE jugado (
#                    NAME  VARCHAR(20) NOT NULL,
#                    BRANCH VARCHAR(50),
#                    ROLL INT NOT NULL,
#                    SECTION VARCHAR(5),
#                    AGE INT
#                    )"""

# insertdata = """ INSERT INTO jugadores (NAME, BRANCH, ROLL, SECTION, AGE)
#     VALUES ('pepe', 'lo', 12, '33', 25),
#     ('ronaldo', 'lo', 12, '33', 25),
#     ('messi', 'lo', 12, '33', 25)
#     """

# # table created
# cursorObject.execute(insertdata) 

# # disconnecting from server
# dataBase.close()

import pymysql

# Parámetros de conexión
params = {
    'host': '127.0.0.1',
    'user': 'root',
    'password': 'tito',
    'database': 'importdata'
}

try:
    # Establecer la conexión con la base de datos
    conexion = pymysql.connect(**params)

    # Crear un cursor para ejecutar consultas SQL
    cursor = conexion.cursor()

    # Crear la tabla si no existe
    crear_tabla_query = """
    CREATE TABLE IF NOT EXISTS jugado (
        NAME VARCHAR(20) NOT NULL,
        BRANCH VARCHAR(50),
        ROLL INT NOT NULL,
        SECTION VARCHAR(5),
        AGE INT
    )
    """
    cursor.execute(crear_tabla_query)

    # Insertar datos en la tabla
    insertar_datos_query = """ INSERT INTO jugadores (NAME, BRANCH, ROLL, SECTION, AGE)
    VALUES ('pepe', 'lo', 12, '33', 25),
    ('ronaldo', 'lo', 12, '33', 25),
    ('messi', 'lo', 12, '33', 25)
    """
    cursor.execute(insertar_datos_query)

    # Confirmar los cambios
    conexion.commit()

    # Cerrar el cursor y la conexión
    cursor.close()
    conexion.close()

    print("Datos insertados correctamente.")

except pymysql.Error as e:
    # Si ocurre algún error, mostramos el mensaje de error
    print(f"Error al conectar a la base de datos: {e}")
