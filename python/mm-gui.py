#!/usr/bin/env python
# -*- coding: utf-8 -*-

from operator import add, sub, mul, floordiv, mod
from random import randint, choice
from easygui import integerbox, msgbox

OP = {'+': add, '-': sub, 'x': mul, '/': floordiv}


def err(x, o, y):
    err = '错误\n'
    z = OP[o](x, y)

    if o == '/':
        pass
    elif o == 'x':
        m = max(len(str(x)), len(str(y)), len(str(z)))
        err += str(x).rjust(m + 3) + '\n'
        err += (o + ' ' * (m + 2 - len(str(y))) + str(y)).rjust(m + 3) + '\n'
        err += '-' * (m + 4) + '\n'
        for i in range(len(str(y))):
            err += str(x * (y // 10 ** i % 10)).rjust(m + 3 - i) + '\n'
        err += '-' * (m + 3) + '\n'
        err += str(z).rjust(m + 3)
        # print(str(x).rjust(m + 3))
        # print((o + ' ' * (m + 2 - len(str(y))) + str(y)).rjust(m + 3))
        # print('-' * (m + 3))
        # for i in range(len(str(y))):
        #     print(str(x * (y // 10 ** i % 10)).rjust(m + 3 - i))
        # print('-' * (m + 3))
        # print(str(z).rjust(m + 3))
    else:
        m = max(len(str(x)), len(str(y)), len(str(z)))
        err += str(x).rjust(m + 3) + '\n'
        err += (o + ' ' * (m + 2 - len(str(y))) + str(y)).rjust(m + 3) + '\n'
        err += '-' * (m + 4) + '\n'
        err += str(z).rjust(m + 3)
        # print(str(x).rjust(m + 3))
        # print((o + ' ' * (m + 2 - len(str(y))) + str(y)).rjust(m + 3))
        # print('-' * (m + 3))
        # print(str(OP[o](x, y)).rjust(m + 3))

    msgbox(err)
    # msgbox('正确答案: ' + str(z), '错误')


def calc():
    c = 0
    n = integerbox('请输入最大位数', '位数')
    m = integerbox('请输入答题次数', '次数')

    for i in range(m):
        x = randint(1, 10 ** n - 1)
        y = randint(1, 10 ** n - 1)
        # o = choice('+-x/')
        o = choice('+-x')
        if (o == '-' or o == '/') and (x < y):
            x, y = y, x
        if o == '/' and (mod(x, y) != 0):
            pass  # 处理余数

        z = integerbox('\n{} {} {} = '.format(x, o, y))
        if z == OP[o](x, y):
            # msgbox('正确')
            c += 1
        else:
            err(x, o, y)

    msg = '答题数: {:d}'.format(m)
    msg += '\n错误数: {:d}'.format(m - c)
    msg += '\n正确率: {:.0%}'.format(float(c) / m)
    msgbox(msg)


if __name__ == '__main__':
    calc()
