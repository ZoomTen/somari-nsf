; == ASM6 ==

; ==============================================================================
; Somari.nsf Disassembly
; Hummer / Somari Sound Engine r2
; (c) 1992- Copyright/Hummer Team/Somari Team
;
; ZoomTen 2018/04
; Work in progress
; ==============================================================================

	include "include/hummer_macros.inc"
	include "include/hummer_constants.inc"
; ==============================================================================
; NSF Header
	.org $0
Header:
	.db "NESM",$1A	; NESM
	.db 1		; version 1
	.db 26		; num. songs
	.db 1		; starting song

	.dw Start	; Load
	.dw Init	; Init
	.dw Play	; Play

	.org $E		; Game name
	.db "Somari"

	.org $2E	; Composers
	.db "<?>"

	.org $4E	; Copyright
	.db "199? Somari Team"

	.org $6E
	.dw $411a	; NTSC play speed
	.dsb 8, 0	; bankswitch inits
	.dw $0000	; PAL play speed
	.db 0		; PAL/NTSC flags
	.db 0		; Expansion chips +
	.db 0		; -=-=-=-=-=-=-=- +
	.dsb 3, 0	; padding


; ==============================================================================
; Start of program
	$=$8000
	.org $8000
Start:
	; This appears to be the SFX header pointers.
	; Located at 0x34010 in the ROM (0D:8000)
	.dw +		; silence
; SFX
	.db $5E, $9D	; skidding
	.dw sptr.rings	; rings
	.db $9F, $9D	; jump
	.db $C9, $9D	; direct hit
	.db $DD, $9D	; badnik explosion
	.db $EE, $9D	; ???
	.db $00, $9E	; bubble?
	.db $1A, $9E	; dash
	.db $2B, $9E	; explosion
	.db $3E, $9E	; checkpoint? is this unused?
	.db $4F, $9E	; possibly switch?
	.dw +		; silence
	.dw +
	.dw +
	.dw +
	.dw +
	.dw +
	.dw +
	.dw +
	.dw +
	.dw +
	.dw +
	.dw +
	.dw +
	.dw +
	.dw +
	.dw +
	.dw +
	.dw +
	.dw +
	.dw +
; MUSIC
	.dw mptr.titleScreen	; title screen
	.dw mptr.invincible	; invincibility
	.dw mptr.actclear	; stage clear
	.dw mptr.ghz		; GHZ
	.db $02, $8F		; MZ
	.db $56, $92		; SYZ
	.db $DB, $94		; LZ
	.db $A6, $97		; SLZ
	.db $3F, $99		; bonus stage
	.db $D2, $9A		; boss
	.db $07, $9C		; countdown
	.db $8C, $9C		; game over
	.db $ED, $9C		; chaos emerald (unused)
	.db $41, $9D		; +continues (unused)
; Absolute silence
+	musicChannel 0, ++
	musicChannel 1, ++
	musicChannel 2, ++
	musicChannel 3, ++
	musicChannel 4, ++
	sfxChannel 0, ++
	sfxChannel 1, ++
	sfxChannel 2, ++
	sfxChannel 3, ++
	sfxChannel 4, ++
++	.db $FF

	include "include/instrument_data.asm"

; == Music == ;.org $8800
	include "music/20_title.hummer"
	include "music/21_invinc.hummer"
	include "music/22_act_clear.hummer"
	include "music/23_ghz.hummer"
	include "music/24_mzwip.hummer"
	incbin "wip/8a50.bin",1218

; == SFX == ;.org $9D51
	include "sfx/01_skid.hummer"	; WIP
	include "sfx/02_ring.hummer"
	include "sfx/03_jump.hummer"	; WIP
	incbin "wip/9da3.bin"

; ".hummer" files are just standard asm files

; ==============================================================================
;	.org $B100
se.play_track:
	TAX
	LDY #$FF
-
	CPY #$07
	BEQ +	; $B111 +0C (Return)
	INY
	LDA v_sfx_slots,Y
	BPL -	; $B103 -08
	TXA
	STA v_sfx_slots,Y
+
	RTS

	.db $ad, $82, $00 ; LDA $0082 (non-zero page)
	BMI asm.B119	; $B119 +04
	BNE asm.B127	; $B127 +10
asm.B119:
	.db $ad, $81, $00 ; LDA $0081 (non-zero page)
	.db $cd, $83, $00 ; CMP $0083 (non-zero page)
	BEQ asm.B12F	; $B12F +10 (Return)
	.db $ad, $81, $00 ; LDA $0081 (non-zero page)
	.db $8d, $83, $00 ; STA $0083 (non-zero page)
asm.B127:
	JSR se.play_track
	LDA #$00
	.db $8d, $82, $00 ; STA $0082 (non-zero page)
asm.B12F:
	RTS

	LDA #$0F
	STA $4015	; Sound/Vertical Clock Signal Register
	LDA #$00
	STA $4000	; pAPU Pulse #1 Ctrl Register
	STA $4004	; pAPU Pulse #2 Ctrl Register
	STA $4008	; pAPU Triangle Ctrl Register #1
	STA $400C	; pAPU Noise Ctrl Register #1
	STA $4010	; pAPU Delta Modulation Ctrl Register
	LDA #$7F
	STA $4001	; pAPU Pulse #1 Ramp Ctrl Register
	STA $4005	; pAPU Pulse #2 Ramp Ctrl Register
	LDA #$00
	LDY #$F9
asm.B152:
	STA f_sfx_control,Y
	DEY
	BNE asm.B152	; $B152 -04
	LDA #$FF
	LDX #$05
asm.B15C:
	DEX
	STA $075C,X
	STA $07D2,X
	BNE asm.B15C	; $B15C -07
	LDX #$04
asm.B167:
	DEX
	STA $0777,X
	STA $07ED,X
	BNE asm.B167	; $B167 -07
	LDX #$02
asm.B172:
	DEX
	STA $076D,X
	STA $07E3,X
	BNE asm.B172	; $B172 -07
	LDX #$08
asm.B17D:
	DEX
	STA v_sfx_slots,X
	BNE asm.B17D	; $B17D -04
	RTS

; ==============================================================================
Play:	; wip
	LDA v_se_pause
	BEQ asm.B18C	; If $709 is not set
	JMP se.pause_check
asm.B18C:
	LDX #$76
	LDY #$76
	LDA $079F	; disable ch1 flag?
	ORA $07A0
	BNE asm.B19C	; $B19C +06
	LDX #$00
	LDY #$00
asm.B19C:
	TYA
	PHA
	LDA $075C,X
	TAY
	CPY #$FF
	BNE asm.B1AB	; $B1AB +07
	LDA #$00
	JMP asm.B1BC
asm.B1AB:
	PLA
	PHA
	TAY
	LDA $0761,Y
	STA $FE
	LDA $0762,Y
	STA $FF
	LDY #$01
	LDA ($FE),Y

asm.B1BC:
	STA $FE
	PLA
	TAY
	LDA $FE
	PHA
	TYA
	PHA
	LDA $076D,X
	TAY
	CPY #$FF
	BNE asm.B1D2	; $B1D2 +07
	LDA #$00
	JMP asm.B1E3
asm.B1D2:
	PLA
	PHA
	TAY
	LDA $076F,Y
	STA $FE
	LDA $0770,Y
	STA $FF
	LDY #$01
	LDA ($FE),Y

asm.B1E3:
	STA $FE
	PLA
	TAY
	PLA
	ORA $FE
	ORA #$30
	STA $4000	; pAPU Pulse #1 Ctrl Register
	TYA
	PHA
	LDA $0777,X
	TAY
	CPY #$FF
	BNE asm.B1FE	; $B1FE +07
	LDA #$00
	JMP asm.B20F
asm.B1FE:
	PLA
	PHA
	TAY
	LDA $077B,Y
	STA $FE
	LDA $077C,Y
	STA $FF
	LDY #$01
	LDA ($FE),Y

asm.B20F:
	STA $FE
	PLA
	TAY
	LDA #$00
	STA $FF
	LDA $FE
	BPL asm.B21D	; $B21D +04
	DEC $FF
asm.B21D:
	LDA v_current_notes,Y
	CLC
	ADC $FE
	STA $074D,Y
	STA $4002	; pAPU Pulse #1 Fine Tune (FT) Register
	LDA $074E,Y
	STA $FE
	LDA $0744,Y
	ADC $FF
	TAX
	CPX $FE
	BEQ asm.B240	; $B240 +0A
	STA $074E,Y
	ORA #$F8
	STA $4003	; pAPU Pulse #1 Coarse Tune (CT) Register
asm.B240:
	LDX #$77
	LDY #$78
	LDA $07A1	; disable ch2 flag?
	ORA $07A2
	BNE asm.B250	; $B250 +06
	LDX #$01
	LDY #$02
asm.B250:
	TYA
	PHA
	LDA $075C,X
	TAY
	CPY #$FF
	BNE asm.B25F	; $B25F +07
	LDA #$00
	JMP asm.B270
asm.B25F:
	PLA
	PHA
	TAY
	LDA $0761,Y
	STA $FE
	LDA $0762,Y
	STA $FF
	LDY #$01
	LDA ($FE),Y

asm.B270:
	STA $FE
	PLA
	TAY
	LDA $FE
	PHA
	TYA
	PHA
	LDA $076D,X
	TAY
	CPY #$FF
	BNE asm.B286	; $B286 +07
	LDA #$00
	JMP asm.B297
asm.B286:
	PLA
	PHA
	TAY
	LDA $076F,Y
	STA $FE
	LDA $0770,Y
	STA $FF
	LDY #$01
	LDA ($FE),Y

asm.B297:
	STA $FE
	PLA
	TAY
	PLA
	ORA $FE
	ORA #$30
	STA $4004	; pAPU Pulse #2 Ctrl Register
	TYA
	PHA
	LDA $0777,X
	TAY
	CPY #$FF
	BNE asm.B2B2	; $B2B2 +07
	LDA #$00
	JMP asm.B2C3
asm.B2B2:
	PLA
	PHA
	TAY
	LDA $077B,Y
	STA $FE
	LDA $077C,Y
	STA $FF
	LDY #$01
	LDA ($FE),Y

asm.B2C3:
	STA $FE
	PLA
	TAY
	LDA #$00
	STA $FF
	LDA $FE
	BPL asm.B2D1	; $B2D1 +04
	DEC $FF
asm.B2D1:
	LDA v_current_notes,Y
	CLC
	ADC $FE
	STA $074D,Y
	STA $4006	; pAPU Pulse #2 Fine Tune Register
	LDA $074E,Y
	STA $FE
	LDA $0744,Y
	ADC $FF
	TAX
	CPX $FE
	BEQ asm.B2F4	; $B2F4 +0A
	STA $074E,Y
	ORA #$F8
	STA $4007	; pAPU Pulse #2 Coarse Tune Register
asm.B2F4:
	LDX #$78
	LDY #$7A
	LDA $07A3	; disable ch3 flag?
	ORA $07A4
	BNE asm.B304	; $B304 +06
	LDX #$02
	LDY #$04
asm.B304:
	TYA
	PHA
	LDA $075C,X
	TAY
	CPY #$FF
	BNE asm.B313	; $B313 +07
	LDA #$00
	JMP asm.B324
asm.B313:
	PLA
	PHA
	TAY
	LDA $0761,Y
	STA $FE
	LDA $0762,Y
	STA $FF
	LDY #$01
	LDA ($FE),Y

asm.B324:
	STA $FE
	PLA
	TAY
	LDA $FE
	BEQ asm.B32E	; $B32E +04
	LDA #$FF
asm.B32E:
	ORA #$80
	STA $4008	; pAPU Triangle Ctrl Register #1
	TYA
	PHA
	LDA $0777,X
	TAY
	CPY #$FF
	BNE asm.B342	; $B342 +07
	LDA #$00
	JMP asm.B353
asm.B342:
	PLA
	PHA
	TAY
	LDA $077B,Y
	STA $FE
	LDA $077C,Y
	STA $FF
	LDY #$01
	LDA ($FE),Y

asm.B353:
	STA $FE
	PLA
	TAY
	LDA #$00
	STA $FF
	LDA $FE
	BPL asm.B361	; $B361 +04
	DEC $FF
asm.B361:
	LDA v_current_notes,Y
	CLC
	ADC $FE
	STA $074D,Y
	STA $400A	; pAPU Triangle Frequency Register #1
	LDA $074E,Y
	STA $FE
	LDA $0744,Y
	ADC $FF
	TAX
	CPX $FE
	BEQ asm.B384	; $B384 +0A
	STA $074E,Y
	ORA #$F8
	STA $400B	; pAPU Triangle Frequency Register #2
asm.B384:
	LDX #$79
	LDY #$7C
	LDA $07A5	; disable noise flag?
	ORA $07A6
	BNE asm.B394	; $B394 +06
	LDX #$03
	LDY #$06
asm.B394:
	TYA
	PHA
	LDA $075C,X
	TAY
	CPY #$FF
	BNE asm.B3A3	; $B3A3 +07
	LDA #$00
	JMP asm.B3B4
asm.B3A3:
	PLA
	PHA
	TAY
	LDA $0761,Y
	STA $FE
	LDA $0762,Y
	STA $FF
	LDY #$01
	LDA ($FE),Y

asm.B3B4:
	STA $FE
	PLA
	TAY
	LDA $FE
	ORA #$30
	STA $400C	; pAPU Noise Ctrl Register #1
	TYA
	PHA
	LDA $0777,X
	TAY
	CPY #$FF
	BNE asm.B3CE	; $B3CE +07
	LDA #$00
	JMP asm.B3DF
asm.B3CE:
	PLA
	PHA
	TAY
	LDA $077B,Y
	STA $FE
	LDA $077C,Y
	STA $FF
	LDY #$01
	LDA ($FE),Y

asm.B3DF:
	STA $FE
	PLA
	TAY
	LDA v_current_notes,Y
	CLC
	ADC $FE
	STA $400E	; pAPU Noise Frequency Register #1
	LDA #$F8
	STA $400F	; pAPU Noise Frequency Register #2
	LDA f_sfx_control
	BNE asm.B3F9	; $B3F9 +05
	JMP asm.B4B2
asm.B3F9:
	LDY #$00

asm.B3FB:
	LDA v_sfx_slots,Y
	BPL asm.B403	; $B403 +05
	JMP asm.B4AA
asm.B403:
	TAX
	TYA
	PHA
	TXA
	ASL A
	TAX
	LDA $8000,X
	STA $FE
	LDA $8001,X
	STA $FF
	LDY #$00

asm.B415:
	LDA ($FE),Y
	STA $070A
	TAX
	CPX #$FF
	BNE asm.B422	; $B422 +05
	JMP asm.B4A3
asm.B422:
	LDA $070A
	BMI asm.B431	; $B431 +0C
	STA $070B
	ASL A
	STA $070C
	JMP asm.B443
asm.B431:
	AND #$7F
	CLC
	ADC #$76
	STA $070B
	TXA
	AND #$7F
	ASL A
	CLC
	ADC #$76
	STA $070C

asm.B443:
	LDX $070C
	INY
	LDA ($FE),Y
	STA v_seek,X
	INY
	LDA ($FE),Y
	STA $072A,X
	INY
	TYA
	PHA
	LDY #$00
	LDA $070A
	BPL asm.B45E	; $B45E +04
	LDY #$76
asm.B45E:
	LDA $070A
	AND #$0F
	TAY
	LDA #$00
	STA v_extra_ties,X
	STA v_note_timer,X
	LDX $070B
	LDA #$00
	STA $0757,X
	LDA #$FF
	STA $075C,X
	CPY #$04
	BPL asm.B49E	; $B49E +23
	LDA #$00
	STA $0773,X
	LDA #$FF
	STA $0777,X
	CPY #$03
	BPL asm.B49E	; $B49E +15
	LDA #$00
	STA v_transpose,X
	CPY #$02
	BPL asm.B49E	; $B49E +0C
	LDA #$00
	STA $076B,X
	LDA #$FF
	STA $076D,X
asm.B49E:
	PLA
	TAY
	JMP asm.B415

asm.B4A3:
	PLA
	TAY
	LDA #$FF
	STA v_sfx_slots,Y

asm.B4AA:
	INY
	CPY #$08
	BEQ asm.B4B2	; $B4B2 +05
	JMP asm.B3FB

asm.B4B2:
	LDA #$00
	STA $070A
	STA $070B
	STA $070C

asm.B4BD:
	LDX $070C
	LDA v_seek,X
	ORA $072A,X
	BEQ asm.B4FB	; $B4FB +35
	LDA v_extra_ties,X
	BNE asm.B4F8	; $B4F8 +2D
	LDA v_note_timer,X
	BNE asm.B4E1	; $B4E1 +11
	JSR asm.B89D
	LDX $070C
	LDY $070B
	LDA v_note_lengths,Y
	STA v_note_timer,X
asm.B4E1:
	DEC v_note_timer,X
	LDY $070A
	CPY #$05
	BMI asm.B4F0	; $B4F0 +07
	LDY #$76
	JMP asm.B4F2
asm.B4F0:
	LDY #$00

asm.B4F2:
	LDA v_song_speed,Y
	STA v_extra_ties,X
asm.B4F8:
	DEC v_extra_ties,X
asm.B4FB:
	LDA $070A
	AND #$0F
	TAX
	CPX #$04
	BPL asm.B56D	; $B56D +6A

asm.B505:
	LDX $070B
	LDA $075C,X
	TAY
	CPY #$FF
	BEQ asm.B56D	; $B56D +5F
	LDX $070B
	LDA $075C,X
	BNE asm.B56A	; $B56A +54
	LDX $070C
	LDA #$02
	CLC
	ADC $0761,X
	STA $0761,X
	STA $FE
	LDA #$00
	ADC $0762,X
	STA $0762,X
	STA $FF
	LDX $070B
	LDY #$00
	LDA ($FE),Y
	STA $075C,X
	TAY
	CPY #$FF
	BNE asm.B505	; $B505 -38
	LDX $070C
	LDY #$01
	LDA ($FE),Y
	AND #$FE
	BPL asm.B55D	; $B55D +15
	CLC
	ADC $0761,X
	STA $0761,X
	STA $FE
	BCS asm.B558	; $B558 +05
	DEC $0762,X
asm.B558:
	LDA $0762,X
	STA $FF
asm.B55D:
	LDX $070B
	LDY #$00
	LDA ($FE),Y
	STA $075C,X
	JMP asm.B505
asm.B56A:
	DEC $075C,X
asm.B56D:
	LDA $070A
	AND #$0F
	TAX
	CPX #$02
	BPL asm.B5DF	; $B5DF +6A

asm.B577:
	LDX $070B
	LDA $076D,X
	TAY
	CPY #$FF
	BEQ asm.B5DF	; $B5DF +5F
	LDX $070B
	LDA $076D,X
	BNE asm.B5DC	; $B5DC +54
	LDX $070C
	LDA #$02
	CLC
	ADC $076F,X
	STA $076F,X
	STA $FE
	LDA #$00
	ADC $0770,X
	STA $0770,X
	STA $FF
	LDX $070B
	LDY #$00
	LDA ($FE),Y
	STA $076D,X
	TAY
	CPY #$FF
	BNE asm.B577	; $B577 -38
	LDX $070C
	LDY #$01
	LDA ($FE),Y
	AND #$FE
	BPL asm.B5CF	; $B5CF +15
	CLC
	ADC $076F,X
	STA $076F,X
	STA $FE
	BCS asm.B5CA	; $B5CA +05
	DEC $0770,X
asm.B5CA:
	LDA $0770,X
	STA $FF
asm.B5CF:
	LDX $070B
	LDY #$00
	LDA ($FE),Y
	STA $076D,X
	JMP asm.B577
asm.B5DC:
	DEC $076D,X
asm.B5DF:
	LDA $070A
	AND #$0F
	TAX
	CPX #$04
	BPL asm.B64E	; $B64E +67

asm.B5E9:
	LDX $070B
	LDA $0777,X
	TAY
	CPY #$FF
	BEQ asm.B64E	; $B64E +5C
	LDA $0777,X
	BNE asm.B64B	; $B64B +54
	LDX $070C
	LDA #$02
	CLC
	ADC $077B,X
	STA $077B,X
	STA $FE
	LDA #$00
	ADC $077C,X
	STA $077C,X
	STA $FF
	LDX $070B
	LDY #$00
	LDA ($FE),Y
	STA $0777,X
	TAY
	CPY #$FF
	BNE asm.B5E9	; $B5E9 -35
	LDX $070C
	LDY #$01
	LDA ($FE),Y
	AND #$FE
	BPL asm.B63E	; $B63E +15
	CLC
	ADC $077B,X
	STA $077B,X
	STA $FE
	BCS asm.B639	; $B639 +05
	DEC $077C,X
asm.B639:
	LDA $077C,X
	STA $FF
asm.B63E:
	LDX $070B
	LDY #$00
	LDA ($FE),Y
	STA $0777,X
	JMP asm.B5E9
asm.B64B:
	DEC $0777,X
asm.B64E:
	INC $070A
	INC $070B
	INC $070C
	INC $070C
	LDX $070A
	CPX #$05
	BEQ asm.B664	; $B664 +05
	JMP asm.B4BD
asm.B664:
	LDA #$10
	STA $070A
	LDA #$76
	STA $070B
	STA $070C

asm.B671:
	LDX $070C
	LDA v_seek,X
	ORA $072A,X
	BEQ asm.B6AF	; $B6AF +35
	LDA v_extra_ties,X
	BNE asm.B6AC	; $B6AC +2D
	LDA v_note_timer,X
	BNE asm.B695	; $B695 +11
	JSR asm.B89D
	LDX $070C
	LDY $070B
	LDA v_note_lengths,Y
	STA v_note_timer,X
asm.B695:
	DEC v_note_timer,X
	LDY $070A
	CPY #$05
	BMI asm.B6A4	; $B6A4 +07
	LDY #$76
	JMP asm.B6A6
asm.B6A4:
	LDY #$00

asm.B6A6:
	LDA v_song_speed,Y
	STA v_extra_ties,X
asm.B6AC:
	DEC v_extra_ties,X
asm.B6AF:
	LDA $070A
	AND #$0F
	TAX
	CPX #$04
	BPL asm.B721	; $B721 +6A

asm.B6B9:
	LDX $070B
	LDA $075C,X
	TAY
	CPY #$FF
	BEQ asm.B721	; $B721 +5F
	LDX $070B
	LDA $075C,X
	BNE asm.B71E	; $B71E +54
	LDX $070C
	LDA #$02
	CLC
	ADC $0761,X
	STA $0761,X
	STA $FE
	LDA #$00
	ADC $0762,X
	STA $0762,X
	STA $FF
	LDX $070B
	LDY #$00
	LDA ($FE),Y
	STA $075C,X
	TAY
	CPY #$FF
	BNE asm.B6B9	; $B6B9 -38
	LDX $070C
	LDY #$01
	LDA ($FE),Y
	AND #$FE
	BPL asm.B711	; $B711 +15
	CLC
	ADC $0761,X
	STA $0761,X
	STA $FE
	BCS asm.B70C	; $B70C +05
	DEC $0762,X
asm.B70C:
	LDA $0762,X
	STA $FF
asm.B711:
	LDX $070B
	LDY #$00
	LDA ($FE),Y
	STA $075C,X
	JMP asm.B6B9
asm.B71E:
	DEC $075C,X
asm.B721:
	LDA $070A
	AND #$0F
	TAX
	CPX #$02
	BPL asm.B793	; $B793 +6A

asm.B72B:
	LDX $070B
	LDA $076D,X
	TAY
	CPY #$FF
	BEQ asm.B793	; $B793 +5F
	LDX $070B
	LDA $076D,X
	BNE asm.B790	; $B790 +54
	LDX $070C
	LDA #$02
	CLC
	ADC $076F,X
	STA $076F,X
	STA $FE
	LDA #$00
	ADC $0770,X
	STA $0770,X
	STA $FF
	LDX $070B
	LDY #$00
	LDA ($FE),Y
	STA $076D,X
	TAY
	CPY #$FF
	BNE asm.B72B	; $B72B -38
	LDX $070C
	LDY #$01
	LDA ($FE),Y
	AND #$FE
	BPL asm.B783	; $B783 +15
	CLC
	ADC $076F,X
	STA $076F,X
	STA $FE
	BCS asm.B77E	; $B77E +05
	DEC $0770,X
asm.B77E:
	LDA $0770,X
	STA $FF
asm.B783:
	LDX $070B
	LDY #$00
	LDA ($FE),Y
	STA $076D,X
	JMP asm.B72B
asm.B790:
	DEC $076D,X
asm.B793:
	LDA $070A
	AND #$0F
	TAX
	CPX #$04
	BPL asm.B802	; $B802 +67

asm.B79D:
	LDX $070B
	LDA $0777,X
	TAY
	CPY #$FF
	BEQ asm.B802	; $B802 +5C
	LDA $0777,X
	BNE asm.B7FF	; $B7FF +54
	LDX $070C
	LDA #$02
	CLC
	ADC $077B,X
	STA $077B,X
	STA $FE
	LDA #$00
	ADC $077C,X
	STA $077C,X
	STA $FF
	LDX $070B
	LDY #$00
	LDA ($FE),Y
	STA $0777,X
	TAY
	CPY #$FF
	BNE asm.B79D	; $B79D -35
	LDX $070C
	LDY #$01
	LDA ($FE),Y
	AND #$FE
	BPL asm.B7F2	; $B7F2 +15
	CLC
	ADC $077B,X
	STA $077B,X
	STA $FE
	BCS asm.B7ED	; $B7ED +05
	DEC $077C,X
asm.B7ED:
	LDA $077C,X
	STA $FF
asm.B7F2:
	LDX $070B
	LDY #$00
	LDA ($FE),Y
	STA $0777,X
	JMP asm.B79D
asm.B7FF:
	DEC $0777,X
asm.B802:
	INC $070A
	INC $070B
	INC $070C
	INC $070C
	LDX $070A
	CPX #$15
	BEQ asm.B818	; $B818 +05 (Return)
	JMP asm.B671
asm.B818:
	RTS

se.pause_check:
	TAY
	CPY #$F0
	BEQ se.pause_track	; $B823 +07
	CPY #$F1
	BEQ se.continue_track	; $B895 +75
	RTS
se.pause_track:
	LDX #$00
	LDY #$00
	TYA
	PHA
	LDA $076D,X
	TAY
	CPY #$FF
	BNE asm.B836	; $B836 +07
	LDA #$00
	JMP asm.B847
asm.B836:
	PLA
	PHA
	TAY
	LDA $076F,Y
	STA $FE
	LDA $0770,Y
	STA $FF
	LDY #$01
	LDA ($FE),Y

asm.B847:
	STA $FE
	PLA
	TAY
	LDA $FE
	AND #$F0
	ORA #$30
	STA $4000	; pAPU Pulse #1 Ctrl Register
	LDX #$01
	LDY #$02
	TYA
	PHA
	LDA $076D,X
	TAY
	CPY #$FF
	BNE asm.B867	; $B867 +07
	LDA #$00
	JMP asm.B878
asm.B867:
	PLA
	PHA
	TAY
	LDA $076F,Y
	STA $FE
	LDA $0770,Y
	STA $FF
	LDY #$01
	LDA ($FE),Y

asm.B878:
	STA $FE
	PLA
	TAY
	LDA $FE
	AND #$F0
	ORA #$30
	STA $4004	; pAPU Pulse #2 Ctrl Register
	LDA #$00
	STA $4008	; pAPU Triangle Ctrl Register #1
	LDA #$30
	STA $400C	; pAPU Noise Ctrl Register #1
	LDA #$FF
	STA $0709
	RTS
se.continue_track:
	LDA #$00
	STA $0709
	JMP asm.B18C

asm.B89D:
	LDX $070C
	LDA v_seek,X
	STA $FE
	LDA $072A,X
	STA $FF
	LDY #$00
	LDA ($FE),Y
	BPL asm.B8E2	; $B8E2 +34
	TAX
	CPX #$F0
	BMI asm.B8B8	; $B8B8 +05
	JMP asm.B9E0
asm.B8B8:
	AND #$7F
	BEQ asm.B8C2	; $B8C2 +08
	LDX $070B
	STA v_note_lengths,X
asm.B8C2:
	LDX $070C
	INC v_seek,X
	LDA v_seek,X
	BNE asm.B8D0	; $B8D0 +05
	INC $072A,X
asm.B8D0:
	JMP asm.B89D
asm.B8D3:
	LDX $070C
	INC v_seek,X
	LDA v_seek,X
	BNE asm.B8E1	; $B8E1 +05 (Return)
	INC $072A,X
asm.B8E1:
	RTS
asm.B8E2:
	BNE asm.B8F6	; $B8F6 +14
	LDX $070C
	INC v_seek,X
	LDA v_seek,X
	BNE asm.B8F2	; $B8F2 +05
	INC $072A,X
asm.B8F2:
	JMP asm.BC2C

	RTS
asm.B8F6:
	PHA
	LDA $070A
	AND #$0F
	TAX
	PLA
	CPX #$03
	BEQ asm.B921	; $B921 +21
	CPX #$04
	BNE asm.B906	; $B906 +02
asm.B906:
	LDX $070B
	CLC
	ADC v_transpose,X
	ASL A
	TAY
	LDX $070C
	LDA $8100,Y
	STA v_current_notes,X
	LDA $8101,Y
	STA $0744,X
	JMP asm.B933
asm.B921:
	TAX
	AND #$10
	BEQ asm.B92C	; $B92C +08
	TXA
	AND #$0F
	ORA #$80
	TAX
asm.B92C:
	TXA
	LDX $070C
	STA v_current_notes,X

asm.B933:
	LDX $070C
	LDA $074E,X
	ORA #$80
	STA $074E,X
	LDA $070A
	AND #$0F
	TAX
	CPX #$04
	BMI asm.B94A	; $B94A +04
	BPL asm.B96F	; $B96F +27
asm.B94A:
	LDX $070B
	LDY $070C
	LDA $0757,X
	ASL A
	TAX
	LDA $8200,X
	STA $0761,Y
	STA $FE
	LDA $8201,X
	STA $0762,Y
	STA $FF
	LDX $070B
	LDY #$00
	LDA ($FE),Y
	STA $075C,X
asm.B96F:
	LDA $070A
	AND #$0F
	TAX
	CPX #$02
	BMI asm.B97B	; $B97B +04
	BPL asm.B9A0	; $B9A0 +27
asm.B97B:
	LDX $070B
	LDY $070C
	LDA $076B,X
	ASL A
	TAX
	LDA $8200,X
	STA $076F,Y
	STA $FE
	LDA $8201,X
	STA $0770,Y
	STA $FF
	LDX $070B
	LDY #$00
	LDA ($FE),Y
	STA $076D,X
asm.B9A0:
	LDA $070A
	AND #$0F
	TAX
	CPX #$04
	BMI asm.B9AC	; $B9AC +04
	BPL asm.B9D1	; $B9D1 +27
asm.B9AC:
	LDX $070B
	LDY $070C
	LDA $0773,X
	ASL A
	TAX
	LDA $8200,X
	STA $077B,Y
	STA $FE
	LDA $8201,X
	STA $077C,Y
	STA $FF
	LDX $070B
	LDY #$00
	LDA ($FE),Y
	STA $0777,X
asm.B9D1:
	LDX $070C
	INC v_seek,X
	LDA v_seek,X
	BNE asm.B9DF	; $B9DF +05 (Return)
	INC $072A,X
asm.B9DF:
	RTS

asm.B9E0:
	AND #$0F
	ASL A
	TAY
	LDX $070C
	INC v_seek,X
	LDA v_seek,X
	BNE asm.B9F2	; $B9F2 +05
	INC $072A,X
asm.B9F2:
	TYA
	TAX
	LDA data.BA01,X
	STA $FE
	LDA data.BA01+1,X
	STA $FF
	JMP ($00FE)
data.BA01:		; I think it's a call table of some sorts
	.dw asm.BA21
	.dw asm.BA4F
	.dw asm.BA69
	.dw asm.BAA0
	.dw asm.BAC8
	.dw asm.BAE5
	.dw asm.BB13
	.dw asm.B89D
	.dw asm.BB45
	.dw asm.BB88
	.dw asm.BBCB
	.dw asm.BC49
	.dw asm.B8D3
	.dw asm.B8B8
	.dw asm.B89D
	.dw asm.BC0E
asm.BA21:
	LDX $070C
	CLC
	LDA v_seek,X
	ADC #$02
	STA $071F,X
	LDA $072A,X
	ADC #$00
	STA $0720,X
	LDA v_seek,X
	STA $FE
	LDA $072A,X
	STA $FF
	LDY #$00
	LDA ($FE),Y
	STA v_seek,X
	INY
	LDA ($FE),Y
	STA $072A,X
	JMP asm.B89D
asm.BA4F:
	LDX $070C
	LDA $071F,X
	STA v_seek,X
	LDA $0720,X
	STA $072A,X
	LDA #$00
	STA $071F,X
	STA $0720,X
	JMP asm.B89D
asm.BA69:
	LDX $070C
	LDA v_seek,X
	STA $FE
	LDA $072A,X
	STA $FF
	LDX $070B
	LDY #$00
	LDA ($FE),Y
	STA $0710,X
	LDX $070C
	INC v_seek,X
	LDA v_seek,X
	BNE asm.BA8E	; $BA8E +05
	INC $072A,X
asm.BA8E:
	LDX $070C
	LDA v_seek,X
	STA $0715,X
	LDA $072A,X
	STA $0716,X
	JMP asm.B89D
asm.BAA0:
	LDX $070B
	DEC $0710,X
	BEQ asm.BABA	; $BABA +14
	LDX $070C
	LDA $0715,X
	STA v_seek,X
	LDA $0716,X
	STA $072A,X
	JMP asm.B89D
asm.BABA:
	LDX $070C
	LDA #$00
	STA $0715,X
	STA $0716,X
	JMP asm.B89D
asm.BAC8:
	LDX $070C
	LDA v_seek,X
	STA $FE
	LDA $072A,X
	STA $FF
	LDY #$00
	LDA ($FE),Y
	STA v_seek,X
	INY
	LDA ($FE),Y
	STA $072A,X
	JMP asm.B89D
asm.BAE5:
	LDX $070C
	LDA v_seek,X
	STA $FE
	LDA $072A,X
	STA $FF
	LDY #$00
	LDA ($FE),Y
	LDX $070A
	CPX #$05
	BMI asm.BAFF	; $BAFF +04
	LDY #$76
asm.BAFF:
	STA v_song_speed,Y
	LDX $070C
	INC v_seek,X
	LDA v_seek,X
	BNE asm.BB10	; $BB10 +05
	INC $072A,X
asm.BB10:
	JMP asm.B89D
asm.BB13:
	LDA $070A
	AND #$0F
	TAX
	CPX #$03
	BPL asm.BB34	; $BB34 +19
	LDX $070C
	LDA v_seek,X
	STA $FE
	LDA $072A,X
	STA $FF
	LDY #$00
	LDA ($FE),Y
	LDX $070B
	STA v_transpose,X
asm.BB34:
	LDX $070C
	INC v_seek,X
	LDA v_seek,X
	BNE asm.BB42	; $BB42 +05
	INC $072A,X
asm.BB42:
	JMP asm.B89D
asm.BB45:
	LDA $070A
	AND #$0F
	TAX
	CPX #$04
	BMI asm.BB60	; $BB60 +13
	LDX $070C
	INC v_seek,X
	LDA v_seek,X
	BNE asm.BB5D	; $BB5D +05
	INC $072A,X
asm.BB5D:
	JMP asm.B89D
asm.BB60:
	LDX $70C
	LDA v_seek,X
	STA $FE
	LDA $072A,X
	STA $FF
	LDX $070C
	INC v_seek,X
	LDA v_seek,X
	BNE asm.BB7B	; $BB7B +05
	INC $072A,X
asm.BB7B:
	LDY #$00
	LDA ($FE),Y
	LDX $070B
	STA $0757,X
	JMP asm.B89D
asm.BB88:
	LDA $070A
	AND #$0F
	TAX
	CPX #$02
	BMI asm.BBA3	; $BBA3 +13
	LDX $070C
	INC v_seek,X
	LDA v_seek,X
	BNE asm.BBA0	; $BBA0 +05
	INC $072A,X
asm.BBA0:
	JMP asm.B89D
asm.BBA3:
	LDX $070C
	LDA v_seek,X
	STA $FE
	LDA $072A,X
	STA $FF
	LDX $070C
	INC v_seek,X
	LDA v_seek,X
	BNE asm.BBBE	; $BBBE +05
	INC $072A,X
asm.BBBE:
	LDY #$00
	LDA ($FE),Y
	LDX $070B
	STA $076B,X
	JMP asm.B89D
asm.BBCB:
	LDA $070A
	AND #$0F
	TAX
	CPX #$04
	BMI asm.BBE6	; $BBE6 +13
	LDX $070C
	INC v_seek,X
	LDA v_seek,X
	BNE asm.BBE3	; $BBE3 +05
	INC $072A,X
asm.BBE3:
	JMP asm.B89D
asm.BBE6:
	LDX $070C
	LDA v_seek,X
	STA $FE
	LDA $072A,X
	STA $FF
	LDX $070C
	INC v_seek,X
	LDA v_seek,X
	BNE asm.BC01	; $BC01 +05
	INC $072A,X
asm.BC01:
	LDY #$00
	LDA ($FE),Y
	LDX $070B
	STA $0773,X
	JMP asm.B89D
asm.BC0E:
	LDX $070C
	LDA #$00
	STA v_seek,X
	STA $072A,X
	LDA $070A
	AND #$0F
	ASL A
	TAX
	CLC
	ADC #$76
	TAY
	LDA #$FF
	STA $074E,X
	STA $074E,Y

asm.BC2C:
	LDY $070B
	LDA $070A
	AND #$0F
	TAX
	LDA #$FF
	CPX #$04
	BPL asm.BC48	; $BC48 +0F (Return)
	STA $075C,Y
	STA $0777,Y
	CPX #$02
	BPL asm.BC48	; $BC48 +05 (Return)
	STA $076D,Y
asm.BC48:
	RTS
asm.BC49:
	LDX $070C
	LDA v_seek,X
	STA $FE
	LDA $072A,X
	STA $FF
	LDX $070C
	INC v_seek,X
	LDA v_seek,X
	BNE asm.BC64	; $BC64 +05
	INC $072A,X
asm.BC64:
	LDX $070B
	LDA $0710,X
	BNE asm.BC73	; $BC73 +09
	LDY #$00
	LDA ($FE),Y
	STA $0710,X
asm.BC73:
	DEC $0710,X
	BNE asm.BC8F	; $BC8F +19
	LDX $070C
	LDA v_seek,X
	CLC
	ADC #$02
	STA v_seek,X
	LDA $072A,X
	ADC #$00
	STA $072A,X
	JMP asm.B89D
asm.BC8F:
	LDX $070C
	LDA v_seek,X
	STA $FE
	LDA $072A,X
	STA $FF
	LDY #$00
	LDA ($FE),Y
	STA v_seek,X
	INY
	LDA ($FE),Y
	STA $072A,X
	JMP asm.B89D

Filler:	; this data seems unused
	.db $A0, $A0, $A0, $A0, $C0, $C0, $C0, $C0, $C0, $C0, $C0, $C0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $00, $00, $00, $00, $00, $00, $00, $00, $20, $20, $20, $20, $20, $20, $20, $20, $40, $40, $40, $40, $40, $40, $40, $40, $60, $60, $60, $60, $60, $60, $60, $60, $80, $80, $80, $80, $80, $80, $80, $80, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $C0, $C0, $C0, $C0, $C0, $C0, $C0, $C0, $E0, $E0, $E0, $E0, $E0, $E0, $E0, $E0


; ==============================================================================
Init_Data: ; $bd00
	.db $01,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$00,$15,$7B,$80,$0B,$0B,$0B
	.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.db $00,$00,$00,$01,$30,$30,$20,$10,$00,$00,$2F,$00,$2F,$00,$1F,$00
	.db $0F,$00,$FF,$71,$00,$39,$00,$C5,$01,$24,$00,$00,$00,$71,$00,$39
	.db $00,$C5,$01,$00,$FF,$00,$FF,$02,$14,$02,$53,$00,$FF,$FF,$FF,$FF
	.db $FF,$12,$83,$DC,$83,$12,$83,$6E,$86,$00,$00,$04,$17,$FF,$FF,$20
	.db $83,$F8,$83,$05,$16,$05,$00,$FF,$FF,$FF,$FF,$30,$83,$F0,$83,$30
	.db $83,$02,$83,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.db $00,$00,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$00
	.db $00,$00,$FF,$FF,$FF,$FF,$FF,$00,$00,$00,$00,$00,$00,$00,$00,$00
	.db $00,$00,$00,$FF,$FF,$00,$00,$00,$00,$00,$00,$00,$00,$FF,$FF,$FF
	.db $FF,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
Init: ; $be00
	PHA
	LDX #$13
	LDA #$00
-
	STA $4000,X	; pAPU Pulse #1 Ctrl Register
	DEX
	BPL -	; $BE05 -04
	INX
-
	LDA Init_Data,X
	STA $0700,X
	DEX
	BNE -	; $BE0C -07
	lda #$0c
	jsr se.play_track
	pla
	tax
	lda @index,x
	jsr se.play_track
	LDA #$0F
	STA $4015	; Sound/Vertical Clock Signal Register
	LDA #$7F
	STA $4001	; pAPU Pulse #1 Ramp Ctrl Register
	STA $4005	; pAPU Pulse #2 Ramp Ctrl Register
	RTS
 @index:
	; Music
	db $20,$21,$22,$23,$24,$25,$26,$27,$28,$29,$2A,$2B,$2C,$2D
	; SFX
	db $01,$02,$03,$04,$05,$06,$07,$08,$09,$0A,$0B
