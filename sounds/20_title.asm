mdat.titleScreen.ch0: 	; 0x8800
	hummerSpeed 1
	hummerAlterNote 11
	hummerDuty	$04
	hummerModulate	$05
	hummerADSR	$02
	hummerNoteLength 16
	db nRst
	db nRst
	db nRst
	db nRst
	hummerNoteLength 8
	db nE3
	db nRst
	db nE3
	db nRst
	db nE3
	db nRst
	db nE3
	db nRst
	db nF3
	hummerNoteLength 24
	db nF3
	hummerNoteLength 32
	db nD3
	hummerNoteLength 8
	db nE3
	db nRst
	db nE3
	db nRst
	db nE3
	db nRst
	db nC3
	db nRst
	db nBb2
	hummerNoteLength 24
	db nBb2
	hummerNoteLength 32
	db nD3
	hummerNoteLength 16
	db nC3
	db nG3
	db nC4
	db nA3
	hummerNoteLength 8
	db nB3
	hummerNoteLength 24
	db nB3
	hummerNoteLength 48
	db nC4
	hummerStop

mdat.titleScreen.ch1: 	; 0x8837
	hummerAlterNote 11
	hummerDuty	$17
	hummerModulate	$16
	hummerADSR	$14
	hummerNoteLength 16
	db nRst
	db nRst
	db nRst
	db nRst
	hummerNoteLength 8
	db nE4
	db nRst
	db nE4
	db nRst
	db nE4
	db nRst
	db nE4
	db nRst
	db nF4
	hummerNoteLength 24
	db nF4
	hummerNoteLength 32
	db nD4
	hummerNoteLength 8
	db nE4
	db nRst
	db nE4
	db nRst
	db nE4
	db nRst
	db nC4
	db nRst
	db nBb3
	hummerNoteLength 24
	db nBb3
	hummerNoteLength 32
	db nD4
	hummerNoteLength 16
	db nC4
	db nG4
	db nC5
	db nC4
	hummerNoteLength 8
	db nB3
	hummerNoteLength 24
	db nB4
	hummerNoteLength 48
	db nC5
	hummerStop

mdat.titleScreen.ch2: 	; 0x886c
	hummerAlterNote 11
	hummerDuty 4
	hummerModulate 5
	hummerADSR 2
	hummerNoteLength 16
	db nRst
	db nRst
	db nRst
	db nRst
	db nE2
	db nE2
	db nC2
	db nC2
	hummerNoteLength 32
	db nBb1
	hummerNoteLength 8
	db nD2
	db nEb2
	db nD2
	db nC2
	hummerNoteLength 16
	db nE2
	db nE2
	db nC2
	db nC2
	hummerNoteLength 32
	db nF2
	hummerNoteLength 8
	db nE2
	db nF2
	db nE2
	db nC2
	hummerNoteLength 16
	db nC2
	db nC2
	db nE2
	db nG1
	hummerNoteLength 8
	db nB1
	hummerNoteLength 24
	db nB1
	hummerNoteLength 32
	db nC2
	hummerStop

mdat.titleScreen.ch3: 	; 0x889c
	hummerAlterNote 10
	hummerDuty 0
	hummerModulate 0
	hummerADSR 83
	hummerNoteLength 16
	db nC3
	db nF3
	db nF3
	db nF3
	db nC3
	db nC3
	hummerNoteLength 8
	db nC3
	db nC3
	hummerNoteLength 16
	db nC3
	db nC3
	db nC3
	hummerNoteLength 8
	db nC3
	db nC3
	hummerNoteLength 16
	db nC3
	db nC3
	db nC3
	hummerNoteLength 8
	db nC3
	db nC3
	hummerNoteLength 16
	db nC3
	db nC3
	db nC3
	hummerNoteLength 8
	db nC3
	db nC3
	hummerNoteLength 16
	db nC3
	db nC3
	db nC3
	hummerNoteLength 8
	db nC3
	db nC3
	hummerNoteLength 16
	db nC3
	db nC3
	db nC3
	db nC3
	db nC3
	hummerStop

mdat.titleScreen.ch4: 	; 0x88d1
	hummerStop

mptr.titleScreen: 	; 0x88d2
	musicChannel 0, mdat.titleScreen.ch0
	musicChannel 1, mdat.titleScreen.ch1
	musicChannel 2, mdat.titleScreen.ch2
	musicChannel 3, mdat.titleScreen.ch3
	musicChannel 4, mdat.titleScreen.ch4
	hummerStop
