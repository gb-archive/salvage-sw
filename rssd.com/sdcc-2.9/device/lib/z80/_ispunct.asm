;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Sun Apr 11 14:38:22 2010
;--------------------------------------------------------
	.module _ispunct
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _ispunct
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
;../_ispunct.c:25: char ispunct (unsigned char c) 
;	---------------------------------
; Function ispunct
; ---------------------------------
_ispunct:
	push	ix
	ld	ix,#0
	add	ix,sp
;../_ispunct.c:28: if (isprint (c)    && 
	ld	a,4 (ix)
	push	af
	inc	sp
	call	_isprint
	inc	sp
	ld	c,l
	xor	a,a
	or	a,l
	jr	Z,00102$
;../_ispunct.c:29: !islower(c)     && 
	ld	a,4 (ix)
	push	af
	inc	sp
	call	_islower
	inc	sp
	ld	c,l
	xor	a,a
	or	a,l
	jr	NZ,00102$
;../_ispunct.c:30: !isupper(c)     &&
	ld	a,4 (ix)
	push	af
	inc	sp
	call	_isupper
	inc	sp
	ld	c,l
	xor	a,a
	or	a,l
	jr	NZ,00102$
;../_ispunct.c:31: c != ' '        &&
	ld	a,4 (ix)
	sub	a,#0x20
	jr	Z,00102$
;../_ispunct.c:32: !isdigit(c)) 
	ld	a,4 (ix)
	push	af
	inc	sp
	call	_isdigit
	inc	sp
	ld	c,l
	xor	a,a
	or	a,l
	jr	NZ,00102$
;../_ispunct.c:33: return 1;
	ld	l,#0x01
	jr	00107$
00102$:
;../_ispunct.c:34: return 0;
	ld	l,#0x00
00107$:
	pop	ix
ret
	.area _CODE
	.area _CABS
