;= 01 skid =====================================================================
sdat.skid.ch0:
	hummerSpeed	1
	hummerAlterNote	12
	hummerDuty	$57
	hummerModulate	$58
	hummerADSR	$59
	hummerNoteLength $A0-$80
	db $47
	hummerStop
sptr.skid:
	sfxChannel 2, sdat.skid.ch0
	hummerStop

;= 02 rings ====================================================================
sdat.rings.ch0:
	hummerSpeed	1
	hummerAlterNote	$1E
	hummerDuty	$5B
	hummerModulate	$5C
	hummerADSR	$5D
	hummerNoteLength 3
	db $30,$34,$37
	hummerNoteLength 12
	db $3B
	hummerStop
sdat.rings.ch1:
	hummerAlterNote	$1E
	hummerDuty	$5B
	hummerModulate	$5C
	hummerADSR	$5D
	hummerNoteLength 3
	db $30,$30,$34,$37
	hummerNoteLength 12
	db $3B
	hummerStop
sptr.rings: ; 9d83
	sfxChannel 0, sdat.rings.ch0
	sfxChannel 1, sdat.rings.ch1
	hummerStop

;= 03 jump =====================================================================
sdat.jump.ch0:
	hummerSpeed	1
	hummerAlterNote	0
	hummerDuty	$38
	hummerModulate	$39
	hummerADSR	$40
	hummerNoteLength 4
	db $24
	hummerDuty	$5B
	hummerModulate	$5E
	hummerADSR	$5F
	hummerNoteLength $18
	db $30
	hummerStop
sptr.jump:
	sfxChannel 0, sdat.jump.ch0
	hummerStop

;= 04 lose rings ===============================================================
sdat.hit.ch0: 	; 0x0
	hummerSpeed 1
	hummerAlterNote 30
	hummerDuty 91
	hummerModulate 92
	hummerADSR 93
	hummerNoteLength 6
	db nA4
	db nA4
	db nA4
	db nA4
	db nA4
	hummerNoteLength 12
	db nA4
	hummerStop
sdat.hit.ch1: 	; 0x13
	hummerAlterNote 30
	hummerDuty 91
	hummerModulate 92
	hummerADSR 93
	hummerNoteLength 3
	db nRst
	hummerNoteLength 6
	db nB4
	db nB4
	db nB4
	db nB4
	db nB4
	hummerNoteLength 12
	db nA4
	hummerStop
sptr.hit: 	; 0x26
	sfxChannel 0, sdat.hit.ch0
	sfxChannel 1, sdat.hit.ch1
	hummerStop

;= 05 badnik explode ===========================================================
sdat.explode.ch0: 	; 0x0
	hummerSpeed 1
	hummerAlterNote 0
	hummerDuty 66
	hummerModulate 67
	hummerADSR 65
	hummerNoteLength 32
	db nA1
	hummerStop
sptr.explode: 	; 0xd
	sfxChannel 0, sdat.explode.ch0
	hummerStop

;= 06 unknown ==================================================================
sdat.06.ch0: 	; 0x0
	hummerSpeed 1
	hummerAlterNote 0
	hummerDuty 52
	hummerModulate 57
	hummerADSR 70
	hummerNoteLength 24
	db nA2
	hummerStop
sptr.06: 	; 0xd
	sfxChannel 0, sdat.06.ch0
	hummerStop

;= 07 air bubble ===============================================================
sdat.bubble.ch0: 	; 0x0
	hummerSpeed 1
	hummerAlterNote 13
	hummerDuty 96
	hummerModulate 94
	hummerADSR 97
	hummerNoteLength 12
	db nC2
	db nC3
	hummerStop
sptr.bubble: 	; 0xe
	sfxChannel 1, sdat.bubble.ch0
	hummerStop

;= 08 spin dash ================================================================
sdat.dash.ch0: 	; 0x0
	hummerSpeed 1
	hummerAlterNote 24
	hummerDuty 91
	hummerModulate 57
	hummerADSR 17
	hummerNoteLength 2
	db nC4
	db nD4
	db nE4
	db nF4
	db nG4
	db nA4
	db nB4
	db nC5
	hummerNoteLength 64
	db nD5
	hummerStop
sptr.dash: 	; 0x16
	sfxChannel 1, sdat.dash.ch0
	hummerStop

;= 09 kaboom ===================================================================
sdat.boom.ch0: 	; 0x0
	hummerSpeed 3
	hummerAlterNote 1
	hummerDuty 52
	hummerModulate 57
	hummerADSR 70
	hummerNoteLength 10
	db nA2
	hummerStop
sptr.boom: 	; 0xd
	sfxChannel 3, sdat.boom.ch0
	hummerStop

;= 0A checkpoint? ==============================================================
sdat.0A.ch0: 	; 0x0
	hummerSpeed 1
	hummerAlterNote 0
	hummerDuty 91
	hummerModulate 57
	hummerADSR 17
	hummerNoteLength 6
	db nC4
	hummerNoteLength 18
	db nA3
	hummerStop
sptr.0A: 	; 0xf
	sfxChannel 0, sdat.0A.ch0
	hummerStop

;= 0B beep =====================================================================
sdat.0B.ch0: 	; 0x0
	hummerSpeed 1
	hummerAlterNote 24
	hummerDuty 56
	hummerModulate 57
	hummerADSR 64
	hummerNoteLength 4
	db nD4
	hummerStop
sptr.0B: 	; 0xd
	sfxChannel 1, sdat.0B.ch0
	hummerStop
