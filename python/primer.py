#!/usr/bin/env python
# -*- coding:utf-8 -*-

import math


def is_primer(n):
    if n % 2 == 0 and n > 2:
        return False
    for i in range(3, int(math.sqrt(n)) + 1, 2):
        if n % i == 0:
            return False
    return True


def return_primerL(n):
    while True:
        if is_primer(n):
            return n
        n -= 1


def return_primerR(n):
    while True:
        if is_primer(n):
            return n
        n += 1


if __name__ == '__main__':
    number = int(input("Enter a number:\n"))
    print(return_primerL(number))
    print(return_primerR(number))
