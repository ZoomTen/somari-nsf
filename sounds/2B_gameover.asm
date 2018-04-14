mdat.2B.ch0: 	; 0x0
	hummerSpeed 1
	hummerAlterNote 9
	hummerDuty 18
	hummerModulate 0
	hummerADSR 17
	hummerNoteLength 24
	db nRst
	hummerNoteLength 12
	db nE3
	db nRst
	db nE3
	db nRst
	db nE3
	db nRst
	hummerNoteLength 48
	db nF3
	db nD3
	hummerNoteLength 12
	db nE3
	db nRst
	db nE3
	db nRst
	db nE3
	db nRst
	db nC3
	db nRst
	hummerNoteLength 48
	db nBb2
	db nD3
	hummerNoteLength 12
	db nEb3
	db nEb3
	hummerNoteLength 24
	db nD3
	db nCs3
	db nC3
	hummerDuty 91
	hummerModulate 57
	hummerADSR 17
	db 224
	db nB2
	hummerStop

mdat.2B.ch1: 	; 0x32
	hummerAlterNote 9
	hummerDuty 18
	hummerModulate 0
	hummerADSR 17
	hummerNoteLength 24
	db nC2
	db nC2
	db nG1
	db nG1
	hummerNoteLength 48
	db nBb1
	hummerNoteLength 12
	db nA1
	db nBb1
	hummerNoteLength 24
	db nA1
	db nC2
	db nC2
	db nG1
	db nG1
	hummerNoteLength 48
	db nF2
	hummerNoteLength 12
	db nE2
	db nF2
	hummerNoteLength 24
	db nE2
	hummerNoteLength 12
	db nCs2
	db nCs2
	hummerNoteLength 24
	db nC2
	db nB1
	db nBb1
	db 224
	db nG1
	hummerStop

mdat.2B.ch2: 	; 0x5b
	hummerAlterNote 9
	hummerDuty 56
	hummerModulate 57
	hummerADSR 64
	hummerNoteLength 24
	db nC3
	db nC3
	db nG2
	db nG2
	hummerNoteLength 48
	db nBb2
	db nA2
	hummerNoteLength 24
	db nC3
	db nC3
	db nG2
	db nG2
	hummerNoteLength 48
	db nF3
	db nE3
	hummerStop

mdat.2B.ch3: 	; 0x74
	hummerStop

mptr.gameover: 	; 0x75
	musicChannel 0, mdat.2B.ch0
	musicChannel 1, mdat.2B.ch1
	musicChannel 2, mdat.2B.ch2
	musicChannel 3, mdat.2B.ch3
	musicChannel 4, mdat.2B.ch3
	hummerStop
