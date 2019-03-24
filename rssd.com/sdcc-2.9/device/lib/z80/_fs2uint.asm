;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Sun Apr 11 14:38:08 2010
;--------------------------------------------------------
	.module _fs2uint
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___fs2uint
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
;../_fs2uint.c:44: unsigned int __fs2uint (float f)
;	---------------------------------
; Function __fs2uint
; ---------------------------------
___fs2uint:
	push	ix
	ld	ix,#0
	add	ix,sp
;../_fs2uint.c:46: unsigned long ul=__fs2ulong(f);
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
;../_fs2uint.c:47: if (ul>=UINT_MAX) return UINT_MAX;
	ld	a,c
	sub	a,#0xFF
	ld	a,b
	sbc	a,#0xFF
	ld	a,e
	sbc	a,#0x00
	ld	a,d
	sbc	a,#0x00
	jr	C,00102$
	ld	hl,#0xFFFF
	jr	00103$
00102$:
;../_fs2uint.c:48: return ul;
	ld	l,c
	ld	h,b
00103$:
	pop	ix
ret
	.area _CODE
	.area _CABS
