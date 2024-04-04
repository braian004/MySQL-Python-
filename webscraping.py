# from urllib.request import urlopen
# from bs4 import BeautifulSoup

# page = urlopen("https://www.footballdatabase.eu/es/")
# soup = BeautifulSoup(page,"html.parser")
# print(soup.hi)


import requests
from bs4 import BeautifulSoup
import pandas as pd 
from lxml import etree
url = "https://www.footballdatabase.eu/es/"
r = requests.get(url)
soup = BeautifulSoup(r.content, "html.parser")

solotexto = soup.text
print(solotexto)


