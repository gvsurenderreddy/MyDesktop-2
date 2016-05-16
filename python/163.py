#!/usr/bin/env python
# -*- coding:utf-8 -*-

# 网易云音乐批量下载

import requests
import urllib
import sys

if sys.stdout.isatty():
    encoding = sys.stdout.encoding
else:
    encoding = locale.getpreferredencoding()

# 榜单歌曲批量下载
# r = requests.get('http://music.163.com/api/playlist/detail?id=2884035')
# 网易原创歌曲榜
# r = requests.get('http://music.163.com/api/playlist/detail?id=19723756')
# 云音乐飙升榜
# r = requests.get('http://music.163.com/api/playlist/detail?id=3778678')
# 云音乐热歌榜
# r = requests.get('http://music.163.com/api/playlist/detail?id=3779629')
# 云音乐新歌榜

# 歌单歌曲批量下载
# r = requests.get('http://music.163.com/api/playlist/detail?id=123415635')
# 云音乐歌单——【华语】中国风的韵律，中国人的印记
# r = requests.get('http://music.163.com/api/playlist/detail?id=122732380')
# 云音乐歌单——那不是爱，只是寂寞说的谎

r = requests.get('http://music.163.com/api/playlist/detail?id=30725581')

arr = r.json()['result']['tracks']  # 共有100首歌

for i in range(999):  # 输入要下载音乐的数量，1到100。
    name = str(i+1) + ' ' + arr[i]['name'] + '.mp3'
    link = arr[i]['mp3Url']
    try:
        urllib.request.urlretrieve(link, '网易云音乐\\' + name)  # 提前要创建文件夹
    except FileNotFoundError as e:
        # raise e
        i += 1
        continue

    print(name.encode(encoding, 'ignore').decode(encoding) + ' 下载完成')
