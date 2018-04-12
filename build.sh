#!/bin/bash

asm6 Somari.nsf.asm -l Somari.nsf;
cmp -l Somari.orig.nsf Somari.nsf | gawk '{printf "%08X %02X %02X\n", $1, strtonum(0$2), strtonum(0$3)}' | less
