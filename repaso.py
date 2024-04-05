import requests
from bs4 import BeautifulSoup

url ="https://python.org/"
page = requests.get(url)
soup = BeautifulSoup(page.content , "html.parser")

texto=soup.text
print(texto)
