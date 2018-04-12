; Hummer/Somari Sound Engine
; Coord flag macros and equates
; Currently incomplete

; Sound engine macros
; F0xxxx - Call "subroutine" at xxxx, saving return point
	MACRO hummerCall x
		.db $F0
		.dw x
	ENDM

; F4xxxx - Jump to xxxx
	MACRO hummerJump x
		.db $F4
		.dw x
	ENDM

; F5xx - Set delay between ticks to xx
;        Equivalent to set Speed in FamiTracker
	MACRO hummerSpeed x
		.db $F5, x
	ENDM

; F6xx - Alter/transpose note values by xx
	MACRO hummerAlterNote x
		.db $F6, x
	ENDM

; 8x,9x,Ax - Set length of a single note
;            Roughly the equivalent of row gaps between notes in FamiTracker
	MACRO hummerNoteLength x
		.db $80+x
	ENDM

; F8xx - Volume modulation table index (in $8200)
	MACRO hummerADSR x
		.db $F8, x
	ENDM

; F9xx - Duty cycle modulation table index (in $8200)
	MACRO hummerDuty x
		.db $F9, x
	ENDM

; FAxx - Pitch modulation table index (in $8200)
	MACRO hummerModulate x
		.db $FA, x
	ENDM

; F2 - End of channel
	MACRO hummerStop x
		.db $FF
	ENDM


; Header macros
; Header - Set up SFX channel
	MACRO sfxChannel x,y
		.db $80+x
		.dw y
	ENDM

; Header - Set up music channel
	MACRO musicChannel x,y
		.db x
		.dw y
	ENDM
