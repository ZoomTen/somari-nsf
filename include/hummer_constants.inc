;======= RAM Constants ==========

; current playback addresses
; channels are zero indexed
; ch0 = square 1
; ch1 = square 2
; ch2 = tri
; ch3 = noise
; ch4 = unused

	f_sfx_control	equ	$700
	v_sfx_slots	equ	$701
			; writing a value to this address
			; plays a sfx as long as f_sfx_control != 0
			; a total of 8 sounds can play at once (701-708)
			;
			; It can also be used to change music
			; on the fly
	v_se_pause	equ 	$709
	SE_PAUSE	equ $F0
	SE_CONTINUE	equ $F1
			; writing $F0 will pause the track
			; writing $F1 will continue it
			; other values will FREEZE the engine

	v_transpose	equ	$70d
	v_ch0_transpose	equ	v_transpose
	v_ch1_transpose	equ	v_transpose+1
	v_ch2_transpose	equ	v_transpose+2

	v_seek		equ	$729
			; this is also referenced
			; for other stuff
	v_ch0_seek	equ	v_seek
	v_ch1_seek	equ	v_seek+2
	v_ch2_seek	equ	v_seek+4
	v_ch3_seek	equ	v_seek+6
	v_ch4_seek	equ	v_seek+8

	v_song_speed	equ	$733
			; lower = faster

	v_note_lengths	equ	$734
			; lower = shorter
	v_ch0_nl	equ	v_note_lengths
	v_ch1_nl	equ	v_note_lengths+1
	v_ch2_nl	equ	v_note_lengths+2
	v_ch3_nl	equ	v_note_lengths+3
	v_ch4_nl	equ	v_note_lengths+4

	v_extra_ties	equ	$739
	v_ch0_et	equ	v_extra_ties
	v_ch1_et	equ	v_extra_ties+2
	v_ch2_et	equ	v_extra_ties+4
	v_ch3_et	equ	v_extra_ties+6
	v_ch4_et	equ	v_extra_ties+8

	v_note_timer	equ	$73a
	v_ch0_nt	equ	v_note_timer
	v_ch1_nt	equ	v_note_timer+2
	v_ch2_nt	equ	v_note_timer+4
	v_ch3_nt	equ	v_note_timer+6
	v_ch4_nt	equ	v_note_timer+8

	v_current_notes	equ	$743
	v_ch0_cn	equ	v_current_notes
	v_ch1_cn	equ	v_current_notes+2
	v_ch2_cn	equ	v_current_notes+4
	v_ch3_cn	equ	v_current_notes+6
	v_ch4_cn	equ	v_current_notes+8

	v_note_type	equ	$744	; possible note type?
	v_ch0_type	equ	v_note_type
	v_ch1_type	equ	v_note_type+2
	v_ch2_type	equ	v_note_type+4
	v_ch3_type	equ	v_note_type+6
	v_ch4_type	equ	v_note_type+8

	v_sfx_seek	equ	$79f
	v_sfx_ch0_seek	equ	v_sfx_seek
	v_sfx_ch1_seek	equ	v_sfx_seek+2
	v_sfx_ch2_seek	equ	v_sfx_seek+4
	v_sfx_ch3_seek	equ	v_sfx_seek+6


;======= Music Constants ==========
; modeled after s1smps2asm
; Length
	lx	equ	$80	; base
; Notes
	nRst	equ	0
; note values, assuming alterNote = $00
;                       or transposed +0 semitones
	nA0	equ	$09
	nBb0	equ	$0A
	nB0	equ	$0B
	nC1	equ	$0C
	nCs1	equ	$0D
	nD1	equ	$0E
	nEb1	equ	$0F
	nE1	equ	$10
	nF1	equ	$11
	nFs1	equ	$12
	nG1	equ	$13
	nAb1	equ	$14
	nA1	equ	$15
	nBb1	equ	$16
	nB1	equ	$17
	nC2	equ	$18
	nCs2	equ	$19
	nD2	equ	$1A
	nEb2	equ	$1B
	nE2	equ	$1C
	nF2	equ	$1D
	nFs2	equ	$1E
	nG2	equ	$1F
	nAb2	equ	$20
	nA2	equ	$21
	nBb2	equ	$22
	nB2	equ	$23
	nC3	equ	$24
	nCs3	equ	$25
	nD3	equ	$26
	nEb3	equ	$27
	nE3	equ	$28
	nF3	equ	$29
	nFs3	equ	$2A
	nG3	equ	$2B
	nAb3	equ	$2C
	nA3	equ	$2D
	nBb3	equ	$2E
	nB3	equ	$2F
	nC4	equ	$30
	nCs4	equ	$31
	nD4	equ	$32
	nEb4	equ	$33
	nE4	equ	$34
	nF4	equ	$35
	nFs4	equ	$36
	nG4	equ	$37
	nAb4	equ	$38
	nA4	equ	$39
	nBb4	equ	$3A
	nB4	equ	$3B
	nC5	equ	$3C
	nCs5	equ	$3D
	nD5	equ	$3E
	nEb5	equ	$3F
	nE5	equ	$40
	nF5	equ	$41
	nFs5	equ	$42
	nG5	equ	$43
	nAb5	equ	$44
	nA5	equ	$45
	nBb5	equ	$46
	nB5	equ	$47
