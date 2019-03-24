;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Sun Apr 11 14:38:10 2010
;--------------------------------------------------------
	.module _fsgt
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___fsgt
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
;  ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; overlayable items in  ram 
;--------------------------------------------------------
	.area _OVERLAY
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;../_fsgt.c:98: char __fsgt (float a1, float a2)
;	---------------------------------
; Function __fsgt
; ---------------------------------
___fsgt:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-12
	add	hl,sp
	ld	sp,hl
;../_fsgt.c:102: fl1.f = a1;
	ld	hl,#0x0008
	add	hl,sp
	ld	a,4 (ix)
	ld	(hl),a
	inc	hl
	ld	a,5 (ix)
	ld	(hl),a
	inc	hl
	ld	a,6 (ix)
	ld	(hl),a
	inc	hl
	ld	a,7 (ix)
	ld	(hl),a
;../_fsgt.c:103: fl2.f = a2;
	ld	hl,#0x0004
	add	hl,sp
	ld	a,8 (ix)
	ld	(hl),a
	inc	hl
	ld	a,9 (ix)
	ld	(hl),a
	inc	hl
	ld	a,10 (ix)
	ld	(hl),a
	inc	hl
	ld	a,11 (ix)
	ld	(hl),a
;../_fsgt.c:105: if (fl1.l<0 && fl2.l<0) {
	ld	hl,#0x0008
	add	hl,sp
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,d
	bit	7,a
	jp	Z,00104$
	ld	hl,#0x0004
	add	hl,sp
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,d
	bit	7,a
	jr	Z,00104$
;../_fsgt.c:106: if (fl2.l > fl1.l)
	ld	hl,#0x0004
	add	hl,sp
	ld	a,(hl)
	ld	-12 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-11 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-10 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-9 (ix),a
	ld	hl,#0x0008
	add	hl,sp
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,c
	sub	a,-12 (ix)
	ld	a,b
	sbc	a,-11 (ix)
	ld	a,e
	sbc	a,-10 (ix)
	ld	a,d
	sbc	a,-9 (ix)
	jp	P,00102$
;../_fsgt.c:107: return (1);
	ld	l,#0x01
	jr	00108$
00102$:
;../_fsgt.c:108: return (0);
	ld	l,#0x00
	jr	00108$
00104$:
;../_fsgt.c:111: if (fl1.l > fl2.l)
	ld	hl,#0x0008
	add	hl,sp
	ld	a,(hl)
	ld	-12 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-11 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-10 (ix),a
	inc	hl
	ld	a,(hl)
	ld	-9 (ix),a
	ld	hl,#0x0004
	add	hl,sp
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,c
	sub	a,-12 (ix)
	ld	a,b
	sbc	a,-11 (ix)
	ld	a,e
	sbc	a,-10 (ix)
	ld	a,d
	sbc	a,-9 (ix)
	jp	P,00107$
;../_fsgt.c:112: return (1);
	ld	l,#0x01
	jr	00108$
00107$:
;../_fsgt.c:113: return (0);
	ld	l,#0x00
00108$:
	ld	sp,ix
	pop	ix
ret
	.area _CODE
	.area _CABS
