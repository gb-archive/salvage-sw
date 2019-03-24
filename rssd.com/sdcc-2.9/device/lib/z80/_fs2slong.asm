;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Sun Apr 11 14:38:08 2010
;--------------------------------------------------------
	.module _fs2slong
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___fs2slong
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
;../_fs2slong.c:98: signed long __fs2slong (float f)
;	---------------------------------
; Function __fs2slong
; ---------------------------------
___fs2slong:
	push	ix
	ld	ix,#0
	add	ix,sp
;../_fs2slong.c:101: if (!f)
	ld	a,4 (ix)
	or	a,5 (ix)
	or	a,6 (ix)
	or	a,7 (ix)
	jr	NZ,00102$
;../_fs2slong.c:102: return 0;
	ld	hl,#0x0000
	ld	e,l
	ld	d,h
	jp	00106$
00102$:
;../_fs2slong.c:104: if (f<0) {
	ld	hl,#0x0000
	push	hl
	ld	hl,#0x0000
	push	hl
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	___fslt
	pop	af
	pop	af
	pop	af
	pop	af
	xor	a,a
	or	a,l
	jr	Z,00104$
;../_fs2slong.c:105: return -__fs2ulong(-f);
	ld	a,7 (ix)
	xor	a,#0x80
	ld	d,a
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	e,6 (ix)
	push	de
	push	bc
	call	___fs2ulong
	pop	af
	pop	af
	ld	b,h
	ld	c,l
	xor	a,a
	sbc	a,c
	ld	c,a
	ld	a,#0x00
	sbc	a,b
	ld	b,a
	ld	a,#0x00
	sbc	a,e
	ld	e,a
	ld	a,#0x00
	sbc	a,d
	ld	d,a
	ld	l,c
	ld	h,b
	jr	00106$
00104$:
;../_fs2slong.c:107: return __fs2ulong(f);
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	___fs2ulong
	pop	af
	pop	af
	ld	b,h
	ld	c,l
	ld	l,c
	ld	h,b
00106$:
	pop	ix
ret
	.area _CODE
	.area _CABS
