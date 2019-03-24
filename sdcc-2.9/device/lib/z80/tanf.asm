;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Sun Apr 11 14:38:14 2010
;--------------------------------------------------------
	.module tanf
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _tanf
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
;../tanf.c:25: float tanf(const float x) _FLOAT_FUNC_REENTRANT
;	---------------------------------
; Function tanf
; ---------------------------------
_tanf:
	push	ix
	ld	ix,#0
	add	ix,sp
;../tanf.c:27: return tancotf(x, 0);
	ld	hl,#0x0000
	push	hl
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	ld	l,4 (ix)
	ld	h,5 (ix)
	push	hl
	call	_tancotf
	pop	af
	pop	af
	pop	af
	ld	b,h
	ld	c,l
	ld	l,c
	ld	h,b
	pop	ix
ret
	.area _CODE
	.area _CABS
