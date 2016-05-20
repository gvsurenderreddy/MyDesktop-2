#!/usr/bin/env python
# -- coding: utf-8 --

# import sys
import time
from ftplib import FTP
from progressbar import ProgressBar, Percentage, Bar, FileTransferSpeed


class ProgressBarWidget(object):
    """This is an element of ProgressBar formatting.

    The ProgressBar object will call it's update value when an update
    is needed. It's size may change between call, but the results will
    not be good if the size changes drastically and repeatedly.
    """
    def update(self, pbar, width):
        """Returns the string representing the widget.

        The parameter pbar is a reference to the calling ProgressBar,
        where one can access attributes of the class for knowing how
        the update must be made.

        At least this function must be overriden."""
        pass


class ETA(ProgressBarWidget):
    "Widget for the Estimated Time of Arrival"
    def format_time(self, seconds):
        return time.strftime('%H:%M:%S', time.gmtime(seconds))
    ""
    def update(self, pbar):
        if pbar.currval == 0:
            return '--:--:--'
        elif pbar.finished:
            return '%s' % self.format_time(pbar.seconds_elapsed)
        else:
            elapsed = pbar.seconds_elapsed
            eta = elapsed * pbar.maxval / pbar.currval - elapsed
            return '%s' % self.format_time(eta)


def FormatSize(size):
    if size < 2 ** 10:
        return "{:.1f}".format(size / 2.0 ** 1) + " B"
    elif size < 2 ** 20:
        return "{:.1f}".format(size / 2.0 ** 10) + " KB"
    elif size < 2 ** 30:
        return "{:.1f}".format(size / 2.0 ** 20) + " MB"
    else:
        return "{:.1f}".format(size / 2.0 ** 30) + " GB"


ftp = FTP("111.1.72.202", "root", "654321")

files = []
ftp.retrlines("NLST", files.append)

print(files)
print()
down = [i for i in files if "exe" in i]
print(down)
print()

for file in down:
    s = ftp.size(file)
    w = [len(file) < 12 and (file + ": ").ljust(14) or (file[0:9] + "...: "),
         FormatSize(s).rjust(8),
         " ",
         Percentage(),
         " ",
         Bar(marker="#", left="[", right="]"),
         " ",
         ETA(),
         " ",
         FileTransferSpeed()]

    pbar = ProgressBar(widgets=w, maxval=s).start()

    with open(file, "wb") as f:
        def callback(chunk):
            f.write(chunk)
            pbar.update(pbar.currval + len(chunk))
        ftp.retrbinary("RETR %s" % file, callback)

    pbar.finish()

ftp.quit()

# yesterday
# datetime.date.today() - datetime.timedelta(days=1)
