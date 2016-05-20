#!/usr/bin/env python
# -- coding: utf-8 --

from __future__ import division
import math
import sys


def progressbar(cur, total):
    "This is a text progressbar for python"
    percent = '{:.2%}'.format(cur / total)
    sys.stdout.write('\r')
    sys.stdout.write("[%-50s] %s" %
                     ('=' * int(math.floor(cur * 50 / total)), percent))
    sys.stdout.flush()


# An example below:
import time
x = 1000
for i in range(x):
    time.sleep(0.01)
    progressbar(i + 1, x)
