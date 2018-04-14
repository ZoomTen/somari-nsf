mdat.2C.ch0: 	; 0x0
	hummerSpeed 1
	hummerAlterNote 12
	hummerDuty 91
	hummerModulate 57
	hummerADSR 17
	hummerNoteLength 6
	db nE3
	db nG3
	db nC4
	hummerNoteLength 12
	db nE4
	db nC4
	hummerNoteLength 48
	db nG4
	hummerStop

mdat.2C.ch1: 	; 0x14
	hummerAlterNote 0
	hummerDuty 56
	hummerModulate 57
	hummerADSR 64
	hummerNoteLength 6
	db nE2
	db nG2
	db nC3
	hummerNoteLength 12
	db nE3
	db nC3
	hummerAlterNote 24
	hummerDuty 0
	hummerModulate 0
	hummerADSR 50
	hummerNoteLength 5
	db nG4
	db nF4
	db nE4
	db nD4
	db nG4
	db nF4
	db nE4
	db nD4
	hummerNoteLength 6
	db nG4
	db nF4
	db nE4
	db nD4
	db nG4
	db nF4
	db nE4
	db nD4
	hummerStop

mdat.2C.ch2: 	; 0x3e
	hummerAlterNote 0
	hummerDuty 7
	hummerModulate 5
	hummerADSR 3
	hummerNoteLength 6
	db nE3
	db nG3
	db nC4
	hummerNoteLength 12
	db nE4
	db nC4
	hummerNoteLength 48
	db nC4
	hummerStop

mdat.2C.ch3: 	; 0x50
	hummerStop

mptr.emerald: 	; 0x51
	musicChannel 0, mdat.2C.ch0
	musicChannel 1, mdat.2C.ch1
	musicChannel 2, mdat.2C.ch2
	musicChannel 3, mdat.2C.ch3
	musicChannel 4, mdat.2C.ch3
	hummerStop
