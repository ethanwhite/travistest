import requests

url = 'http://166.153.133.121/?command=TableDisplay&table=MET&records=10'
r = requests.get(url, allow_redirects=True, timeout=30)
open('weather.txt', 'wb').write(r.content)