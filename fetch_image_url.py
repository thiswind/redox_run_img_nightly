import sys
line = sys.stdin.buffer.read()

from bs4 import BeautifulSoup
from typing import List
import sys


bs = BeautifulSoup(line, features='lxml')
link_list:List = bs.findAll('a')
if len(link_list) == 1:
    link = link_list[0]
    image_file_name:str = link.get('href')
    print(f'https://static.redox-os.org/img/{image_file_name}'.strip())
else:
    sys.exit(1)


