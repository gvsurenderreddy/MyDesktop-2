# import this
# s = this.s
# d = {}
# for c in (65, 97):
#     for i in range(26):
#         d[chr(i+c)] = chr((i+13) % 26 + c)

# print 'python'
# print "".join([d.get(c, c) for c in s])

# print ' '.join([str(s) for s in [x for x in range(2, 101)
#                                  if not [y for y in range(2, x)
#                                          if x % y == 0]]])

# n = 9
# s = []
# for i in range(n):
#     c = []
#     for j in range(i+1):
#         if len(s) > 0 and j-1 >= 0 and j <= i-1:
#             c.append(s[-1][j-1]+s[-1][j])
#         else:
#             c.append(1)
#     s.append(c)
# print '\n'.join([' '.join([str(x) for x in row]) for row in s])

#from __future__ import division

#import sys
#import time
#j = '#'
#if __name__ == '__main__':
#    for i in range(1, 61):
#        j += '#'
#        sys.stdout.write(str(int((i/60)*100))+'%  ||'+j+'->'+"\r")
#        sys.stdout.flush()
#        time.sleep(0.5)
#print

#if __name__ == '__main__':
#    for i in range(1, 61):
#        sys.stdout.write('#'+'->'+"\b\b")
#        sys.stdout.flush()
#        time.sleep(0.5)
#print

from progressbar import *

pbar = ProgressBar(widgets=['Working: ', AnimatedMarker()])
for i in pbar((i for i in range(5))):
    time.sleep(0.001)
    
    
    