	.include        "global.s"
	.area	_BSS
	;; Foreground drawing colour
.fg_colour::	
	.ds	1
	;; Background drawing colour
.bg_colour::	
	.ds	1
	
	.area   _BASE
.vbl::
	LDH	A,(.LCDC)
	OR	#0b00010000	; Set BG Chr to 0x8000
	LDH	(.LCDC),A

	LD	A,#72		; Set line at which LCD interrupt occurs
	LDH	(.LYC),A

	RET

	;; Is the STAT check required, as we are already in the HBL?
.lcd::
1$:
	LDH	A,(.STAT)
	BIT	1,A
	JR	NZ,1$

	LDH	A,(.LCDC)
	AND	#0b11101111	; Set BG Chr to 0x8800
	LDH	(.LCDC),A

	RET

