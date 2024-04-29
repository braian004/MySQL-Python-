import requests
from bs4 import BeautifulSoup
url ="https://postimg.cc/gallery/tPCSH2M"
page = requests.get(url)
soup = BeautifulSoup(page.content , "html.parser")
imagen=soup.select("img")
print(imagen)