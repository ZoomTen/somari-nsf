mdat.2D.ch0: 	; 0x0
	hummerSpeed 1
	hummerAlterNote 12
	hummerDuty 91
	hummerModulate 57
	hummerADSR 17
	hummerNoteLength 8
	db nC3
	db nE3
	db nG3
	db nD3
	db nF3
	db nA3
	db nE3
	db nG3
	db nB3
	db nF3
	db nA3
	db nC4
	db nG3
	db nB3
	hummerNoteLength 64
	db nD4
	hummerStop

mdat.2D.ch1: 	; 0x1c
	hummerAlterNote 12
	hummerDuty 91
	hummerModulate 57
	hummerADSR 17
	hummerNoteLength 4
	db nRst
	hummerNoteLength 8
	db nC3
	db nE3
	db nG3
	db nD3
	db nF3
	db nA3
	db nE3
	db nG3
	db nB3
	db nF3
	db nA3
	db nC4
	db nG3
	db nB3
	db nD4
	hummerDuty 56
	hummerModulate 57
	hummerADSR 64
	db nG3
	db nB3
	db nD4
	db nG3
	db nB3
	db nD4
	hummerStop

mdat.2D.ch2: 	; 0x43
	hummerStop

mptr.continue: 	; 0x44
	musicChannel 0, mdat.2D.ch0
	musicChannel 1, mdat.2D.ch1
	musicChannel 2, mdat.2D.ch2
	musicChannel 3, mdat.2D.ch2
	musicChannel 4, mdat.2D.ch2
	hummerStop
