#!/usr/bin/env python
# -- coding: utf-8 --

import os


def main():
    myPath = "release\\"


    try:
        Dirs = [os.path.normcase(i) for i in os.listdir(myPath)]
        for i in Dirs:
            newPath = os.path.join(myPath, i)
            Files = [os.path.normcase(j)
                     for j in os.listdir(os.path.join(newPath))
                     if j != "desc"]
            if len(Files) > 1:
                print(Files)
                os.remove(os.path.join(newPath, Files[0]))
    except WindowsError as err:
        print(str(err))


if __name__ == '__main__':
    main()
