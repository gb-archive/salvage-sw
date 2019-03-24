;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Apr  7 2010) (MINGW32)
; This file was generated Fri Jun 11 23:46:52 2010
;--------------------------------------------------------
	.module labs
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _labs
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
;../labs.c:23: long int labs(long int j)
;	---------------------------------
; Function labs
; ---------------------------------
_labs:
	
	push	af
	push	af
;../labs.c:25: return (j >= 0) ? j : -j;
	lda	hl,9(sp)
	ld	a,(hl)
	rlca
	and	a,#0x01
	ld	c,a
	or	a,a
	sub	a,#0x01
	ld	a,#0x00
	rla
	ld	c,a
	or	a,a
	jp	Z,00103$
	lda	hl,6(sp)
	ld	d,h
	ld	e,l
	lda	hl,0(sp)
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl+),a
	inc	de
	ld	a,(de)
	ld	(hl),a
	jp	00104$
00103$:
	ld	de,#0x0000
	ld	a,e
	lda	hl,6(sp)
	sub	a,(hl)
	ld	e,a
	ld	a,d
	inc	hl
	sbc	a,(hl)
	push	af
	lda	hl,3(sp)
	ld	(hl-),a
	ld	(hl),e
	ld	de,#0x0000
	lda	hl,10(sp)
	pop	af
	ld	a,e
	sbc	a,(hl)
	ld	e,a
	ld	a,d
	inc	hl
	sbc	a,(hl)
	lda	hl,3(sp)
	ld	(hl-),a
	ld	(hl),e
00104$:
	lda	hl,0(sp)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	a,(hl+)
	ld	h,(hl)
	ld	l,a
00101$:
	lda	sp,4(sp)
ret
	.area _CODE
	.area _CABS
