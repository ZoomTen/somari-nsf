mdat.actclear.ch0: 	; 0x8a50
	hummerSpeed 2
	hummerAlterNote 0
	hummerDuty 52
	hummerModulate 57
	hummerADSR 70
	hummerNoteLength 5
	db nC1
	db nC1
	hummerNoteLength 10
	db nRst
	db nRst
	hummerNoteLength 5
	db nC1
	db nC1
	hummerNoteLength 10
	db nRst
	db nRst
	hummerDuty 66
	hummerModulate 67
	hummerADSR 65
	hummerNoteLength 5
	db nA1
	db nA1
	db nA1
	db nA1
	db nA1
	db nA1
	db nA1
	db nA1
	hummerDuty 18
	hummerModulate 0
	hummerADSR 17
	db nRst
	db nC5
	db nB4
	db nG4
	hummerNoteLength 40
	db nC4
	hummerStop

mdat.actclear.ch1: 	; 0x8a82
	hummerAlterNote 0
	hummerDuty 18
	hummerModulate 0
	hummerADSR 17
	hummerNoteLength 10
	db nG3
	db nC4
	db nB3
	db nG3
	db nC4
	db nB3
	db nG3
	db nC4
	hummerNoteLength 20
	db nB3
	hummerNoteLength 5
	db nRst
	db nC4
	db nB3
	db nG3
	hummerNoteLength 40
	db nA3
	hummerStop

mdat.actclear.ch2: 	; 0x8a9d
	hummerAlterNote 0
	hummerDuty 7
	hummerModulate 5
	hummerADSR 2
	hummerNoteLength 10
	db nG3
	db nA3
	db nB3
	db nC4
	db nD4
	db nE4
	db nF4
	db nG4
	hummerNoteLength 30
	db nA4
	hummerNoteLength 10
	db nG3
	hummerNoteLength 40
	db nA3
	hummerStop

mdat.actclear.ch3: 	; 0x8ab5
	hummerAlterNote 0
	hummerDuty 0
	hummerModulate 0
	hummerADSR 83
	hummerNoteLength 5
	db nC3
	db nC3
	hummerNoteLength 10
	db nRst
	db nRst
	hummerNoteLength 5
	db nC3
	db nC3
	hummerNoteLength 10
	db nRst
	db nRst
	hummerNoteLength 5
	db nF3
	db nF3
	db nC3
	db nC3
	db nB2
	db nB2
	db nA2
	db nA2
	db nA2
	db nRst
	hummerNoteLength 10
	db nC3
	hummerNoteLength 30
	db nC3
	hummerStop

mdat.actclear.ch4: 	; 0x8ad9
	hummerStop

mptr.actclear: 	; 0x8ada
	musicChannel 0, mdat.actclear.ch0
	musicChannel 1, mdat.actclear.ch1
	musicChannel 2, mdat.actclear.ch2
	musicChannel 3, mdat.actclear.ch3
	musicChannel 4, mdat.actclear.ch4
	hummerStop
