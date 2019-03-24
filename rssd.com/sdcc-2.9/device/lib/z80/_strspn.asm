;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Sun Apr 11 14:38:25 2010
;--------------------------------------------------------
	.module _strspn
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _strspn
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
;../_strspn.c:26: int strspn (
;	---------------------------------
; Function strspn
; ---------------------------------
_strspn:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;../_strspn.c:34: while (ch = *string) {
	ld	-2 (ix),#0x00
	ld	-1 (ix),#0x00
	ld	e,4 (ix)
	ld	d,5 (ix)
00104$:
	ld	a,(de)
	ld	c,a
	ld	b,c
	xor	a,a
	or	a,c
	jr	Z,00106$
;../_strspn.c:35: if ( strchr(control,ch) )
	push	de
	push	bc
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_strchr
	pop	af
	inc	sp
	ld	b,h
	ld	c,l
	pop	de
	ld	a,c
	or	a,b
	jr	Z,00106$
;../_strspn.c:36: count++ ;
	inc	-2 (ix)
	jr	NZ,00113$
	inc	-1 (ix)
00113$:
;../_strspn.c:39: string++ ;
	inc	de
	jr	00104$
00106$:
;../_strspn.c:42: return count ;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	sp,ix
	pop	ix
ret
	.area _CODE
	.area _CABS
