import sys
line = sys.stdin.buffer.read()

from bs4 import BeautifulSoup
import sys


bs = BeautifulSoup(line, features='lxml')
link_list = bs.findAll('a')
if len(link_list) == 1:
    link = link_list[0]
    image_file_name= link.get('href')
    print('https://static.redox-os.org/img/{}'.format(image_file_name).strip())
else:
    sys.exit(1)


