#!/usr/bin/env python
# -- coding: utf-8 --

times = int(raw_input("enter how many times: "))
print "enter %d words" % times
lists = []
for i in range(times):
    lists.append(raw_input("No. %d input: " % i))

print lists
print sorted(lists)
print lists

x = int(raw_input("enter No x to show: "))
if x < len(lists):
    print lists[x]

y = raw_input("enter a word: ")
z = raw_input("enter a new word: ")
if y in lists:
    lists[lists.index(y)] = z
    print lists
