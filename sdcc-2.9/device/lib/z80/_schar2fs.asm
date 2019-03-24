;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Sun Apr 11 14:38:06 2010
;--------------------------------------------------------
	.module _schar2fs
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl ___schar2fs
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
;../_schar2fs.c:45: float __schar2fs (signed char sc) {
;	---------------------------------
; Function __schar2fs
; ---------------------------------
___schar2fs:
	push	ix
	ld	ix,#0
	add	ix,sp
;../_schar2fs.c:46: return __slong2fs(sc);
	ld	c,4 (ix)
	ld	a,4 (ix)
	rla	
	sbc	a,a
	ld	b,a
	ld	l,a
	ld	h,a
	push	hl
	push	bc
	call	___slong2fs
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
