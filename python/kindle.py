#!/usr/bin/env python
# -- coding: utf-8 --
# Python 3.5

import os
import re
import sys
import shutil
import locale


def GetPath():
    if sys.platform == "win32":
        x = os.popen("wmic VOLUME WHERE Label='kindle' GET DriveLetter").read()
        try:
            pos = x.index(":")
            return x[pos-1:pos+1] + "\\documents\\"
        except ValueError:
            print("\nNO KINDLE DEVICE FOUND!")
            sys.exit()
    else:
        print("\nNot supported system.")
        sys.exit()


def main():
    KindlePath = GetPath()

    if sys.stdout.isatty():
        encoding = sys.stdout.encoding
    else:
        encoding = locale.getpreferredencoding()

    try:
        Files = [os.path.normcase(i) for i in os.listdir(KindlePath)
                 if os.path.isfile(os.path.join(KindlePath, i))]
        Dirs = [os.path.normcase(i) for i in os.listdir(KindlePath)
                if os.path.isdir(os.path.join(KindlePath, i))]
        Dels = [i for i in Dirs
                if i not in [re.sub(r'\.\w+$', '.sdr', j) for j in Files]]
        for i in Dels:
            if i != "dictionaries":
                print(("Deleting %s%s" % (KindlePath, i))
                      .encode(encoding, 'ignore').decode(encoding))
                shutil.rmtree(KindlePath + i)
        print("\n%s directories deleted.\n"
              % (("dictionaries" in Dels)
                  and str((len(Dels) - 1))
                  or str(len(Dels))))
        os.system("pause")
    except WindowsError as err:
        print(str(err))


if __name__ == '__main__':
    main()
