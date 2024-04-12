import mysql.connector
import pandas as pd
dataBase = mysql.connector.connect(
    host='127.0.0.1',
    user = 'root',
    password='tito',
    database='importdata'
)
print(dataBase)

cursor = dataBase.cursor()
sentencia_sql = "DROP TABLE IF EXISTS juga"

# Ejecutar la sentencia
cursor.execute(sentencia_sql)

# Obtener todos los resultados
resultados = cursor.fetchall()

# Imprimir los resultados
for fila in resultados:
    print(fila)

# Cerrar cursor y conexión
cursor.close()
dataBase.close()
# import pymysql

# # Establecer conexión con la base de datos
# dataBase = pymysql.connect(
#     host='127.0.0.1',
#     user='root',
#     password='tito',
#     database='importdata'
# )

# # Crear un objeto cursor para ejecutar consultas
# cursorObject = dataBase.cursor()

# selectfrom = """SELECT*FROM Players_description"""
# cursorObject.execute(selectfrom)
# dataBase.commit()
# dataBase.close()

