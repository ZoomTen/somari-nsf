# Somari.nsf Disassembly

## Info
A very work-in-progress disassembly of Somari.nsf.

I guess so y'all can make some authentic bootleg music, lol

For use with compilation with (asm6)[http://www.romhacking.net/utilities/674/], the cross-platform 6502 assembler.

## Building
`build.sh` requires asm6 in `$PATH` and gawk installed. The actual Somari nsf should be present under the name `Somari.orig.nsf`.

Generally you should build it with:
```
asm6 Somari.nsf.asm -l Somari.nsf
```

The following files should be generated:
 * Somari.nsf `md5: 71d0dbea6d2c8feae26609c20dc40a1f`
 * Somari.nsf.lst

Included is `hummermusdis.py`, a crappy Python 3 script to disassemble Hummer Team sound data.
