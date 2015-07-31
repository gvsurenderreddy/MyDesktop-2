#!/usr/bin/env python3
# -*- coding:utf-8 -*-

from random import uniform
from math import sqrt
from sys import stdout

x = y = r = 0.0
N = 30000

for i in range(N):
    x = uniform(0.0, 1.0)
    y = uniform(0.0, 1.0)
    stdout.write(str(i) + ": (" +
                 str(x) + ", " +
                 str(y) + ")" +
                 "      \r")
    if (sqrt(x * x + y * y) <= 1.0):
        r += 1

stdout.write("\n" + str(4.0 * r / N) + "\n")
