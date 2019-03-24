;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Fri Jun 11 23:46:56 2010
;--------------------------------------------------------
	.module _strpbrk
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _strpbrk
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
	
	push	af
;../_strpbrk.c:33: while ( ch = *string ) {
	lda	hl,4(sp)
	ld	a,(hl+)
	ld	e,(hl)
	lda	hl,0(sp)
	ld	(hl+),a
	ld	(hl),e
00103$:
	lda	hl,0(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	a,(de)
	ld	c,a
	ld	b,c
	xor	a,a
	or	a,c
	jp	Z,00105$
;../_strpbrk.c:34: if (strchr (control, ch ))
	push	bc
	inc	sp
	lda	hl,7(sp)
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
	push	hl
	call	_strchr
	lda	sp,3(sp)
	ld	b,d
	ld	c,e
	ld	a,c
	or	a,b
	jp	Z,00103$
;../_strpbrk.c:35: return string ;
	lda	hl,0(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	jp	00106$
00105$:
;../_strpbrk.c:38: return (NULL);
	ld	de,#0x0000
00106$:
	lda	sp,2(sp)
ret
	.area _CODE
	.area _CABS
