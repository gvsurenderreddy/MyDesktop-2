#!/usr/bin/env python
# -*- coding: utf-8 -*-

from random import random
from math import sqrt
from sys import stdout

x = y = inn = out = 0.0

for i in range(30000):
    x = random()
    y = random()
    # print(x, y)
    stdout.write(str(i) + ": (" +
                 str(x) + ", " +
                 str(y) + ")" +
                 "      \r")
    if (sqrt(x * x + y * y) < 1.0):
        inn += 1.0
    else:
        out += 1.0

print()
print(inn / out)
