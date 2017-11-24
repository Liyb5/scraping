import requests
import json
from bs4 import BeautifulSoup
user_agent = 'Mozilla/5.0 (Windows NT 10.0; WOW64)'
headers = {'User-Agent':user_agent}
r = requests.get('http://seputu.com/',headers=headers)

soup = BeautifulSoup(r.text,'html.parser',from_encoding='utf-8')
content = []
for mulu in soup.find_all(class_='mulu'):
	h2 = mulu.find('h2')
	if h2!=None:
		h2_title = h2.string
		list = []
		for a in mulu.find(class_='box').find_all('a'):
			href = a.get('href')
			box_title = a.get('title')
			list.append({'href':href,'box_title':box_title})
		content.append({'title':h2_title,'content':list})
with open('seputu.json','w') as fp:
	json.dump(content,fp,indent=4,encoding='utf-8')
			
