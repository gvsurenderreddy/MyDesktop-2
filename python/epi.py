#!/usr/bin/env python
# -*- coding: utf-8 -*-

from random import random
from math import sqrt

x = y = inn = out = 0.0


for i in range(300000):
    x = random()
    y = random()
    print(x, y)
    if (sqrt(x * x + y * y) < 1.0):
        inn += 1.0
    else:
        out += 1.0

# print(inn, out)
print(inn / out)
