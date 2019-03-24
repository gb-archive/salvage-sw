;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Sun Apr 11 14:38:08 2010
;--------------------------------------------------------
	.module _fs2uchar
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___fs2uchar
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
;../_fs2uchar.c:41: unsigned char __fs2uchar (float f)
;	---------------------------------
; Function __fs2uchar
; ---------------------------------
___fs2uchar:
	push	ix
	ld	ix,#0
	add	ix,sp
;../_fs2uchar.c:43: unsigned long ul=__fs2ulong(f);
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
;../_fs2uchar.c:44: if (ul>=UCHAR_MAX) return UCHAR_MAX;
	ld	a,c
	sub	a,#0xFF
	ld	a,b
	sbc	a,#0x00
	ld	a,e
	sbc	a,#0x00
	ld	a,d
	sbc	a,#0x00
	jr	C,00102$
	ld	l,#0xFF
	jr	00103$
00102$:
;../_fs2uchar.c:45: return ul;
	ld	l,c
00103$:
	pop	ix
ret
	.area _CODE
	.area _CABS
