import requests

url = 'http://166.153.133.121/?command=TableDisplay&table=MET&records=10'

r = requests.get(url, stream=True, timeout = 30)

for line in r.iter_lines():
    if line: print line