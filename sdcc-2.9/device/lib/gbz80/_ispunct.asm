;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Fri Jun 11 23:46:53 2010
;--------------------------------------------------------
	.module _ispunct
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _ispunct
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
	
;../_ispunct.c:28: if (isprint (c)    && 
	lda	hl,2(sp)
	ld	a,(hl)
	push	af
	inc	sp
	call	_isprint
	lda	sp,1(sp)
	ld	c,e
	xor	a,a
	or	a,c
	jp	Z,00102$
;../_ispunct.c:29: !islower(c)     && 
	lda	hl,2(sp)
	ld	a,(hl)
	push	af
	inc	sp
	call	_islower
	lda	sp,1(sp)
	ld	c,e
	xor	a,a
	or	a,c
	jp	NZ,00102$
;../_ispunct.c:30: !isupper(c)     &&
	lda	hl,2(sp)
	ld	a,(hl)
	push	af
	inc	sp
	call	_isupper
	lda	sp,1(sp)
	ld	c,e
	xor	a,a
	or	a,c
	jp	NZ,00102$
;../_ispunct.c:31: c != ' '        &&
	lda	hl,2(sp)
	ld	a,(hl)
	sub	a,#0x20
	jp	Z,00102$
00114$:
;../_ispunct.c:32: !isdigit(c)) 
	lda	hl,2(sp)
	ld	a,(hl)
	push	af
	inc	sp
	call	_isdigit
	lda	sp,1(sp)
	ld	c,e
	xor	a,a
	or	a,c
	jp	NZ,00102$
;../_ispunct.c:33: return 1;
	ld	e,#0x01
	jp	00107$
00102$:
;../_ispunct.c:34: return 0;
	ld	e,#0x00
00107$:
	
ret
	.area _CODE
	.area _CABS
