#!/usr/bin/env python2
# -*- coding: utf-8 -*-

import os
import urllib
import re
import time
import datetime


def getHtml(url):
    return urllib.urlopen(url).read()


def getImgUrl(html):
    reg = re.compile(r'(http://s.cn.bing.net/.*?\.jpg)')
    url = reg.findall(html)
    print url[0]
    return url[0]


def downloadImg(url, path):
    xpath = path + '\\' + str(datetime.date.today()) + '.jpg'
    print xpath
    urllib.urlretrieve(url, xpath)


if __name__ == '__main__':
    start = time.time()
    html = getHtml('http://cn.bing.com/')
    url = getImgUrl(html)
    downloadImg(url, os.getcwd())
    end = time.time()
    print 'done %.2f seconds' % (end-start)
