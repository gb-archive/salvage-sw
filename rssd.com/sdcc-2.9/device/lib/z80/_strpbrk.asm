;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Sun Apr 11 14:38:24 2010
;--------------------------------------------------------
	.module _strpbrk
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _strpbrk
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
;../_strpbrk.c:26: char * strpbrk ( 
;	---------------------------------
; Function strpbrk
; ---------------------------------
_strpbrk:
	push	ix
	ld	ix,#0
	add	ix,sp
;../_strpbrk.c:33: while ( ch = *string ) {
	ld	c,4 (ix)
	ld	b,5 (ix)
00103$:
	ld	a,(bc)
	ld	e,a
	ld	d,e
	xor	a,a
	or	a,e
	jr	Z,00105$
;../_strpbrk.c:34: if (strchr (control, ch ))
	push	bc
	push	de
	inc	sp
	ld	l,6 (ix)
	ld	h,7 (ix)
	push	hl
	call	_strchr
	pop	af
	inc	sp
	ex	de,hl
	pop	bc
	ld	a,e
	or	a,d
	jr	Z,00103$
;../_strpbrk.c:35: return string ;
	ld	l,c
	ld	h,b
	jr	00106$
00105$:
;../_strpbrk.c:38: return (NULL);
	ld	hl,#0x0000
00106$:
	pop	ix
ret
	.area _CODE
	.area _CABS
