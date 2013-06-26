#!/usr/bin/env python
import os.path
import struct
from sys import argv, stderr, exit
from glob import glob

class UserError(Exception):
    pass

RECSIZE=280
MAXRECS=2000

def main(gamedir, index):
    if not os.path.isdir(gamedir):
        raise UserError("'%s' is not a directory" % gamedir)
    with open(index, "wb") as out:
        gamecount = 0
        for filename in sorted(glob("%s/*.gba" % gamedir)):
            gamefile = os.path.basename(filename)
            print "Adding %s... " % gamefile
            rec = "nfl:\\GAME\\%s" % gamefile
            if len(rec) > RECSIZE - 1:
                print >>stderr, "Filename is too long: '%s'" % gamefile
                continue
            out.write(rec)
            for x in xrange(RECSIZE - len(rec)):
                out.write('\0')
            gamecount += 1
        for i in xrange(RECSIZE * MAXRECS - out.tell()):
            out.write('\0')
        out.write(struct.pack("<L", gamecount))

if __name__ == '__main__':
    if len(argv) < 2:
        print >>stderr, "Usage: %s dir [index]" % argv[0]
        exit(1)
    gamedir = argv[1]
    if len(argv) >= 3:
        index = argv[2]
    else:
        index = os.path.join(gamedir, "search.jzl")
    try:
        main(gamedir, index)
    except UserError as ex:
        print >>stderr, "Error: %s" % ex.message
        exit(1)
