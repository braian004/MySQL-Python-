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
sentencia_sql = "SELECT * FROM Players_description"

# Ejecutar la sentencia
cursor.execute(sentencia_sql)

# Obtener todos los resultados
resultados = cursor.fetchall()
# # Imprimir los resultados
for fila in resultados:
    print(fila)
# #Dataframe    
# df = pd.DataFrame(resultados)
# # Poniendo nombre a las columnas
# df.columns = ["id", "firstName","LastName","Edad","Nacimiento","altura","peso","Nacionalidad","Club","Value_eur","Wage_eur","Posicion"]
# print(df)
# #guardar en un data frame en cv
# df.to_csv('datos.csv', index=False)
# # guardar como json
# df.to_json('datos.json', orient='records', lines=True)#muchas sola line-->True y False --> una sola line
# # Cerrar cursor y conexión
cursor.close()
dataBase.close()

