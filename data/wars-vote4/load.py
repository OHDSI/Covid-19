import requests
import bs4
import pandas as pd

url = 'https://docs.google.com/spreadsheets/d/e/2PACX-1vSr2xYotDgnAq6bqm5Nkjq9voHBKzKNWH2zvTRx5LU0jnpccWykvEF8iB_0g7Tzo2pwzkTuM3ETlr_h/pub?gid=0&range=A2:ZZ'
r = requests.get(url, allow_redirects=True)

with open('spreadsheet.html', 'wb') as f:
    f.write(r.content)

with open('spreadsheet.html') as f:
    soup = bs4.BeautifulSoup(f, 'lxml')
    
tbody = soup.find_all('tbody')
assert len(tbody) == 1
tbody = tbody[0]

trs = tbody.find_all('tr')
    
header = []
tr = trs[0]
for td in tr.find_all('td'):
    header.append(td.text.strip())
rows = []
for tr in trs[2:]:
    row = []
    for td in tr.find_all('td'):
        row.append(td.text.strip())
    if row[1] != '':
        rows.append(row)
        
df = pd.DataFrame(rows)
df.columns = header
df.drop('', axis=1, inplace=True)
df.to_csv('data.csv', index=False)