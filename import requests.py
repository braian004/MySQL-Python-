import requests

url = 'http://up.hydrax.net/b4a6f38681cbe3deba9ef2ae4911b21a'

file_name = 'import requests.py'
file_type = 'video/mp4'
file_path = 'C:/Users/Tito/Desktop/PRACTICE/MySQL/Analisis de datos de jugadores/import requests.py'  # Actualiza la ruta según la ubicación de tu archivo
files = {'file': (file_name, open(file_path, 'rb'), file_type)}

r = requests.post(url, files=files)
print(r.text)
# C:\Users\Tito\Desktop\PRACTICE\MySQL\Analisis de datos de jugadores\import requests.py