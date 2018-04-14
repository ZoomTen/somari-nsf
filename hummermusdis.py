#!/bin/python3

import math
import sys

'''
Hummer Music Disassembly Tool
'''

version="0.1wip"
cpy="ZoomTen 2018/04/12\n"
notenames=["nA0", "nBb0", "nB0", "nC1", "nCs1", "nD1", "nEb1", "nE1", "nF1", "nFs1", "nG1", "nAb1", "nA1", "nBb1", "nB1", "nC2", "nCs2", "nD2", "nEb2", "nE2", "nF2", "nFs2", "nG2", "nAb2", "nA2", "nBb2", "nB2", "nC3", "nCs3", "nD3", "nEb3", "nE3", "nF3", "nFs3", "nG3", "nAb3", "nA3", "nBb3", "nB3", "nC4", "nCs4", "nD4", "nEb4", "nE4", "nF4", "nFs4", "nG4", "nAb4", "nA4", "nBb4", "nB4", "nC5", "nCs5", "nD5", "nEb5", "nE5", "nF5", "nFs5", "nG5", "nAb5", "nA5", "nBb5", "nB5"]

def ReadSheet(fn, name, base, e, nc):
 """
 fn   = filename
 name = song name
 base = base address in \\xHH\\xLL format
 e    = whether or not to print addresses
 nc   = num of channels
 """
 b=0	# channel indexing
 c=0	# mode set
 	# 0 = regular
 	# 1 = header mode
 d=""	# song num.
 print("mdat."+name+str(d)+".ch"+str(b)+":","\t;", hex(int.from_bytes(base,'big')) )
 with open(fn,'rb') as a:
  a.seek(0,2)
  length = a.tell()
  a.seek(0)
  while a.tell() != length:
   p = a.read(1)

   x = int.from_bytes(p,'big')

   if e == True: # print location every line, because I can't label yet :/
    print(";", hex(int.from_bytes(base,'big')+a.tell()-1))

   if c == 0: # Normal mode
    #00
    if x == 0:
     print("\tdb nRst")

   #09-47
    elif 9 <= x <= 71:
     print("\tdb", notenames[x-9])

   #80-df
    elif 129 <= x <= 223:
     q=int.from_bytes(p,'big')
     print("\thummerNoteLength",q-128)

   #f0
    elif x == 240:
     q=int.from_bytes(a.read(2),'little')
     print("\thummerCall","$"+hex(q)[2:])

   #f1
    elif x == 241:
     print("\thummerReturn")

   #f4
    elif x == 244:
     q=int.from_bytes(a.read(2),'little')
     print("\thummerJump","$"+hex(q)[2:])

   #f5
    elif x == 245:
     q=int.from_bytes(a.read(1),'big')
     print("\thummerSpeed",q)

   #f6
    elif x == 246:
     q=int.from_bytes(a.read(1),'big')
     print("\thummerAlterNote",q)

   #f8
    elif x == 248:
     q=int.from_bytes(a.read(1),'big')
     print("\thummerADSR",q)

   #f9
    elif x == 249:
     q=int.from_bytes(a.read(1),'big')
     print("\thummerDuty",q)

   #fa
    elif x == 250:
     q=int.from_bytes(a.read(1),'big')
     print("\thummerModulate",q)

   #ff
    elif x == 255:
     print("\thummerStop")
     print()
     if b < int(nc):
      b = b + 1
      print("mdat."+name+str(d)+".ch"+str(b)+":","\t;", hex(int.from_bytes(base,'big')+a.tell()) )
     else:
      print("mptr."+name+str(d)+":","\t;", hex(int.from_bytes(base,'big')+a.tell()) )
      c=1
   ###
    else:
     print("\tdb",x)

   else:  # Header mode
          # this strictly follows the Hummer Team music data convention
    if x == 255:
     print("\thummerStop")
     break
     #print()
     #b=0
     #c=0
     #d=d+1
     #print("mdat."+name+str(d)+".ch"+str(b)+":","\t;", hex(int.from_bytes(base,'big')+a.tell()) )
    else:
     q=int.from_bytes(a.read(2),'little')
     if q:
      if 0 <= x <= 127:
       print("\tmusicChannel",str(x)+",","$"+hex(q)[2:])
      else:
       print("\tsfxChannel",str(x-128)+",","$"+hex(q)[2:])
#===============================================================================

if len(sys.argv) < 4:
 print("HummerTeam Music Disassembler",version)
 print(cpy)
 print(sys.argv[0],"filename.ext","project_name","base_addr","[num_channels]","[print_offsets]\n")
 print("Example usage:",sys.argv[0],"music_dump.bin","MusicDump","88da","3","Y\n")
 print("num_channels defaults to 4 if unspecified.")
 print("print_offsets defaults to False if unspecified, True otherwise.")
 print("To output to a file, simply add \">\" followed by the filename and ext.\n")
 print("For use with hummer_macros.inc, and ASM6.\n")
 print("This disassembler works with the standard Hummer Team format:\ndata first, then headers.")
else:
 fn = sys.argv[1]
 pr = sys.argv[2]
 ba = sys.argv[3]
 bs = bytes.fromhex(ba.zfill(len(ba)+len(ba)%2))

 nc = 4
 try:
  sys.argv[4]
 except:
  pass
 else:
  nc = sys.argv[4]

 of = False
 try:
  sys.argv[5]
 except:
  pass
 else:
  of = True

 ReadSheet(fn, pr, bs, of, nc)
