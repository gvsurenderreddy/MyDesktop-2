#!/usr/bin/env python
# -- coding: utf-8 --

import os


def main():
    myPath = "release\\"

    try:
        Dirs = [os.path.normcase(i) for i in os.listdir(myPath)]
        for i in Dirs:
            Files = [os.path.normcase(j)
                     for j in os.listdir(os.path.join(myPath, i))
                     if j != "desc"]
            if len(Files) > 1:
                print(Files)
                os.remove(os.path.join(myPath, i, Files[0]))
    except WindowsError as err:
        print(str(err))


if __name__ == '__main__':
    main()
