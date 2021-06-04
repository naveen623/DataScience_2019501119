import requests
import urllib
from bs4 import BeautifulSoup
import re
import io
import gzip

url = "https://www.imdb.com/interfaces/"    
#url in which we want to scrap the data.
page = requests.get(url)
soup = BeautifulSoup(page.content, 'html.parser')
#making the soup, we can pass file or text as parametwr for BeautifulSoup contrstructor.
mytag = soup.find_all("a",text=re.compile("https://datasets.imdbws.com/"))[0]
#now finding the text in the soup- page
url = mytag.contents[0]
page = requests.get(url)
#opens the requested url found using mytag.
soup = BeautifulSoup(page.content, 'html.parser')
mytag = soup.find_all("a")

#as there are total links in the page, find after 1st link.
for a in mytag[1:]:
    print(a["href"])


#this code is for storing the scraped files to get download to our device.
filename_url = []
#to exclude the file type for the downloadable file name.
filename = re.findall(re.compile(r"/(name.*)"),mytag[1]["href"])[0][:-3]
filename_url.append((filename,mytag[1]["href"]))
for link in mytag[2:]:
    filename = re.findall(re.compile(r"/(title.*)"),link["href"])[0][:-3]
    filename_url.append((filename,link["href"]))

for filename,url in filename_url:
	#urllib for handling url request, like fetching urls.
    response = urllib.request.urlopen(url)
    #io.BytesIO for doing file-like operations for parsing.
    compressed_file = io.BytesIO(response.read())
    #gzip for compressing files that are huge.
    decompressed_file = gzip.GzipFile(fileobj=compressed_file)
    #wb is for writing the parsed data to files.
    with open(filename,"wb") as fd:
        fd.write(decompressed_file.read())