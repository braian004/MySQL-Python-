
import requests
from bs4 import BeautifulSoup

url = "https://capacitateparaelempleo.org/cursos/view/22"
r = requests.get(url)
# soup = BeautifulSoup(r.content, "html.parcer") error C a S
soup = BeautifulSoup(r.content, "html.parser")
texto = soup.text 
print(texto)

# soup.find_all("a", class_="/c-dl.php?type=players&amp;comp=10032")
# soup
# <a class="dBlock w80 m0Auto rpl0 rpr0 bbox button-regular-blue white hov8" href="/c-dl.php?type=players&amp;comp=10032" target="_blank"><i class="mr03 fa fa-user-circle"></i><br class="sm-visible"><span class="sm-invisible">CSV</span> de Jugador</a> 