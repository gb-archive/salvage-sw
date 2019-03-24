;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Sun Apr 11 14:38:23 2010
;--------------------------------------------------------
	.module _strcmp
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _strcmp
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
;../_strcmp.c:29: int strcmp (
;	---------------------------------
; Function strcmp
; ---------------------------------
_strcmp:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-5
	add	hl,sp
	ld	sp,hl
;../_strcmp.c:38: char * src = asrc;
	ld	a,4 (ix)
	ld	-2 (ix),a
	ld	a,5 (ix)
	ld	-1 (ix),a
;../_strcmp.c:39: char * dst = adst;
	ld	a,6 (ix)
	ld	-4 (ix),a
	ld	a,7 (ix)
	ld	-3 (ix),a
;../_strcmp.c:41: while( ! (*src - *dst) && *dst)
00102$:
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	e,(hl)
	ld	a,e
	rla	
	sbc	a,a
	ld	d,a
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	a,(hl)
	ld	-5 (ix),a
	ld	c, a
	ld	a,-5 (ix)
	rla	
	sbc	a,a
	ld	b,a
	ld	a,e
	sub	a,c
	ld	e,a
	ld	a,d
	sbc	a,b
	or	a,e
	jr	NZ,00104$
	xor	a,a
	or	a,-5 (ix)
	jr	Z,00104$
;../_strcmp.c:42: ++src, ++dst;
	inc	-2 (ix)
	jr	NZ,00110$
	inc	-1 (ix)
00110$:
	inc	-4 (ix)
	jr	NZ,00111$
	inc	-3 (ix)
00111$:
	jr	00102$
00104$:
;../_strcmp.c:44: return *src - *dst;
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	ld	c,(hl)
	ld	a,c
	rla	
	sbc	a,a
	ld	b,a
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	e,(hl)
	ld	a,e
	rla	
	sbc	a,a
	ld	d,a
	ld	a,c
	sub	a,e
	ld	l,a
	ld	a,b
	sbc	a,d
	ld	h,a
	ld	sp,ix
	pop	ix
ret
	.area _CODE
	.area _CABS
