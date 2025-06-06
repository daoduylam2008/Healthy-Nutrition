from urllib.request import urlopen
from bs4 import BeautifulSoup

url = "https://www.nhs.uk/conditions/vitamins-and-minerals/others/"

page = urlopen(url)
