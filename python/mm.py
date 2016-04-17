#!/usr/bin/env python
# -*- coding: utf-8 -*-

from ctypes import windll, wintypes, byref, Structure
from operator import add, sub, mul, floordiv, mod
from random import randint, choice
from sys import exit, platform

OP = {'+': add, '-': sub, 'x': mul, '/': floordiv}

STD_INPUT_HANDLE = -10
STD_OUTPUT_HANDLE = -11
STD_ERROR_HANDLE = -12

BLACK = 0x00
BLUE = 0x01
GREEN = 0x02
CYAN = 0x03
RED = 0x04
MAGENTA = 0x05
YELLOW = 0x06
WHITE = 0x07

NORMAL = 0x00
BRIGHT = 0x08

CloseHandle = windll.kernel32.CloseHandle
GetStdHandle = windll.kernel32.GetStdHandle
GetConsoleScreenBufferInfo = windll.kernel32.GetConsoleScreenBufferInfo
SetConsoleTextAttribute = windll.kernel32.SetConsoleTextAttribute


class CONSOLE_SCREEN_BUFFER_INFO(Structure):
    _fields_ = [
        ('dwSize', wintypes._COORD),
        ('dwCursorPosition', wintypes._COORD),
        ('wAttributes', wintypes.WORD),
        ('srWindow', wintypes.SMALL_RECT),
        ('dwMaximumWindowSize', wintypes._COORD),
    ]


def err(x, o, y):
    if o == '/':
        pass
    elif o == 'x':
        m = max(len(str(x)), len(str(y)), len(str(OP[o](x, y))))
        print(str(x).rjust(m + 3))
        print((o + ' ' * (m + 2 - len(str(y))) + str(y)).rjust(m + 3))
        print('-' * (m + 3))
        for i in range(len(str(y))):
            print(str(x * (y // 10 ** i % 10)).rjust(m + 3 - i))
        print('-' * (m + 3))
        print(str(OP[o](x, y)).rjust(m + 3))
    else:
        m = max(len(str(x)), len(str(y)), len(str(OP[o](x, y))))
        print(str(x).rjust(m + 3))
        print((o + ' ' * (m + 2 - len(str(y))) + str(y)).rjust(m + 3))
        print('-' * (m + 3))
        print(str(OP[o](x, y)).rjust(m + 3))


def calc():
    c = 0
    handle = windll.kernel32.GetStdHandle(STD_OUTPUT_HANDLE)
    info = CONSOLE_SCREEN_BUFFER_INFO()
    GetConsoleScreenBufferInfo(handle, byref(info))
    color = info.wAttributes
    SetConsoleTextAttribute(handle, WHITE)

    try:
        n = int(input('请输入最大位数: '))
        m = int(input('请输入答题次数: '))
    except (KeyboardInterrupt, ValueError):
        SetConsoleTextAttribute(handle, RED | BRIGHT)
        print('请输入数字')
        SetConsoleTextAttribute(handle, color)
        exit()

    for i in range(m):
        x = randint(1, 10 ** n - 1)
        y = randint(1, 10 ** n - 1)
        # o = choice('+-x/')
        o = choice('+-')
        if (o == '-' or o == '/') and (x < y):
            x, y = y, x
        if o == '/' and (mod(x, y) != 0):
            pass  # 处理余数

        try:
            z = int(input('\n{} {} {} = '.format(x, o, y)))
            if z == OP[o](x, y):
                SetConsoleTextAttribute(handle, GREEN | BRIGHT)
                print('正确\n')
                SetConsoleTextAttribute(handle, WHITE)
                c += 1
            else:
                SetConsoleTextAttribute(handle, RED | BRIGHT)
                print('错误\n')
                err(x, o, y)
                SetConsoleTextAttribute(handle, WHITE)
        except (KeyboardInterrupt, ValueError):
            SetConsoleTextAttribute(handle, RED | BRIGHT)
            print('请输入数字')
            SetConsoleTextAttribute(handle, WHITE)

    print('\n' + '=' * 25)
    print('错误数: {:d}'.format(m - c))
    print('正确率: {:.0%}'.format(c / m))
    input('\n按【回车键】结束...')
    SetConsoleTextAttribute(handle, color)


if __name__ == '__main__':
    if platform == 'win32':
        calc()
    else:
        input('\n系统不支持,按【回车键】结束...')
