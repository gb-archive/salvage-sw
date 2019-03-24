;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Sun Apr 11 14:38:07 2010
;--------------------------------------------------------
	.module _fs2schar
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___fs2schar
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
;../_fs2schar.c:77: signed char __fs2schar (float f)
;	---------------------------------
; Function __fs2schar
; ---------------------------------
___fs2schar:
	push	ix
	ld	ix,#0
	add	ix,sp
;../_fs2schar.c:79: signed long sl=__fs2slong(f);
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	___fs2slong
	pop	af
	pop	af
	ld	b,h
	ld	c,l
;../_fs2schar.c:80: if (sl>=CHAR_MAX)
	ld	a,c
	sub	a,#0x7F
	ld	a,b
	sbc	a,#0x00
	ld	a,e
	sbc	a,#0x00
	ld	a,d
	sbc	a,#0x00
	jp	M,00102$
;../_fs2schar.c:81: return CHAR_MAX;
	ld	l,#0x7F
	jr	00105$
00102$:
;../_fs2schar.c:82: if (sl<=CHAR_MIN)
	ld	a,#0x80
	sub	a,c
	ld	a,#0xFF
	sbc	a,b
	ld	a,#0xFF
	sbc	a,e
	ld	a,#0xFF
	sbc	a,d
	jp	M,00104$
;../_fs2schar.c:83: return -CHAR_MIN;
	ld	l,#0x80
	jr	00105$
00104$:
;../_fs2schar.c:84: return sl;
	ld	l,c
00105$:
	pop	ix
ret
	.area _CODE
	.area _CABS
