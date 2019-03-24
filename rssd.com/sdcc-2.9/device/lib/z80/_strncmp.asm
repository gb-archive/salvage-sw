;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Sun Apr 11 14:38:24 2010
;--------------------------------------------------------
	.module _strncmp
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _strncmp
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
;../_strncmp.c:26: int strncmp (
;	---------------------------------
; Function strncmp
; ---------------------------------
_strncmp:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;../_strncmp.c:32: if (!count)
	ld	a,8 (ix)
	or	a,9 (ix)
	jr	NZ,00114$
;../_strncmp.c:33: return(0);
	ld	hl,#0x0000
	jp	00108$
;../_strncmp.c:35: while (--count && *first && *first == *last) {
00114$:
	ld	c,4 (ix)
	ld	b,5 (ix)
	ld	a,6 (ix)
	ld	-4 (ix),a
	ld	a,7 (ix)
	ld	-3 (ix),a
	ld	a,8 (ix)
	ld	-2 (ix),a
	ld	a,9 (ix)
	ld	-1 (ix),a
00105$:
	ld	l,-2 (ix)
	ld	h,-1 (ix)
	dec	hl
	ld	-2 (ix),l
	ld	-1 (ix),h
	ld	a,-2 (ix)
	or	a,-1 (ix)
	jr	Z,00107$
	ld	a,(bc)
	ld	d,a
	or	a,a
	jr	Z,00107$
	ld	l,-4 (ix)
	ld	h,-3 (ix)
	ld	e,(hl)
	ld	a,d
	sub	e
	jr	NZ,00107$
;../_strncmp.c:36: first++;
	inc	bc
;../_strncmp.c:37: last++;
	inc	-4 (ix)
	jr	NZ,00118$
	inc	-3 (ix)
00118$:
	jr	00105$
00107$:
;../_strncmp.c:40: return( *first - *last );
	ld	a,(bc)
	ld	c,a
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
00108$:
	ld	sp,ix
	pop	ix
ret
	.area _CODE
	.area _CABS
